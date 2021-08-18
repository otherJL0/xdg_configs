local Color, colors, Group, groups, styles = require('colorbuddy').setup()


-- Breeze Dark Theme
Color.new('Alert', '#95da4c')
Color.new('Annotation', '#3f8058')
Color.new('Attribute', '#2980b9')
Color.new('BackgroundColor', '#232629')
Color.new('BaseN', '#f67400')
Color.new('BracketMatching', '#8e44ad')
Color.new('BuiltIn', '#7f8c8d')
Color.new('Char', '#3daee9')
Color.new('CodeFolding', '#224e65')
Color.new('Comment', '#7a7c7d')
Color.new('CommentVar', '#7f8c8d')
Color.new('Constant', '#27aeae')
Color.new('ControlFlow', '#fdbc4b')
Color.new('CurrentLine', '#2A2E32')
Color.new('CurrentLineNumber', '#a5a6a8')
Color.new('DataType', '#2980b9')
Color.new('DecVal', '#f67400')
Color.new('Documentation', '#a43340')
Color.new('Error', '#da4453')
Color.new('Extension', '#0099ff')
Color.new('Float', '#f67400')
Color.new('Function', '#8e44ad')
Color.new('IconBorder', '#31363b')
Color.new('Import', '#27ae60')
Color.new('IndentationLine', '#3a3f44')
Color.new('Information', '#c45b00')
Color.new('Keyword', '#cfcfc2')
Color.new('LineNumbers', '#7a7c7d')
Color.new('MarkBookmark', '#0404bf')
Color.new('MarkBreakpointActive', '#8b0607')
Color.new('MarkBreakpointDisabled', '#820683')
Color.new('MarkBreakpointReached', '#6d6e07')
Color.new('MarkError', '#da4453')
Color.new('MarkExecution', '#4d4e50')
Color.new('MarkWarning', '#f67400')
Color.new('ModifiedLines', '#c04900')
Color.new('Normal', '#cfcfc2')
Color.new('Operator', '#3f8058')
Color.new('Others', '#27ae60')
Color.new('Preprocessor', '#27ae60')
Color.new('RegionMarker', '#2980b9')
Color.new('ReplaceHighlight', '#808021')
Color.new('SavedLines', '#1c8042')
Color.new('SearchHighlight', '#218058')
Color.new('Separator', '#3f4347')
Color.new('SpecialChar', '#3daee9')
Color.new('SpecialString', '#da4453')
Color.new('SpellChecking', '#c0392b')
Color.new('String', '#f44f4f')
Color.new('TabMarker', '#4d4d4d')
Color.new('TemplateBackground', '#31363b')
Color.new('TemplateFocusedPlaceholder', '#123723')
Color.new('TemplatePlaceholder', '#123723')
Color.new('TemplateReadOnlyPlaceholder', '#4d1f24')
Color.new('TextSelection', '#2d5c76')
Color.new('Variable', '#27aeae')
Color.new('VerbatimString', '#da4453')
Color.new('Warning', '#da4453')
Color.new('WordWrapMarker', '#3a3f44')


-- 							     *hl-TSAnnotation*
Group.new('TSAnnotation', colors.Annotation, colors.BackgroundColor, nil)
-- For C++/Dart attributes, annotations that can be attached to the code to
-- denote some kind of meta information.

-- 							      *hl-TSAttribute*
Group.new('TSAttribute', colors.Attribute, colors.BackgroundColor, nil)
-- (unstable) TODO: docs

-- 								*hl-TSBoolean*
-- Group.new('TSBoolean', nil, colors.BackgroundColor, nil)
-- For booleans.

-- 							      *hl-TSCharacter*
Group.new('TSCharacter', colors.Char, colors.BackgroundColor, nil)
-- For characters.

-- 								*hl-TSComment*
Group.new('TSComment', colors.Comment, colors.BackgroundColor, nil)
-- For comment blocks.

-- 							    *hl-TSConditional*
Group.new('TSConditional', colors.ControlFlow, colors.BackgroundColor, nil)
-- For keywords related to conditionnals.

-- 							       *hl-TSConstant*
Group.new('TSConstant', colors.Constant, colors.BackgroundColor, nil)
-- For constants

-- 							   *hl-TSConstBuiltin*
Group.new('TSConstBuiltin', colors.Builtin, colors.BackgroundColor, nil)
-- For constant that are built in the language: `nil` in Lua.

