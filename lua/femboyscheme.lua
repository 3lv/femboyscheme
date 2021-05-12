local f = {
	test          = '#ffd500',
	pink          = '#ff00aa',
	--purple        = '#aa00ff',
	purple        = '#c44dff',
	purpleligh    = '#dc9cfc',
	purpledark    = '#a300f5',
	scontrast     = '#40bfbf',
	contrast      = '#26d9d9',
	highlight     = '#b38d51',
	gothpink      = '#9e2e48',
	strongpink    = '#c3228e',
	comment       = '#7e677e',
	lightblue     = '#42ffff',
	lightbluedark = '#00c2c2',
	fairygreen    = '#b0da6c',
	fairydarker   = '#648424',
	errorred      = '#ad3834',
	normal        = '#fac5e7',
	normalplus    = '#ff9edf',
	none          = 'NONE',
}

function f.load_syntax()
	local syntax = {
		Normal = { fg = f.normal, bg = f.none },
		Comment = { style = 'italic', fg = f.comment },
		FFirst = { fg = f.fairygreen, bg = f.none },
		FSecond = { fg = f.fairydarker, bg = f.none },
		ErrorMsg = { fg = f.errorred },
		MoreMsg = { fg = f.fairygreen },
		Function = { fg = f.lightbluedark },
		Statement = { fg = f.strongpink, style = 'bold'},
		Type = { fg = f.purplelight },
		Keyword = { fg = f.purpledark },
		Delimiter = { fg = f.purple },
		Operator = { fg = f.normalplus },
		VertSplit = { bg = 'none' },
		StatusLine = { gui = 'bold' },
		StatusLineNC = { gui = 'none' },
	}
	return syntax
end

function f.load_lazy_syntax()
	local syntax = {
		SingColumn = { bg = 'none' },
		LspDiagnosticsDefaultError = { fg = '#ec5f67' },
		LspDiagnosticsDefaultWarning  = { fg = '#fabd2f' },
		LspDiagnosticsDefaultHint = { fg = '#51afef' },
		LspDiagnosticsDefaultInformation = { fg = '#51afef' },
	}
	return syntax
end

function f.highlight(group, color)
	local style = color.style and 'gui='..color.style or 'gui=NONE'
	local fg = color.fg and 'guifg='..color.fg or 'guifg=NONE'
	local bg = color.bg and 'guibg='..color.bg or 'guibg=NONE'
	local sp = color.sp and 'guisp='..color.sp or ''
	vim.api.nvim_command('highlight '..group..' '..style..' '..fg..' '..bg..' '..sp)
end

function f.colorscheme()
	vim.api.nvim_command('hi clear')
	if vim.fn.exists('syntax_on') then
		vim.api.nvim_command('syntax reset')
	end
	vim.o.background = 'dark'
	vim.o.termguicolors = true
	vim.g.colors_name = 'femboyscheme'
	local syntax = f.load_syntax()
	for group, colors in pairs(syntax) do
		f.highlight(group, colors)
	end
end

f.colorscheme()
return f
