local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Color.new('Function',   '#8e44ad')
Color.new('BackgroundColor' , '#232629')
Color.new('CodeFolding' , '#224e65')
Color.new('BracketMatching' , '#8e44ad')
Color.new('CurrentLine' , '#2A2E32')
Color.new('IconBorder' , '#31363b')
Color.new('IndentationLine' , '#3a3f44')
Color.new('LineNumbers' , '#7a7c7d')
Color.new('CurrentLineNumber' , '#a5a6a8')
Color.new('MarkBookmark' , '#0404bf')
Color.new('MarkBreakpointActive' , '#8b0607')
Color.new('MarkBreakpointReached' , '#6d6e07')
Color.new('MarkBreakpointDisabled' , '#820683')
Color.new('MarkExecution' , '#4d4e50')
Color.new('MarkWarning' , '#f67400')
Color.new('MarkError' , '#da4453')
Color.new('ModifiedLines' , '#c04900')
Color.new('ReplaceHighlight' , '#808021')
Color.new('SavedLines' , '#1c8042')
Color.new('SearchHighlight' , '#218058')
Color.new('TextSelection' , '#2d5c76')
Color.new('Separator' , '#3f4347')
Color.new('SpellChecking' , '#c0392b')
Color.new('TabMarker' , '#4d4d4d')
Color.new('TemplateBackground' , '#31363b')
Color.new('TemplatePlaceholder' , '#123723')
Color.new('TemplateFocusedPlaceholder' , '#123723')
Color.new('TemplateReadOnlyPlaceholder' , '#4d1f24')
Color.new('WordWrapMarker' , '#3a3f44')

-- Group.new('TSFunction',  '#8e44ad', '#232629' , nil)
-- 							     *hl-TSAnnotation*
Group.new('TSAnnotation', nil, nil, nil)
-- For C++/Dart attributes, annotations that can be attached to the code to
-- denote some kind of meta information.

-- 							      *hl-TSAttribute*
Group.new('TSAttribute', nil, nil, nil)
-- (unstable) TODO: docs

-- 								*hl-TSBoolean*
Group.new('TSBoolean', nil, nil, nil)
-- For booleans.

-- 							      *hl-TSCharacter*
Group.new('TSCharacter', nil, nil, nil)
-- For characters.

-- 								*hl-TSComment*
Group.new('TSComment', nil, nil, nil)
-- For comment blocks.

-- 							    *hl-TSConditional*
Group.new('TSConditional', nil, nil, nil)
-- For keywords related to conditionnals.

-- 							       *hl-TSConstant*
Group.new('TSConstant', nil, nil, nil)
-- For constants

-- 							   *hl-TSConstBuiltin*
Group.new('TSConstBuiltin', nil, nil, nil)
-- For constant that are built in the language: `nil` in Lua.

-- 							     *hl-TSConstMacro*
Group.new('TSConstMacro', nil, nil, nil)
-- For constants that are defined by macros: `NULL` in C.

-- 							    *hl-TSConstructor*
Group.new('TSConstructor', nil, nil, nil)
-- For constructor calls and definitions: `{}` in Lua, and Java constructors.

-- 								  *hl-TSError*
Group.new('TSError', nil, nil, nil)
-- For syntax/parser errors.

-- 							      *hl-TSException*
Group.new('TSException', nil, nil, nil)
-- For exception related keywords.

-- 								  *hl-TSField*
Group.new('TSField', nil, nil, nil)
-- For fields.

-- 								  *hl-TSFloat*
Group.new('TSFloat', nil, nil, nil)
-- For floats.

-- 							       *hl-TSFunction*
Group.new('TSFunction', colors.Function , colors.BackgroundColor, nil)
-- For function (calls and definitions).

-- 							    *hl-TSFuncBuiltin*
Group.new('TSFuncBuiltin', nil, nil, nil)
-- For builtin functions: `table.insert` in Lua.

-- 							      *hl-TSFuncMacro*
Group.new('TSFuncMacro', nil, nil, nil)
-- For macro defined fuctions (calls and definitions): each `macro_rules` in
-- Rust.

