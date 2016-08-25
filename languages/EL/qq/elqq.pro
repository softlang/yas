:- quasi_quotation_syntax(el).

el(Content, _Vars, _Dict, Term) :-
   phrase_from_quasi_quotation(elqqParser:expr(Term), Content).
