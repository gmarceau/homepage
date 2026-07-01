---
title: "The Case for Analysis Preserving Language Transformation"
date: 2006-05-01
authors: ["X. Zhang", "L. Koved", "M. Pistoia", "S. Weber", "T. Jaeger", "G. Marceau"]
publication: "International Symposium on Software Testing and Analysis"
publication_type: "Conference proceedings"
abstract: "Static analysis has gained much attention over the past few years in applications such as bug finding and program verification. As software becomes more complex and componentized, it is common for software systems and applications to be implemented in multiple languages. There is thus a strong need for developing analysis tools for multi-language software. We introduce a technique called Analysis Preserving Language Transformation (aplt) that enables the analysis of multi-language software, and also allows analysis tools for one language to be applied to programs written in another. aplt preserves data and control flow information needed to perform static analyses, but allows the translation to deviate from the original program's semantics in ways that are not pertinent to the particular analysis. We discuss major technical difficulties in building such a translator, using a C-to-Java translator as an example. We demonstrate the feasibility and effectiveness of aplt using two usage cases: analysis of the Java runtime native methods and reuse of Java analysis tools for C. Our preliminary results show that a control- and data-flow equivalent model for native methods can eliminate unsoundness and produce reliable results, and that aplt enables seamless reuse of analysis tools for checking high-level program properties."
url_pdf: "/papers/zhang06case.pdf"
---

I always love to say that at IBM I analyzed the Linux kernel for security holes
by using a static analyzer for Java since it sounds impossible. Yet it's just
what we did, and we felt the approach could generalize nicely.
