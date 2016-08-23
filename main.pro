% Load the prelude of SLEPRO
:- ['lib/Prolog/syntax.pro'].
:- ['lib/Prolog/dynamic.pro'].
:- ['lib/Prolog/multifile.pro'].
:- ['lib/Prolog/data.pro'].
:- ['lib/Prolog/assoc.pro'].
:- ['lib/Prolog/higher-order.pro'].
:- ['lib/Prolog/strategyPrimitives.pro'].
:- ['lib/Prolog/strategySchemes.pro'].
:- ['lib/Prolog/generics.pro'].
:- ['lib/Prolog/io.pro'].
:- ['lib/Prolog/test.pro'].
:- ['lib/Prolog/scanning.pro'].
:- ['lib/Prolog/http.pro'].
:- ['lib/Prolog/ueber.pro'].         

% UEBER-based processing of all code
:- init.
:- preprocess(languages), ueberRun.
:- halt.
