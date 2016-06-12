% Map URLs to handler predicates
editor_handlers :-
  http_handler(root('metamodels'), metamodels_page, []),
  http_handler(root('classes'), classes_page, []),
  http_handler(root('edit'), edit_page, []),
  http_handler(root('show'), show_page, []),
  http_handler(root('new'), new_page, []),
  http_handler(root('add'), add_page, []),
  http_handler(root('remove'), remove_page, []).
