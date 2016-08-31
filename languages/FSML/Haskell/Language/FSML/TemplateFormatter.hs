-- BEGIN ...
module Language.FSML.TemplateFormatter where
import Language.FSML.StringTemplate.Syntax
import Text.StringTemplate
import Text.StringTemplate.GenericStandard

-- END ...
templates :: STGroup String
templates = groupStringTemplates [
    ("main", newSTMP "$fsm.states:state(); separator='\n'$"),
    ("state", newSTMP $ unlines [
         "$if(it.initial)$initial $endif$state $it.stateid$ {",
         "$it.transitions:transition(); separator='\n'$",
         "}"
       ]
    ),
    ("transition", newSTMP (
            "  $it.event$\
            \$if(it.action)$/$it.action$$endif$\
            \$if(it.target)$ -> $it.target$$endif$\
            \;"
       )
    )
  ]

format :: Fsm -> String
format fsm =
   let Just t = getStringTemplate "main" templates
     in render $ setAttribute "fsm" fsm t