-- 							     *hl-TSConstMacro*
-- Group.new('TSConstMacro', nil, colors.BackgroundColor, nil)
-- For constants that are defined by macros: `NULL` in C.

-- 							    *hl-TSConstructor*
-- Group.new('TSConstructor', nil, colors.BackgroundColor, nil)
-- For constructor calls and definitions: `{}` in Lua, and Java constructors.

-- 								  *hl-TSError*
Group.new('TSError', colors.Error, colors.BackgroundColor, nil)
-- For syntax/parser errors.

-- 							      *hl-TSException*
-- Group.new('TSException', nil, colors.BackgroundColor, nil)
-- For exception related keywords.

-- 								  *hl-TSField*
-- Group.new('TSField', nil, colors.BackgroundColor, nil)
-- For fields.

-- 								  *hl-TSFloat*
Group.new('TSFloat', colors.Float, colors.BackgroundColor, nil)
-- For floats.

-- 							       *hl-TSFunction*
Group.new('TSFunction', colors.Function , colors.BackgroundColor, nil)
-- For function (calls and definitions).

-- 							    *hl-TSFuncBuiltin*
Group.new('TSFuncBuiltin', colors.Builtin, colors.BackgroundColor, nil)
-- For builtin functions: `table.insert` in Lua.

-- 							      *hl-TSFuncMacro*
-- Group.new('TSFuncMacro', nil, colors.BackgroundColor, nil)
-- For macro defined fuctions (calls and definitions): each `macro_rules` in
-- Rust.

