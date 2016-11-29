% Foreign Function Interface of YAS with support of Java, Python, and Haskell

:- module(ueberFFI, []).

language(java).
language(python).
language(haskell).

%
% Conditional execution:
% a) execute non-FFI code
% b) execute FFI code, if in FFI mode
%
if(F, G) :-
    ( \+ language(F), call(G)
    ; language(F), mode(ffi), call(G)
    ; language(F), \+ mode(ffi)		  
    ).  

%
% Apply predicate or FFI function T to arguments L
%
invoke(Pred, Args, InLs, OutLs, InArgs, OutArgs) :-
    Pred =.. [Sym|_],
    ( member(Sym, [java, python, haskell]) ->
          apply(Pred, [Args, InLs, OutLs, InArgs, OutArgs])
    ;
          concat([Args, InArgs, OutArgs], AllArgs),
          apply(Pred, AllArgs)
    ).


%
% FFI for Java
%
java(Class, [This], [L], [], [X], []) :-
    
    % Adjust CLASSPATH
    atomic_list_concat(['lib/Java/antlr-4.5.3-complete.jar:', This], CP),
    setenv('CLASSPATH', CP),

    % Write text to temporary file
    writeTmpFile(F, L, X),

    % Run Java class
    atomic_list_concat(['java', ' ', Class, ' ', F, ' 2>/dev/null'], RunCommand),
    shell(RunCommand, ExitRun),
    !,
    ExitRun == 0. 

%
% FFI for Python
%
python(Module, [This], [L], [], [X], []) :-
    
    % Adjust PYTHONPATH
    atomic_list_concat([This], PP),
    setenv('PYTHONPATH', PP),

    % Write text to temporary file
    writeTmpFile(F, L, X),

    % Run python script on file
    atomic_list_concat(['python ', This, '/', Module, '.py ', F], RunCommand),
    !,
    shell(RunCommand, ExitRun),
    ExitRun == 0. 

python(Module, [This], [L1], [L2], [X1], [X2]) :-

    % Adjust PYTHONPATH
    atomic_list_concat([This], PP),
    setenv('PYTHONPATH', PP),

    % Write text to temporary file
    writeTmpFile(F1, L1, X1),

    % Generate temporary text filename
    tmpFilename(L2, F2),
    
    % Run python script on file
    atomic_list_concat(['python ', This, '/', Module, '.py ', F1, ' ', F2], RunCommand),
    !,
    shell(RunCommand, ExitRun),
    ExitRun == 0,
    ueberIO:readFile(F2, L2, X2).   

%
% FFI for Haskell
%
haskell(Module, [This], [L], [], [X], []) :-

    % Write argument to temporary file
    writeTmpFile(F, L, X),

    % Compile module with main function
    atomic_list_concat(['ghc -i.:', This, ':lib/Haskell -main-is ', Module, ' ', Module, ' -o tmp/', Module, '.run'], CompileCommand),
    !,
    shell(CompileCommand, ExitCompile),
    ExitCompile == 0,

    % Run main function on file
    atomic_list_concat(['tmp/', Module, '.run ', F], RunCommand),
    !,
    shell(RunCommand, ExitRun),
    ExitRun == 0. 

%
% Write content to temporary file
%
writeTmpFile(F, L, C) :-
    tmpFilename(L, F),
    ueberIO:writeFile(F, L, C).

%
% Generate temporary filename
%
tmpFilename(L, F) :-
    languageToBase(L, B),
    nb_getval(tmp, N1),
    N2 is N1 + 1,
    nb_setval(tmp, N2),
    atomic_list_concat(['tmp', '/', N1, '.', B], F).
