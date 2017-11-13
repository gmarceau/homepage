+++
title = "The Design and Implementation of a Dataflow Language for Scriptable Debugging"
date = "2006-09-01"

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["G. Marceau", "G. H. Cooper", "J. P. Spiro", "S. Krishnamurthi", "S. P. Reiss"]

# Publication type.
# Legend:
# 0 = Uncategorized
# 1 = Conference proceedings
# 2 = Journal
# 3 = Work in progress
# 4 = Technical report
# 5 = Book
# 6 = Book chapter
publication_types = ["1"]

# Publication name and optional abbreviated version.
publication = "In Automated Software Engineering Journal (ASE) (by invitation)"
#publication_short = "In *ASE*"

# Abstract and optional shortened version.

abstract = "Debugging is a laborious, manual activity that often involves the repetition of common operations. Ideally, users should be able to describe these repetitious operations as little programs. Debuggers should therefore be programmable, or scriptable. The operating environment of these scripts, however, imposes interesting design challenges on the programming language in which these scripts are written. This paper presents our design of a language for scripting debuggers. The language offers powerful primitives that can precisely and concisely capture many important debugging and comprehension metaphors. The paper also describes a pair of debuggers, one for Java and the other for Scheme, built in accordance with these principles. The paper includes concrete examples of applying this debugger to programs."

#abstract_short = ""

# Featured image thumbnail (optional)
image_preview = ""

# Is this a selected publication? (true/false)
selected = false

# Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter the filename (excluding '.md') of your project file in `content/project/`.

# Links (optional).
url_pdf = "http://cs.brown.edu/people/sk/Publications/Papers/Published/mcskr-dataflow-lang-script-debug-journal/paper.pdf"

# Does the content use math formatting?
math = true

# Does the content use source code highlighting?
highlight = true

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""


+++

Now that functional reactive programming is
taking flight for web development, with the Rx frameworks and especially with
[vue.js](https://vuejs.org/), it is fun to go back to its establishing years. In
this paper, we help broaden the range of applicability of FRP. It started as a
technique for simulating electronics signals, then for coding user interface,
and now a technique for responding to events broadly, including those that occur
when doing system programming.
