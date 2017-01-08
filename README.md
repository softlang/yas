# An "artifact repository" for a conference publication

* Relevant conference: http://2017.programming-conference.org/
* Relevant paper at conference: "Relationship Maintenance in Software Language Repositories"
* Author of paper and artifact: Ralf Lämmel, rlaemmel@gmail.com
* Nature of artifact: a snapshot of the software language repository YAS

# Preamble

* The "artifact" is maintained here: https://github.com/softlang/yas/tree/programming17
* The artifact is a branch of this repo: https://github.com/softlang/yas/

# Download artifact from github

* Clone softlang/yas repo.
* Checkout programming17 branch.

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
107 languages.
564 files.
564 membership tests.
124 functions.
395 function applications.
</pre>

This means that all files and relationships have been checked.
The Makefile features additional modes of runnning the code.
This also includes an option for running FFI code (external to Prolog).

