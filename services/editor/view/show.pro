% Page showing object in plain text
show_page(Request) :-

  % URL parsing
  member(search(L), Request),
  member((session=S1), L),
  atom_number(S1, S2),
  showObject(S2).

% Reply for the page
showObject(S) :-

  % Data preparation
  retrieveSession(S, MmName, Obj0),
  metamodel(MmName, MM1),
  
  % Conformance checking
  ( ( 
      relaxMetamodel(MM1, MM2),
      recardinalize(MM2, MM1, Obj0, Obj)
    ) ->
      Conf = true
    ; (
        Conf = false,
        Obj = Obj0
      )
  ),

  % Pretty print object
  ppGraph(Obj, Text1),
  atom_codes(Text2, Text1),

  % Page assembly 
  reply_html_page(
    title('Model editor'),
    form(
      action='edit',
      [ 
        h3('Conformance'),
        b(Conf),
        h3('Pretty-printed model'),
        pre(Text2),
        input([type=hidden, name=session, value=S], []),
        p(button([type=submit], 'Edit'))
      ]
    )
  ).