-- 								*hl-TSInclude*
Group.new('TSInclude', nil, nil, nil)
-- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require`
-- in Lua.

-- 								*hl-TSKeyword*
Group.new('TSKeyword', nil, nil, nil)
-- For keywords that don't fall in previous categories.

-- 							*hl-TSKeywordFunction*
Group.new('TSKeywordFunction', nil, nil, nil)
-- For keywords used to define a fuction.

-- 							*hl-TSKeywordOperator*
Group.new('TSKeywordOperator', nil, nil, nil)
-- for operators that are English words, e.g. `and`, `as`, `or`.

-- 							  *hl-TSKeywordReturn*
Group.new('TSKeywordReturn', nil, nil, nil)
-- for the `return` and `yield` keywords.

-- 								  *hl-TSLabel*
Group.new('TSLabel', nil, nil, nil)
-- For labels: `label:` in C and `:label:` in Lua.

-- 								 *hl-TSMethod*
Group.new('TSMethod', nil, nil, nil)
-- For method calls and definitions.

-- 							      *hl-TSNamespace*
Group.new('TSNamespace', nil, nil, nil)
-- For identifiers referring to modules and namespaces.

-- 								     *hl-None*
Group.new('TSNone', nil, nil, nil)
-- For no highlighting.

-- 								 *hl-TSNumber*
Group.new('TSNumber', nil, nil, nil)
-- For all numbers

-- 							       *hl-TSOperator*
Group.new('TSOperator', nil, nil, nil)
-- For any operator: `+`, but also `->` and `*` in C.

-- 							      *hl-TSParameter*
Group.new('TSParameter', nil, nil, nil)
-- For parameters of a function.

-- 						     *hl-TSParameterReference*
Group.new('TSParameterReference', nil, nil, nil)
-- For references to parameters of a function.

-- 							       *hl-TSProperty*
Group.new('TSProperty', nil, nil, nil)
-- Same as Group.new('TSField', nil, nil, nil).

-- 							 *hl-TSPunctDelimiter*
Group.new('TSPunctDelimiter', nil, nil, nil)
-- For delimiters ie: `.`

-- 							   *hl-TSPunctBracket*
Group.new('TSPunctBracket', nil, nil, nil)
-- For brackets and parens.

-- 							   *hl-TSPunctSpecial*
Group.new('TSPunctSpecial', nil, nil, nil)
-- For special punctutation that does not fall in the catagories before.

-- 								 *hl-TSRepeat*
Group.new('TSRepeat', nil, nil, nil)
-- For keywords related to loops.

-- 								 *hl-TSString*
Group.new('TSString', nil, nil, nil)
-- For strings.

-- 							    *hl-TSStringRegex*
Group.new('TSStringRegex', nil, nil, nil)
-- For regexes.

-- 							   *hl-TSStringEscape*
Group.new('TSStringEscape', nil, nil, nil)
-- For escape characters within a string.

-- 							  *hl-TSStringSpecial*
Group.new('TSStringSpecial', nil, nil, nil)
-- For strings with special meaning that don't fit into the above categories.

-- 								 *hl-TSSymbol*
Group.new('TSSymbol', nil, nil, nil)
-- For identifiers referring to symbols or atoms.

-- 								    *hl-TSTag*
Group.new('TSTag', nil, nil, nil)
-- Tags like html tag names.

-- 							   *hl-TSTagAttribute*
Group.new('TSTagAttribute', nil, nil, nil)
-- For html tag attributes.

-- 							   *hl-TSTagDelimiter*
Group.new('TSTagDelimiter', nil, nil, nil)
-- Tag delimiter like `<` `>` `/`

-- 								   *hl-TSText*
Group.new('TSText', nil, nil, nil)
-- For strings considered text in a markup language.

-- 								 *hl-TSSTrong*
Group.new('TSStrong', nil, nil, nil)
-- For text to be represented in bold.

-- 							       *hl-TSEmphasis*
Group.new('TSEmphasis', nil, nil, nil)
-- For text to be represented with emphasis.

-- 							      *hl-TSUnderline*
Group.new('TSUnderline', nil, nil, nil)
-- For text to be represented with an underline.

-- 								 *hl-TSStrike*
Group.new('TSStrike', nil, nil, nil)
-- For strikethrough text.

-- 								  *hl-TSTitle*
Group.new('TSTitle', nil, nil, nil)
-- Text that is part of a title.

-- 								*hl-TSLiteral*
Group.new('TSLiteral', nil, nil, nil)
-- Literal text.

-- 								    *hl-TSURI*
Group.new('TSURI', nil, nil, nil)
-- Any URI like a link or email.

-- 								   *hl-TSMath*
Group.new('TSMath', nil, nil, nil)
-- For LaTex-like math environments.

-- 							  *hl-TSTextReference*
Group.new('TSTextReference', nil, nil, nil)
-- For footnotes, text references, citations.

-- 							     *hl-TSEnvironment*
Group.new('TSEnvironment', nil, nil, nil)
-- For text environments of markup languages.

-- 							 *hl-TSEnvironmentName*
Group.new('TSEnvironmentName', nil, nil, nil)
-- For the name/the string indicating the type of text environment.

-- 								   *hl-TSNote*
Group.new('TSNote', nil, nil, nil)
-- Text representation of an informational note.

-- 								   *TSWarning*
Group.new('TSWarning', nil, nil, nil)
-- Text representation of a warning note.

-- 								    *TSDanger*
Group.new('TSDanger', nil, nil, nil)
-- Text representation of a danger note.

-- 								   *hl-TSType*
Group.new('TSType', nil, nil, nil)
-- For types.

-- 							    *hl-TSTypeBuiltin*
Group.new('TSTypeBuiltin', nil, nil, nil)
-- For builtin types.

-- 							       *hl-TSVariable*
Group.new('TSVariable', nil, nil, nil)
-- Any variable name that does not have another highlight.

-- 							*hl-TSVariableBuiltin*
Group.new('TSVariableBuiltin', nil, nil, nil)
-- Variable names that are defined by the languages, like `this` or `self`.
