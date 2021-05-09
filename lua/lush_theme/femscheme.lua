local lush = require('lush')
local hsl = lush.hsl

local bold = "bold"
local none = "none"
local bold0 = "none"


local test = hsl(50, 100 ,50)
local pink= hsl(320, 100, 50)
local purple = hsl(280, 100, 50)
local scontrast = hsl(180, 50,50)
local contrast = hsl(180, 70, 50)
local highlight = hsl(37, 39, 51)
local gothpink = hsl(346, 55, 40)
local comment = hsl(300,10,45)

local lightblue = hsl(180, 100, 63)

local fairygreen = hsl(83, 60, 64)
local errorred = hsl(2, 54, 44)

-- Specific

local normal = pink.lighten(80)

--local sea_foam_triadic = sea_foam.rotate(120)
--local sea_foam_complement = sea_foam.rotate(180).darken(10).saturate(10)


local theme = lush(function()
  return {

    --   <HighlightGroupName> { bg = <hsl>, fg = <hsl>, sp = <hsl>, gui = <string> },
    Normal { bg = "none", fg = normal }, -- normal text
    --CursorLine { bg = Normal.bg.lighten(5) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    --Visual { bg = CursorLine.bg, fg = Normal.fg.rotate(180) },
    --CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    --Whitespace { fg = Normal.bg.desaturate(25).lighten(25) },

    -- We can inherit properties if we want to tweak a group slightly
    -- Note: This looks similar to a link, but the defined group will have its
    -- own properties, cloned from the parent.
    -- Lets make Comments look like Whitespace, but with italics
    Comment { fg = comment, gui="italic" },

    -- Here's how we might set our line numbers to be relational to Normal,
    -- note we'er also using some shorter aliases here.
    -- (`setlocal number`)
    LineNr       { fg = gothpink.lighten(20)}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = highlight, gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    -- You can also use highlight groups to define "base" colors, if you dont
    -- want to use regular lua variables. They will behave in the same way.
    -- Note that these groups *will* be defined as a vim-highlight-group, so
    -- try not to pick names that might end up being used by something.
    --
    -- CamelCase is by tradition but you don't have to use it.
    search_base  { bg = hsl(52, 52, 52), fg = hsl(52, 10, 10) },
    Search       { search_base },
    IncSearch    { bg = search_base.bg.rotate(-20), fg = search_base.fg.darken(90) },

    -- And that's the basics of using Lush!
    --
    -- If you want to know more about exporting themes for use without lush
    -- (for distribution) or integration with other plugins (such as
    -- lightline), see the bottom of this file `/export-external`, the README,
    -- or the examples folder.

    -- For experimentation, below is all the Neovim default highlight groups
    -- from docs as of 0.5.0-812.
    --
    -- If you wish to create a theme, it's recommended you copy the template
    -- folder from the examples folder.
    --
    -- Referenced/linked groups must come before being referenced/linked,
    -- (i.e. above we create Normal before trying to set CursorLine)
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    -- NormalFloat  { }, -- Normal text in floating windows.
    -- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { bg = test, fg = test}, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    -- Directory    { }, -- directory names (and other special names in listings)
    -- DiffAdd      { }, -- diff mode: Added line |diff.txt|
    -- DiffChange   { }, -- diff mode: Changed line |diff.txt|
    -- DiffDelete   { }, -- diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { fg = "bg"}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = errorred}, -- error messages on the command line
    VertSplit    { }, -- the column separating vertically split windows
    -- Folded       { }, -- line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { bg = Normal.bg }, -- column where |signs| are displayed
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    -- MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = fairygreen }, -- |more-prompt|
    --NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalNC     { }, -- normal text in non-current windows
    -- Pmenu        { }, -- Popup menu: normal item.
    -- PmenuSel     { }, -- Popup menu: selected item.
    -- PmenuSbar    { }, -- Popup menu: scrollbar.
    -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
    Question     {  fg = MoreMsg.fg }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine   { bg = "none", gui="bold" }, -- status line of current window
	StatusLineNC { bg = "none" }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { bg = "none" }, -- tab pages line, not active tab page label
    TabLineFill  { bg = "none" }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    -- Title        { }, -- titles for output from ":set all", ":autocmd" etc.
    -- Visual       { }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg   { }, -- warning messages
    Whitespace   { fg = pink.desaturate(70).darken(50)}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Constant       { }, -- (preferred) any constant
    -- String         { }, --   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    --Identifier     {  }, -- (preferred) any variable name
    Function       { fg = lightblue.darken(40) }, -- function name (also: methods for classes)

    Statement      { fg = pink.darken(10).desaturate(30), gui = bold}, -- (preferred) any statement
    -- Conditional    { fg = test}, --  if, then, else, endif, switch, etc.
    Repeat         { fg = pink.darken(10).desaturate(30), gui = bold}, --   for, do, while, etc.
    -- Label          { fg = test}, --    case, default, etc.
    Operator       { fg = normal.darken(10)}, -- "sizeof", "+", "*", etc.
    -- Exception      { }, --  try, catch, throw

    -- PreProc        { }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = purple.lighten(60),}, -- (preferred) int, long, char, etc.
    Keyword        { fg = Type.fg.darken(40)}, --  any other keyword
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    -- Special        { }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    Delimiter      { fg = purple.lighten(30)}, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.
    

    StatusLineFileActive { fg = fairygreen, gui = 'bold' },
    StatusLineFileActiveModified { fg = fairygreen, gui = 'bold,underline'},
    StatusLineFileNonActive { fg = fairygreen},
    StatusLineFileNonActiveModified { fg =fairygreen, gui = 'underline' },
    FFirst { fg = fairygreen },
    FSecond { fg = fairygreen.darken(50) },

    BufferTabpageFill { bg = "none"},
    BufferCurrent { bg = "none", gui="bold"},
    BufferCurrentIcon { bg = "none"},
    BufferCurrentIndex { bg = "none"},
    BufferCurrentMod { bg = "none"},
    BufferCurrentSign { bg = "none"},
    BufferCurrentTarget { bg = "none"},
    
    BufferInactive { bg = "none"},
    BufferInactiveIcon { bg = "none"},
    BufferInactiveIndex { bg = "none"},
    BufferInactiveMod { bg = "none"},
    BufferInactiveSign { bg = "none"},
    BufferInactiveTarget { bg = "none"},
    
    
    BufferVisible { bg = "none"},
    BufferVisibleIcon { bg = "none"},
    BufferVisibleIndex { bg = "none"},
    BufferVisibleMod { bg = "none"},
    BufferVisibleSign { bg = "none"},
    BufferVisibleTarget { bg = "none"},
    DiagnosticError { fg = test},
    LspDiagnosticsDefaultError { fg = '#ec5f67' },
    LspDiagnosticsDefaultWarning { fg = '#fabd2f' },
    LspDiagnosticsDefaultHint { fg = '#51afef' },
    LspDiagnosticsDefaultInformation { fg = '#51afef' },
    --LspDiagnosticsErrorSign           { fg = test}, -- used for "Error" diagnostic signs in sign column
    --LspDiagnosticsErrorFloating       { fg = test}, -- used for "Error" diagnostic messages in the diagnostics float
    --LspDiagnosticsWarning             { fg = test }, -- used for "Warning" diagnostic virtual text
    --LspDiagnosticsWarningSign         { fg = test}, -- used for "Warning" diagnostic signs in sign column
    --LspDiagnosticsWarningFloating     { fg = test}, -- used for "Warning" diagnostic messages in the diagnostics float
    --LspDiagnosticsInformation         { fg = test}, -- used for "Information" diagnostic virtual text
    --LspDiagnosticsInformationSign     { fg = test}, -- used for "Information" signs in sign column
    --LspDiagnosticsInformationFloating { fg = test}, -- used for "Information" diagnostic messages in the diagnostics float
    --LspDiagnosticsHint                { fg = test}, -- used for "Hint" diagnostic virtual text
    --LspDiagnosticsHintSign            { fg = test}, -- used for "Hint" diagnostic signs in sign column
    --LspDiagnosticsHintFloating        { fg = test}, -- used for "Hint" diagnostic messages in the diagnostics float
    --LspReferenceText                  { fg = test}, -- used for highlighting "text" references
    --LspReferenceRead                  { fg = test}, -- used for highlighting "read" references
    --LspReferenceWrite                 { bg = test}, -- used for highlighting "write" references

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSError              { }, -- For syntax/parser errors.
    -- TSPunctDelimiter     { }, -- For delimiters ie: `.`
    -- TSPunctBracket       { }, -- For brackets and parens.
    -- TSPunctSpecial       { }, -- For special punctutation that does not fall in the catagories before.
    -- TSConstant           { }, -- For constants
    -- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    -- TSString             { }, -- For strings.
    -- TSStringRegex        { }, -- For regexes.
    -- TSStringEscape       { }, -- For escape characters within a string.
    -- TSCharacter          { }, -- For characters.
    -- TSNumber             { }, -- For integers.
    -- TSBoolean            { }, -- For booleans.
    -- TSFloat              { }, -- For floats.
    -- TSFunction           { }, -- For function (calls and definitions).
    -- TSFuncBuiltin        { }, -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSParameter          { }, -- For parameters of a function.
    -- TSParameterReference { }, -- For references to parameters of a function.
    -- TSMethod             { }, -- For method calls and definitions.
    -- TSField              { }, -- For fields.
    -- TSProperty           { }, -- Same as `TSField`.
    -- TSConstructor        { }, -- For constructor calls and definitions: `                                                                       { }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    -- TSLabel              { }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    -- TSKeyword            { }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    -- TSType               { }, -- For types.
    -- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
    -- TSNamespace          { }, -- For identifiers referring to modules and namespaces.
    -- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSText               { }, -- For strings considered text in a markup language.
    -- TSStrong             { }, -- For text to be represented with strong.
    -- TSEmphasis           { }, -- For text to be represented with emphasis.
    -- TSUnderline          { }, -- For text to be represented with an underline.
    -- TSTitle              { }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    -- TSURI                { }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.
  }
end)

-- export-external
--
-- Integrating Lush with other tools:
--
-- By default, lush() actually returns your theme in parsed form. You can
-- interact with it in much the same way as you can inside a lush-spec.
--
-- This looks something like:
--
--   local theme = lush(function()
--     return {
--       Normal { fg = hsl(0, 100, 50) },
--       CursorLine { Normal },
--     }
--   end)
--
--   theme.Normal.fg()                     -- returns table {h = h, s = s, l = l}
--   tostring(theme.Normal.fg)             -- returns "#hexstring"
--   tostring(theme.Normal.fg.lighten(10)) -- you can still modify colours, etc
--
-- This means you can `require('my_lush_file')` in any lua code to access your
-- themes's color information.
--
-- Note:
--
-- "Linked" groups do not expose their colours, you can find the key
-- of their linked group via the 'link' key (may require chaining)
--
--   theme.CursorLine.fg() -- This is bad!
--   theme.CursorLine.link   -- = "Normal"
--
-- Also Note:
--
-- Most plugins expose their own Highlight groups, which *should be the primary
-- method for setting theme colours*, there are however some plugins that
-- require adjustments to a global or configuration variable.
--
-- To set a global variable, use neovims lua bridge,
--
--   vim.g.my_plugin.color_for_widget = theme.Normal.fg.hex
--
-- An example of where you may use this, might be to configure Lightline. See
-- the examples folder for two styles of this.
--
-- Exporting your theme beyond Lush:
--
-- If you wish to use your theme in Vim, or without loading lush, you may export
-- your theme via `lush.export_to_buffer(parsed_lush_spec)`. The readme has
-- further details on how to do this.

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
