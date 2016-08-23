% HTTP client/server support

/*

Libraries for HTTP client/server support:
http://www.swi-prolog.org/pldoc/package/http.html
http://www.swi-prolog.org/howto/http/HelloText.html

*/

:- use_module(library(http/html_write)). % server
:- use_module(library(http/http_open)). % client
:- use_module(library(http/http_header)). % client
:- use_module(library(http/http_client)). % client
:- use_module(library(http/thread_httpd)). % Web server 
:- use_module(library(http/http_dispatch)). % Part of web server
:- use_module(library(http/http_server_files)). % Serve files through the web serve
r
:- use_module(library(thread_pool)). % Thread pool for web server
:- use_module(library(http/json)). % Basics of JSON
:- use_module(library(http/json_convert)). % JSON Conversion
:- use_module(library(http/http_json)). % JSON support for HTTP
% :- use_module(library(http/http_error)). % Debugging

% Set up locations for file search
% http:location(static, root(static), [ priority(-100) ]).
% user:file_search_path(static, 'static').

/*

Start an HTTP server.
Important: do not start server by a goal clause as in ":- start_http.". 
This would put the server into the wrong thread.
Instead start server more like this "swipl -q -t main -f ...".

*/

start_http(Handlers) :-

  %
  % Set up a thread pool, if you need one.
  %
  % thread_pool_create(pool, 2, []),
  
  %
  % Register handlers for web requests
  % This should be done (eventually) by concrete services.
  % See the "debug" example below.
  %
%  http_handler(static(.), noindex('static'), []),
%  http_handler(static(.), serve_files_in_directory(static), [prefix]),
  http_handler(root('debug'), debug_http, []),
  Handlers,

  % 
  % Start server
  %
  http_server(http_dispatch, [port(4242),workers(2)]).

/*

Enter http://localhost:4242/debug
With reverse proxy http://localhost/debug

*/

debug_http(Request) :-
        format('Content-type: text/html~n~n', []),
        format('<html>~n', []),
        format('<table border=1>~n'),
        maplist(reqentry,Request),
        format('~n</table>~n'),
        format('</html>~n', []).        

reqentry(X) :-
        X =.. [Name, Value],
        format('<tr><td>~w<td>~w~n', [Name, Value]).


/*

Handle requests until shutdown

*/

service_http(Handlers) :-
  current_prolog_flag(argv,Argv),
  true(append(_,['--',Log],Argv)),
  true(open(Log,write,S,[encoding(utf8)])),
  true(assertz(log(S))),
  !,
  true(start_http(Handlers)),
  format(S,'Server started.~n',[]),
  flush_output(S),
  true(loop_http),
  !,
  format(S,'Server stopped.~n',[]),
  flush_output(S).

loop_http :-
  repeat,
  sleep(2),
  exists_file(shutdown),
  !,
  delete_file(shutdown),
  http_stop_server(4242, []).
