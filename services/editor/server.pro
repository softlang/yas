% Service EDITOR: A simple metamodel-driven structure editor

% Import
:- ensure_loaded('../../packages/prelude.pro').
:- ensure_loaded('../../packages/mm.pro').
:- ensure_loaded('../../packages/mt.pro').
:- ensure_loaded('../../packages/pp.pro').

% Server components
:- ['runtime.pro'].
:- ['session.pro'].
:- ['controller.pro'].

% View (pages)
:- ['view/metamodels.pro'].
:- ['view/classes.pro'].
:- ['view/new.pro'].
:- ['view/add.pro'].
:- ['view/remove.pro'].
:- ['view/edit.pro'].
:- ['view/show.pro'].

% Metamodels
:- loadMetamodel('../../languages/expr/mm.graph').
:- loadMetamodel('../../languages/family/mm1.graph').
:- loadMetamodel('../../languages/mml/mm.graph').

% Server
editor_main :-
  service_http(editor_handlers).
