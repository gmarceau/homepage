+++
date = 2016-10-04
draft = false
tags = []
title = "FRP Needs Simultaneousness"
math = true

summary = """Functional reactive programming may be missing key distinction
between event time and event deconstruction."""

[header]
# image = "headers/getting-started.png"
#caption = "Image credit: [**Academic**](https://github.com/gcushen/hugo-academic/)"

+++

When we finished publishing the FrTime sequence of papers, I became convinced
that a notion of simultaneous events was needed to make FRP work well in
practice.

When we implemented exploratory demos, the pattern that occurred frequently was
decomposition-recomposition. It is a pattern which is natural when using
functions which become oddly difficult in FRP.

I’ll use the most.js frp library to illustrate.

```javascript
var _ = require('underscore')
var most = require('most')
// Setup
const square = x => x * x
const dbl = x => x + x
const points = [{x: 1, y: 2}, {x: 3, y: 4}, {x:5, y:6}]
const pointStream = most.from(points)
```

This is natural:

```javascript
const squaredPoints =
  _.map(points, ({x, y}) => ({ x: dbl(x), y: square(y) }))
```

This is also fine:

```javascript
const pointSquaredStream =
   pointStream.map(({x, y}) => ({x: dbl(x), y: square(y) }))
```

But once we start reconstructing, we run into trouble. So let’s deconstruct:

```javascript
const xDoubleStream = pointStream.map(p => p.x).map(dbl)
const ySquareStream = pointStream.map(p => p.y).map(square)

// And then reconstruct:

const makePoint = (x, y) => ({x, y})
```

# Reconstructing using zip

```javascript
   most.zip(makePoint, xDoubleStream, ySquareStream)
```

`zip` behaves well in the normal case. However, it fails non-gracefully in the
presence of bugs.

In the case of mismatched numbers of points, zip buffers the longer stream
silently, consuming memory until a long-delay out-of-memory error. This would be
very hard to debug.

```javascript
most.zip(makePoint,
         xDoubleStream.concat(xDoubleStream),
         ySquareStream)
```
Reconstructing with zip can also lead to incorrect results for simple
mistakes where a fail-fast error message would have been preferable.

```javascript
most.zip(makePoint,
         xDoubleStream.filter(x => x > 3),
         ySquareStream.filter(y => y > 3))
```

Here, the points `{ x: 6, y: 4 }` and `{ x: 10, y: 16 }` are produced, which
isn’t what was intended since they pair the input points across. But the error
is subtle and would be hard to track down, especially if the processing was
intricate.

This case is particularly interesting since it teases apart two different
notions of simultaneity. Since we defined points by invoking `most.from` on an
array, the events are occurring _at the same moment in time_. That’s the first
notion — time-based simultaneity. However, when the bug occurs the values being
ziped are _not derived from the same event via deconstruction_. That’s the second
notion — value-based simultaneity.

I’ll claim that in an FRP context, this second notion of simultaneousness,
value-based simultaneity, is the important one.

Now let’s look at the second manner of reconstructing.

# Reconstructing using `combine`,

```javascript most.combine(makePoint, xDoubleStream, ySquareStream) ``` This
code produces three events `{ x: 10, y: 4 }`, `{ x: 10, y: 16 }`, and `{ x: 10,
y: 36 }`. It is only because of the notion of simultaneity that three events are
produced. Without simultaneity, we should expect six events. Willingly or not,
`most`’s implementation of `combine` detects that the event on `xDoubleStream` and
`ySquareStream` are occurring at the same time and absorbs the glitches.

This behavior violates what is expected from combine when reading the documentation:

> combine: create a new stream that emits the set of latest event values from
> all input streams whenever a new event arrives on any input stream.

In order to fix combine, either the documentation needs to be modified to
document this behavior, which would require defining simultaneousness. In
particular, it would require choosing and articulating the difference between
time-based simultaneity and value-based simultaneity. Alternatively, the
implementation of combine has to change to maintain the six-events output even
in the presence of simultaneous events.

# How to fix this

The big open question is, should the semantic of a FRP framework incorporate an
explicit notion of simultaneity, along with combiners to manipulate
simultaneity?

When we wrapped up the FrTime effort, if we had worked on it more I would have
implemented apply and lift and then tried building some stuff with them. To be
fair, Greg Cooper was skeptical. I think he had a different approach in mind.

The idea is that zip and combine are great combiners, they should not be
repurposed and instead new operators should be introduced specifically to make
the deconstruct-reconstruct pattern easy and reliable in the fail-fast-fail-loud
sense.

The combiners could be defined as follow:

`apply`: same zip, but errors if the events are not simultaneous.
```javascript
most.apply(makePoint, xDoubleStream, ySquareStream)
```

`lift`: consumes a function f on normal non-stream values and returns a function
that applies f on the given streams, assuming all events are simultaneous. If
any events are not simultaneous, it errors.

```javascript
const makePointStream = most.lift(makePoint)
makePointStream(xDoubleStream, ySquareStream)
```

But the tricky part would be in the implementation, in particular, the handling
and maintaining of the same-time versus same-value distinction.
