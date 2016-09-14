% Page rendering object for editing
edit_page(Request) :-

  % URL parsing
  member(search(L), Request),
  member((session=S1), L),
  atom_number(S1, S2),
  editObject(S2).

% Reply for the page
editObject(S) :-
  retrieveSession(S, MmName, Obj),
  metamodel(MmName, MM),
  editObject(S, MM, Obj, Html),
  % Page assembly 
  reply_html_page(
    title('Editable model'),
    form(
      action='show',
      [ 
        h3('Model editing'),
        p(Html),
        input([type=hidden, name=session, value=S], []),
        p(button([type=submit], 'Done'))
      ]
    )
  ).  

% Stateless version of editObject/1
editObject(
  S,
  MM,
  Id&Dict1,
  [b(Id), ' & ', b(ClassN), ul(Items)]
) :-

  % Special treatment of KV pair for class
  lookup(class, Dict1, ClassN),
  remove(class, Dict1, Dict2),

  % Treatment of members
  dictToList(Dict2, L),
  map(editMember(S, MM, ClassN, Id), L, Items).

% Per-member logic
editMember(
  S,
  MM,
  ClassN,
  Id,
  (MemberN, V),
  li(
    [
      MemberN,
      ul(NewHtml)
      | ul(ObjsHtml)
    ]
  )
) :-
     lookupMember(ClassN, MemberN, MM, Member),
     lookup(cardinality, Member, Card),
     (
       ( lookup(class, Card, X),
         member(X, [one, option]),
         V = [_]
       ) ->
         NewHtml = []
       ;
         concreteClassesForMember(MM, ClassN, MemberN, ClassNs),
         map(editAddObject(S, Id, MemberN), ClassNs, NewHtml)
     ),
     map(editRemoveObject(S, MM), V, ObjsHtml).

% Render add operation
editAddObject(
  S, Id, K, ClassN,
  li(['+', ' ', a(href='add?session='+S+'&id='+Id+'&key='+K+'&class='+ClassN, ClassN)])
).

% Render remove operation
editRemoveObject(S, MM, V,
  li(
    [ a(href='remove?session='+S+'&id='+Id, b('-')),
      ' '
    | Html])
) :-
  V = (Id&_),
  editObject(S, MM, V, Html).
