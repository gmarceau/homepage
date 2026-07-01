---
title: "Do Values Grow on Trees?: Expression Integrity in Functional Programming"
date: 2011-09-01
authors: ["Guillaume Marceau", "Kathi Fisler", "Shriram Krishnamurthi"]
publication: "SIGCSE International Computing Education Research Workshop"
publication_type: "Conference proceedings"
abstract: "We posit that functional programmers employ a notion called expression integrity to understand programs. We attempt to study the extent to which both novices and experts use this notion as they program, discuss the difficulties that arise in measuring this, and offer some observational findings. From extensive discussions with experienced functional programmers, we find (anecdotally) that when reading, reviewing, and editing programs they understand programs as trees of expressions, not as a sequence of characters. We use the term expression integrity to capture this notion of understanding programs, and examine it in more detail. This concept is especially important in functional programs because everything other than a definition is an expression, even the control operations. We suspect, but don't study here, that this concept also applies to imperative programs that have shallow expressions but do have statements that can nest several levels (e.g., an assignment inside a conditional inside a loop inside a function)."
url_pdf: "/papers/Marceau-2011-Do-Values-Grow-on-Trees.pdf"
---

That was a really fun paper, though too subtle for its own good. We provided
some supporting evidence for the idea that thinking in expression is a key
skills students develop during their first programming course. They transition
from seeing the code as a sequence of letter, the seeing nested expressions. We
did it with an cool custom A* search, and we got statistical significance (which
is always hard in education topic.)
