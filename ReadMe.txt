This is a copy of README.md; the filename ReadMe.txt is as requested by ACM.

# An "artifact repository" for a conference publication

* Relevant conference: http://www.sleconf.org/2016
* Relevant artifact evaluation: http://www.sleconf.org/2016/ArtifactEvaluation.html
* Relevant paper at conference: "Coupled Software Transformations-Revisited"
* Author of paper and artifact: Ralf Lämmel, rlaemmel@gmail.com
* Nature of artifact: Collection of self-checking Prolog et al. code

# Preamble

* The "artifact" is maintained here: https://github.com/softlang/yas/tree/sle16
* The artifact is a branch of this repo: https://github.com/softlang/yas/

# Download artifact from github

* Clone softlang/yas repo.
* Checkout sle16 branch.

# Prerequisites for running

The snapshotted version has been tested with the following prerequisites:

* Mac OS 10.11.6
* SWI-Prolog 7.2.3
* GNU Make 3.81

Other information:
* Other nearby enough versions of Mac OS, SWI-Prolog, make can be assumed to work.
* Linux (such as ubuntu) can be assumed to work.
* No promises are made for this code to work on Windows.

# Running the code

Strictly speaking, the code does not need to be run because the repo
holds all primary and derived files. Running the code only means that
"self-checking" is performed so that all properties of the code,
e.g., memberships of files in languages, are verified; all derived
files are checked are re-derived in the sense of regression testing.

* Go to the yas directory.
* Enter "make"

The make process will run for several seconds and produce all kinds of console output.
The process should finish successfully and produce this final verdict:

<pre>
103 languages.
552 files.
552 membership tests.
118 functions.
387 function applications.
</pre>

This means that all files and relationships have been checked.
This includes checking the megamodels from the paper and their compilation.

# Links between paper and artifact

Files in the artifact repo are consistently linked from the
paper. That is, clicking linked filenames in paper, takes one to the
sle16 branch of the softlang/yas repo. For instance, the first file in
the paper is the "LAL megamodel language" in Section 3.1. If one
hovers over "language", then this reveals the link
https://github.com/softlang/yas/blob/sle16/languages/LAL/lib/language.lal
which directly takes one to the github repo softlang/yas.

# Advice on inspection of the artifact

Overall, the underlying paper links to the important artifacts while
the repo contains additional details, e.g., additional
megamodels. Thus, the paper may be best suited for inspecting the
artifact. Additionally, some pointers are provided here. That is, the
coupled transformation example of Section 5 of the paper is summarized
here in terms of the involved files.

## Ingredients of the transformation

* The initial signature
 * [... in concrete syntax sig1.bsl](languages/BSTL/tests/sig1.bsl)
 * [... in abstract syntax sig1.term](languages/BSTL/tests/sig1.term)
* The evolved signature
 * [... in concrete syntax sig2.bsl](languages/BSTL/tests/sig2.bsl)
 * [... in abstract syntax sig2.term](languages/BSTL/tests/sig2.term)
* [The initial term term1.term](languages/BSTL/tests/term1.term)
* [The co-evolved term term2.term](languages/BSTL/tests/term2.term)
* [The coupled transformation trafo1.term](languages/BSTL/tests/trafo1.term)
* [The syntax of the transformation language](languages/BSTL/as.esl)
* [The syntax of signatures](languages/BSL/as.esl)
* The coupled transformation
 * [Term-level interpretation](languages/BSTL/bstlTerm.pro)
 * [Signature-level interpretation](languages/BSTL/bstlSig.pro)

## Megamodeling ingredients

* LAL megamodel
 * [Before inlining](languages/LAL/lib/cx/cotransformation.lal)
 * [After inlining](languages/LAL/lib/cx/cotransformation.lal2)
* [Ueber megamodel (test-case description)](languages/BSTL/tests/trafo1.ueber)
* [Configuration of translation](languages/LAL/lib/cx/cotransformation.lalconfig)

As said earlier, all the mentioned files are part of the
artifact. Running the code merely verifies that the artifact is
consistent; see above.
