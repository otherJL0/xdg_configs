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
--
--
-- 						*hl-ColorColumn*
-- Group.new('ColorColumn', colors.Others, colors.BackgroundColor, nil)
--	used for the columns set with 'colorcolumn'
---- 						*hl-Conceal*
-- Group.new('Conceal', colors.Others, colors.BackgroundColor, nil)
--		placeholder characters substituted for concealed
---- 	text (see 'conceallevel')
---- 						*hl-Cursor*
-- Group.new('Cursor', colors.Others, colors.BackgroundColor, nil)
--		character under the cursor
-- Group.new('lCursor', colors.Others, colors.BackgroundColor, nil)
--		the character under the cursor when |language-mapping|
---- 	is used (see 'guicursor')
---- 						*hl-CursorIM*
-- Group.new('CursorIM', colors.Others, colors.BackgroundColor, nil)
--	like Cursor, but used when in IME mode |CursorIM|
---- 						*hl-CursorColumn*
-- Group.new('CursorColumn', colors.Others, colors.BackgroundColor, nil)
--	Screen-column at the cursor, when 'cursorcolumn' is set.
---- 						*hl-CursorLine*
-- Group.new('CursorLine', colors.Others, colors.BackgroundColor, nil)
--	Screen-line at the cursor, when 'cursorline' is set.
---- 	Low-priority if foreground (ctermfg OR guifg) is not set.
---- 						*hl-Directory*
-- Group.new('Directory', colors.Others, colors.BackgroundColor, nil)
--	directory names (and other special names in listings)
---- 						*hl-DiffAdd*
-- Group.new('DiffAdd', colors.Others, colors.BackgroundColor, nil)
--		diff mode: Added line |diff.txt|
---- 						*hl-DiffChange*
-- Group.new('DiffChange', colors.Others, colors.BackgroundColor, nil)
--	diff mode: Changed line |diff.txt|
---- 						*hl-DiffDelete*
-- Group.new('DiffDelete', colors.Others, colors.BackgroundColor, nil)
--	diff mode: Deleted line |diff.txt|
---- 						*hl-DiffText*
-- Group.new('DiffText', colors.Others, colors.BackgroundColor, nil)
--	diff mode: Changed text within a changed line |diff.txt|
---- 						*hl-EndOfBuffer*
-- Group.new('EndOfBuffer', colors.Others, colors.BackgroundColor, nil)
--	filler lines (~) after the end of the buffer.
---- 	By default, this is highlighted like |hl-NonText|.
---- 						*hl-TermCursor*
-- Group.new('TermCursor', colors.Others, colors.BackgroundColor, nil)
--	cursor in a focused terminal
---- 						*hl-TermCursorNC*
-- Group.new('TermCursorNC', colors.Others, colors.BackgroundColor, nil)
--	cursor in an unfocused terminal
---- 						*hl-ErrorMsg*
-- Group.new('ErrorMsg', colors.Others, colors.BackgroundColor, nil)
--	error messages on the command line
---- 						*hl-VertSplit*
-- Group.new('VertSplit', colors.Others, colors.BackgroundColor, nil)
--	the column separating vertically split windows
---- 						*hl-Folded*
-- Group.new('Folded', colors.Others, colors.BackgroundColor, nil)
--		line used for closed folds
---- 						*hl-FoldColumn*
-- Group.new('FoldColumn', colors.Others, colors.BackgroundColor, nil)
--	'foldcolumn'
---- 						*hl-SignColumn*
-- Group.new('SignColumn', colors.Others, colors.BackgroundColor, nil)
--	column where |signs| are displayed
---- 						*hl-IncSearch*
-- Group.new('IncSearch', colors.Others, colors.BackgroundColor, nil)
--	'incsearch' highlighting; also used for the text replaced with
---- 	":s///c"
---- 						*hl-Substitute*
-- Group.new('Substitute', colors.Others, colors.BackgroundColor, nil)
--	|:substitute| replacement text highlighting
--
---- 						*hl-LineNr*
Group.new('LineNr', colors.LineNumbers, colors.BackgroundColor, nil)
--		Line number for ":number" and ":#" commands, and when 'number'
---- 	or 'relativenumber' option is set.
---- 						*hl-CursorLineNr*
Group.new('CursorLineNr', colors.CurrentLine, colors.CurrentLine, nil)
--	Like LineNr when 'cursorline' is set and 'cursorlineopt' is
---- 	set to "number" or "both", or 'relativenumber' is set, for
---- 	the cursor line.
---- 						*hl-MatchParen*
-- Group.new('MatchParen', colors.Others, colors.BackgroundColor, nil)
--	The character under the cursor or just before it, if it
---- 	is a paired bracket, and its match. |pi_paren.txt|
--
---- 						*hl-ModeMsg*
-- Group.new('ModeMsg', colors.Others, colors.BackgroundColor, nil)
--		'showmode' message (e.g., "-- INSERT --")
---- 						*hl-MsgArea*
-- Group.new('MsgArea', colors.Others, colors.BackgroundColor, nil)
--		Area for messages and cmdline
---- 						*hl-MsgSeparator*
-- Group.new('MsgSeparator', colors.Others, colors.BackgroundColor, nil)
--	Separator for scrolled messages, `msgsep` flag of 'display'
---- 						*hl-MoreMsg*
-- Group.new('MoreMsg', colors.Others, colors.BackgroundColor, nil)
--		|more-prompt|
---- 						*hl-NonText*
-- Group.new('NonText', colors.Others, colors.BackgroundColor, nil)
--		'@' at the end of the window, characters from 'showbreak'
---- 	and other characters that do not really exist in the text
---- 	(e.g., ">" displayed when a double-wide character doesn't
---- 	fit at the end of the line). See also |hl-EndOfBuffer|.
---- 						*hl-Normal*
-- Group.new('Normal', colors.Others, colors.BackgroundColor, nil)
--		normal text
---- 						*hl-NormalFloat*
-- Group.new('NormalFloat', colors.Others, colors.BackgroundColor, nil)
--	Normal text in floating windows.
---- 						*hl-NormalNC*
-- Group.new('NormalNC', colors.Others, colors.BackgroundColor, nil)
--	normal text in non-current windows
---- 						*hl-Pmenu*
-- Group.new('Pmenu', colors.Others, colors.BackgroundColor, nil)
--		Popup menu: normal item.
---- 						*hl-PmenuSel*
-- Group.new('PmenuSel', colors.Others, colors.BackgroundColor, nil)
--	Popup menu: selected item.
---- 						*hl-PmenuSbar*
-- Group.new('PmenuSbar', colors.Others, colors.BackgroundColor, nil)
--	Popup menu: scrollbar.
---- 						*hl-PmenuThumb*
-- Group.new('PmenuThumb', colors.Others, colors.BackgroundColor, nil)
--	Popup menu: Thumb of the scrollbar.
---- 						*hl-Question*
-- Group.new('Question', colors.Others, colors.BackgroundColor, nil)
--	|hit-enter| prompt and yes/no questions
---- 						*hl-QuickFixLine*
-- Group.new('QuickFixLine', colors.Others, colors.BackgroundColor, nil)
--	Current |quickfix| item in the quickfix window. Combined with
----                |hl-CursorLine| when the cursor is there.
---- 						*hl-Search*
-- Group.new('Search', colors.Others, colors.BackgroundColor, nil)
--		Last search pattern highlighting (see 'hlsearch').
---- 	Also used for similar items that need to stand out.
---- 						*hl-SpecialKey*
-- Group.new('SpecialKey', colors.Others, colors.BackgroundColor, nil)
--	Unprintable characters: text displayed differently from what
---- 	it really is. But not 'listchars' whitespace. |hl-Whitespace|
---- 						*hl-SpellBad*
-- Group.new('SpellBad', colors.Others, colors.BackgroundColor, nil)
--	Word that is not recognized by the spellchecker. |spell|
---- 	Combined with the highlighting used otherwise.
---- 						*hl-SpellCap*
-- Group.new('SpellCap', colors.Others, colors.BackgroundColor, nil)
--	Word that should start with a capital. |spell|
---- 	Combined with the highlighting used otherwise.
---- 						*hl-SpellLocal*
-- Group.new('SpellLocal', colors.Others, colors.BackgroundColor, nil)
--	Word that is recognized by the spellchecker as one that is
---- 	used in another region. |spell|
---- 	Combined with the highlighting used otherwise.
---- 						*hl-SpellRare*
-- Group.new('SpellRare', colors.Others, colors.BackgroundColor, nil)
--	Word that is recognized by the spellchecker as one that is
---- 	hardly ever used. |spell|
---- 	Combined with the highlighting used otherwise.
---- 						*hl-StatusLine*
-- Group.new('StatusLine', colors.Others, colors.BackgroundColor, nil)
--	status line of current window
---- 						*hl-StatusLineNC*
-- Group.new('StatusLineNC', colors.Others, colors.BackgroundColor, nil)
--	status lines of not-current windows
---- 	Note: if this is equal to "StatusLine" Vim will use "^^^" in
---- 	the status line of the current window.
---- 						*hl-TabLine*
-- Group.new('TabLine', colors.Others, colors.BackgroundColor, nil)
--		tab pages line, not active tab page label
---- 						*hl-TabLineFill*
-- Group.new('TabLineFill', colors.Others, colors.BackgroundColor, nil)
--	tab pages line, where there are no labels
---- 						*hl-TabLineSel*
-- Group.new('TabLineSel', colors.Others, colors.BackgroundColor, nil)
--	tab pages line, active tab page label
---- 						*hl-Title*
-- Group.new('Title', colors.Others, colors.BackgroundColor, nil)
--		titles for output from ":set all", ":autocmd" etc.
---- 						*hl-Visual*
-- Group.new('Visual', colors.Others, colors.BackgroundColor, nil)
--		Visual mode selection
---- 							*hl-VisualNOS*
-- Group.new('VisualNOS', colors.Others, colors.BackgroundColor, nil)
--	Visual mode selection when vim is "Not Owning the Selection".
---- 						*hl-WarningMsg*
-- Group.new('WarningMsg', colors.Others, colors.BackgroundColor, nil)
--	warning messages
---- 						*hl-Whitespace*
-- Group.new('Whitespace', colors.Others, colors.BackgroundColor, nil)
--	"nbsp", "space", "tab" and "trail" in 'listchars'
---- 						*hl-WildMenu*
-- Group.new('WildMenu', colors.Others, colors.BackgroundColor, nil)
--	current match in 'wildmenu' completion
