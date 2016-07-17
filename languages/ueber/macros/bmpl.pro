bmpl(BmplFile) :-
    file_name_extension(Base, bmpl, BmplFile),
    file_name_extension(Base, term, TermFile),
    file_name_extension(Base, pro, PrologFile),
    ueber([
	macro(parseFile(BmplFile)),
        macro(fxy(pp, TermFile, bmpl(term), PrologFile, prolog(text)))
    ]).
