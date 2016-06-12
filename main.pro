% Load the prelude of SLEPRO
:- ['prelude/syntax.pro'].
:- ['prelude/dynamic.pro'].
:- ['prelude/multifile.pro'].
:- ['prelude/data.pro'].
:- ['prelude/assoc.pro'].
:- ['prelude/higher-order.pro'].
:- ['prelude/rewriting.pro'].
:- ['prelude/generics.pro'].
:- ['prelude/io.pro'].
:- ['prelude/test.pro'].
:- ['prelude/scanning.pro'].
:- ['prelude/http.pro'].
:- ['prelude/ueber.pro'].         

% UEBER-based processing of all code
:- init.
:- preprocess(languages), ueberRun.
:- halt.