-- 								*hl-TSInclude*
Group.new('TSInclude', colors.Import, colors.BackgroundColor, nil)
-- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require`
-- in Lua.

-- 								*hl-TSKeyword*
Group.new('TSKeyword', colors.Keyword, colors.BackgroundColor, nil)
-- For keywords that don't fall in previous categories.

-- 							*hl-TSKeywordFunction*
Group.new('TSKeywordFunction', colors.Function, colors.BackgroundColor, nil)
-- For keywords used to define a fuction.

-- 							*hl-TSKeywordOperator*
Group.new('TSKeywordOperator', colors.Operator, colors.BackgroundColor, nil)
-- for operators that are English words, e.g. `and`, `as`, `or`.

-- 							  *hl-TSKeywordReturn*
-- Group.new('TSKeywordReturn', nil, colors.BackgroundColor, nil)
-- for the `return` and `yield` keywords.

-- 								  *hl-TSLabel*
-- Group.new('TSLabel', nil, colors.BackgroundColor, nil)
-- For labels: `label:` in C and `:label:` in Lua.

-- 								 *hl-TSMethod*
Group.new('TSMethod', colors.Function, colors.BackgroundColor, nil)
-- For method calls and definitions.

-- 							      *hl-TSNamespace*
-- Group.new('TSNamespace', nil, colors.BackgroundColor, nil)
-- For identifiers referring to modules and namespaces.

-- 								     *hl-None*
-- Group.new('TSNone', nil, colors.BackgroundColor, nil)
-- For no highlighting.

-- 								 *hl-TSNumber*
-- Group.new('TSNumber', nil, colors.BackgroundColor, nil)
-- For all numbers

-- 							       *hl-TSOperator*
Group.new('TSOperator', colors.Operator, colors.BackgroundColor, nil)
-- For any operator: `+`, but also `->` and `*` in C.

-- 							      *hl-TSParameter*
-- Group.new('TSParameter', nil, colors.BackgroundColor, nil)
-- For parameters of a function.

-- 						     *hl-TSParameterReference*
-- Group.new('TSParameterReference', nil, colors.BackgroundColor, nil)
-- For references to parameters of a function.

-- 							       *hl-TSProperty*
-- Group.new('TSProperty', nil, colors.BackgroundColor, nil)
-- Same as Group.new('TSField', nil, colors.BackgroundColor, nil).

-- 							 *hl-TSPunctDelimiter*
Group.new('TSPunctDelimiter', colors.Separator, colors.BackgroundColor, nil)
-- For delimiters ie: `.`

-- 							   *hl-TSPunctBracket*
Group.new('TSPunctBracket', colors.BracketMatching, colors.BackgroundColor, nil)
-- For brackets and parens.

-- 							   *hl-TSPunctSpecial*
-- Group.new('TSPunctSpecial', nil, colors.BackgroundColor, nil)
-- For special punctutation that does not fall in the catagories before.

-- 								 *hl-TSRepeat*
-- Group.new('TSRepeat', nil, colors.BackgroundColor, nil)
-- For keywords related to loops.

-- 								 *hl-TSString*
Group.new('TSString', colors.String, colors.BackgroundColor, nil)
-- For strings.

-- 							    *hl-TSStringRegex*
-- Group.new('TSStringRegex', nil, colors.BackgroundColor, nil)
-- For regexes.

-- 							   *hl-TSStringEscape*
-- Group.new('TSStringEscape', nil, colors.BackgroundColor, nil)
-- For escape characters within a string.

-- 							  *hl-TSStringSpecial*
Group.new('TSStringSpecial', colors.SpecialString, colors.BackgroundColor, nil)
-- For strings with special meaning that don't fit into the above categories.

-- 								 *hl-TSSymbol*
-- Group.new('TSSymbol', nil, colors.BackgroundColor, nil)
-- For identifiers referring to symbols or atoms.

-- 								    *hl-TSTag*
-- Group.new('TSTag', nil, colors.BackgroundColor, nil)
-- Tags like html tag names.

-- 							   *hl-TSTagAttribute*
-- Group.new('TSTagAttribute', nil, colors.BackgroundColor, nil)
-- For html tag attributes.

-- 							   *hl-TSTagDelimiter*
-- Group.new('TSTagDelimiter', nil, colors.BackgroundColor, nil)
-- Tag delimiter like `<` `>` `/`

-- 								   *hl-TSText*
-- Group.new('TSText', nil, colors.BackgroundColor, nil)
-- For strings considered text in a markup language.

-- 								 *hl-TSSTrong*
-- Group.new('TSStrong', nil, colors.BackgroundColor, nil)
-- For text to be represented in bold.

-- 							       *hl-TSEmphasis*
-- Group.new('TSEmphasis', nil, colors.BackgroundColor, nil)
-- For text to be represented with emphasis.

-- 							      *hl-TSUnderline*
-- Group.new('TSUnderline', nil, colors.BackgroundColor, nil)
-- For text to be represented with an underline.

-- 								 *hl-TSStrike*
-- Group.new('TSStrike', nil, colors.BackgroundColor, nil)
-- For strikethrough text.

-- 								  *hl-TSTitle*
-- Group.new('TSTitle', nil, colors.BackgroundColor, nil)
-- Text that is part of a title.

-- 								*hl-TSLiteral*
-- Group.new('TSLiteral', nil, colors.BackgroundColor, nil)
-- Literal text.

-- 								    *hl-TSURI*
-- Group.new('TSURI', nil, colors.BackgroundColor, nil)
-- Any URI like a link or email.

-- 								   *hl-TSMath*
-- Group.new('TSMath', nil, colors.BackgroundColor, nil)
-- For LaTex-like math environments.

-- 							  *hl-TSTextReference*
-- Group.new('TSTextReference', nil, colors.BackgroundColor, nil)
-- For footnotes, text references, citations.

-- 							     *hl-TSEnvironment*
-- Group.new('TSEnvironment', nil, colors.BackgroundColor, nil)
-- For text environments of markup languages.

-- 							 *hl-TSEnvironmentName*
-- Group.new('TSEnvironmentName', nil, colors.BackgroundColor, nil)
-- For the name/the string indicating the type of text environment.

-- 								   *hl-TSNote*
-- Group.new('TSNote', nil, colors.BackgroundColor, nil)
-- Text representation of an informational note.

-- 								   *TSWarning*
Group.new('TSWarning', colors.Warning, colors.BackgroundColor, nil)
-- Text representation of a warning note.

-- 								    *TSDanger*
-- Group.new('TSDanger', nil, colors.BackgroundColor, nil)
-- Text representation of a danger note.

-- 								   *hl-TSType*
-- Group.new('TSType', nil, colors.BackgroundColor, nil)
-- For types.

-- 							    *hl-TSTypeBuiltin*
Group.new('TSTypeBuiltin', colors.Builtin, colors.BackgroundColor, nil)
-- For builtin types.

-- 							       *hl-TSVariable*
Group.new('TSVariable', colors.Variable, colors.BackgroundColor, nil)
-- Any variable name that does not have another highlight.

-- 							*hl-TSVariableBuiltin*
Group.new('TSVariableBuiltin', colors.Builtin, colors.BackgroundColor, nil)
-- Variable names that are defined by the languages, like `this` or `self`.
