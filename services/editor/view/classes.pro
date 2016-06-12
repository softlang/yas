% Page for class selection
classes_page(Request) :-

  % Data preparation
  member(search(L), Request),
  member((metamodel=MmName), L),
  metamodel(MmName, MM),
  concreteClassesOfMetamodel(MM, Names1),
  sort(Names1, Names2),

  % Page creation
  map(classes_page_(MmName), Names2, Items),
  reply_html_page(
    title('Model editor'),
    [
      h3('Class selection'),
      ul(Items)
    ]
  ).

% HTML LI item per class
classes_page_(
  MmName,
  ClassName,
  li(a(href='new?metamodel='+MmName+'&class='+ClassName, ClassName))
).
