% Load some general modules
:- use_module(library(pure_input)).
:- use_module(library(dcg/basics)).
:- use_module(library(quasi_quotations)).

% Load the prelude of SLEPRO
:- ['lib/Prolog/syntax.pro'].
:- ['lib/Prolog/dynamic.pro'].
:- ['lib/Prolog/multifile.pro'].
:- ['lib/Prolog/data.pro'].
:- ['lib/Prolog/assoc.pro'].
:- ['lib/Prolog/higher-order.pro'].
:- ['lib/Prolog/strategyBasics.pro'].
:- ['lib/Prolog/strategySchemes.pro'].
:- ['lib/Prolog/logvars.pro'].
:- ['lib/Prolog/generics.pro'].
:- ['lib/Prolog/io.pro'].
:- ['lib/Prolog/test.pro'].
:- ['lib/Prolog/scanning.pro'].
:- ['lib/Prolog/http.pro'].
:- ['lib/Prolog/ueber.pro'].         

% UEBER-based processing of all code
:- init.
:- preprocess(languages), ueberRun.
:- mode(session); halt.
