local f = {
	test          = '#ffd500',
	pink          = '#ff00aa',
	--purple        = '#aa00ff',
	purple        = '#c44dff',
	purpleligh    = '#dc9cfc',
	purpledark    = '#a300f5',
	scontrast     = '#40bfbf',
	contrast      = '#26d9d9',
	goldcontrast  = '#b38d51',
	gothpink      = '#962d4c',
	strongpink    = '#c3228e',
	comment       = '#7e677e',
	lightblue     = '#42ffff',
	lightbluedark = '#00c2c2',
	fairygreen    = '#b0da6c',
	fairydarker   = '#648424',
	errorred      = '#ad3834',
	normal        = '#fac5e7',
	normalplus    = '#ff9edf',
	search        = { bg = '#c4b345', fg = '#1c1b17' },
	incsearch     = { bg = '#c48945', fg = '#030302' },
}

local groups = {
	Normal                      = { fg = f.normal, bg = f.none },
	Comment                     = { fg = f.comment, italic = true },
	FFirst                      = { fg = f.fairygreen, bg = f.none },
	FSecond                     = { fg = f.fairydarker, bg = f.none },
	ErrorMsg                    = { fg = f.errorred },
	MoreMsg                     = { fg = f.fairygreen },
	Function                    = { fg = f.lightbluedark },
	Statement                   = { fg = f.strongpink, bold = true},
	Type                        = { fg = f.purplelight },
	Keyword                     = { fg = f.purpledark },
	Delimiter                   = { fg = f.purple },
	Operator                    = { fg = f.normalplus },
	VertSplit                   = { bg = f.none },
	StatusLine                  = { bold = true },
	StatusLineNC                = { },
	Search                      = f.search,
	IncSearch                   = f.incsearch,
	LineNr                      = { fg = f.gothpink },
	CursorLineNr                = { fg = f.goldcontrast, bold = true },
	SignColumn                  = { bg = f.none },
	NormalFloat                 = { fg = f.normal, bg = f.none },
	LspDiagnosticsDefaultError  = { fg = '#ec5f67' },
	LspDiagnosticsDefaultWarning= { fg = '#fabd2f' },
	LspDiagnosticsDefaultHint   = { fg = '#51afef' },
	LspDiagnosticsDefaultInforma= { fg = '#51afef' },
}

function f.colorscheme()
	if vim.fn.exists('syntax_on') then
		vim.api.nvim_command('syntax reset')
	end
	vim.o.background = 'dark'
	vim.o.termguicolors = true
	vim.g.colors_name = 'femboyscheme'
	for group, settings in pairs(groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

f.colorscheme()
return f
