% Page for metamodel selection
metamodels_page(_Request) :-

  % Data preparation
  findall(Name, metamodel(Name, _), Names1),
  sort(Names1, Names2),

  % Page creation
  map(metamodels_page_, Names2, Items),
  reply_html_page(
    title('Model editor'),
    [
      h3('Metamodel selection'),
      ul(Items)
    ]
  ).


% HTML LI item per metamodel
metamodels_page_(
  Name,
  li(a(href='classes?metamodel='+Name, Name))
).
