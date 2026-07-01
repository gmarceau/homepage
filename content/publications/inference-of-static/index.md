---
title: "Efficient Inference Of Static Types For Java Bytecode"
date: 2000-01-01
authors: ["Etienne M. Gagnon", "Laurie J. Hendren", "Guillaume Marceau"]
publication: "Static Analysis Symposium"
publication_type: "Conference proceedings"
abstract: "In this paper, we present an efficient and practical algorithm for inferring static types for local variables in a 3-address, stackless, representation of Java bytecode. By decoupling the type inference problem from the low level bytecode representation, and abstracting it into a constraint system, we show that there exists verifiable bytecode that cannot be statically typed. Further, we show that, without transforming the program, the static typing problem is NP-hard. In order to get a practical approach we have developed an algorithm that works efficiently for the usual cases and then applies efficient program transformations to simplify the hard cases. We have implemented this algorithm in the Soot framework. Our experimental results show that all of the 17,000 methods used in our tests were successfully typed, 99.8% of those required only the first stage, 0.2% required the second stage, and no methods required the third stage."
url_pdf: "papers/gagnon00efficient.pdf"
---

I designed the algorithm for the inference of integer types which became a part
of the large Sable static analysis and program modification framework.
