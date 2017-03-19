grammar EiplChecker;
@header {package org.softlang.eipl;}
@members {
public boolean ok = true;
public Env env = new Env();
}

program : scope EOF ;
scope : { env.enterScope(); } 'begin' decl* stmt 'end' { env.exitScope(); } ;
decl :
      'var' NAME '=' expr ';'
      { ok &= env.noClash($NAME.text); env.addVar($NAME.text, $expr.type); }
    |
      'proc' NAME stmt
      { ok &= env.noClash($NAME.text); env.addProc($NAME.text); }
    ;
stmt :
      ';'
    |
      NAME '=' expr ';'
      { ok &= env.isVar($NAME.text) && env.getType($NAME.text) == $expr.type; }
    |
      'call' NAME ';'
      { ok &= env.isProc($NAME.text); }
    |
      scope
    |
      // Remaining statement forms omitted for brevity
      // ...
// BEGIN ...
      'if' '(' expr ')' stmt ('else' stmt)?
      { ok &= $expr.type == Env.Type.BoolType; }      
    |
      'while' '(' expr ')' stmt
      { ok &= $expr.type == Env.Type.BoolType; }      
    |
      '{' stmt* '}'
    |
      'write' expr ';'
// END ...
    ;
expr returns [Env.Type type] :
      INTEGER
      { $type = Env.Type.IntType; }
    |
      NAME
      { ok &= env.isVar($NAME.text); $type = env.getType($NAME.text); }
    |
      expr1=expr '+' expr2=expr
      {
        ok &= $expr1.type == Env.Type.IntType
           && $expr2.type == Env.Type.IntType;
        $type = Env.Type.IntType;
      }
    |
      // Remaining expression forms omitted for brevity
      // ...
// BEGIN ...
// This is a patently incomplete implementation.
      'TODO'
      { $type = Env.Type.NoType; }
 // END ...
    ;
NAME : ('a'..'z'|'A'..'Z')+ ;
INTEGER : ('0'..'9')+ ;
WS : [ \t\n\r]+ -> skip ;
