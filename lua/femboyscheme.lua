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
	none          = 'NONE',
	search        = { bg = '#c4b345', fg = '#1c1b17' },
	incsearch     = { bg = '#c48945', fg = '#030302', gui = 'none' },
}

function f.load_syntax()
	local syntax = {
		Normal                      = { fg = f.normal, bg = f.none },
		Comment                     = { style = 'italic', fg = f.comment },
		FFirst                      = { fg = f.fairygreen, bg = f.none },
		FSecond                     = { fg = f.fairydarker, bg = f.none },
		ErrorMsg                    = { fg = f.errorred },
		MoreMsg                     = { fg = f.fairygreen },
		Function                    = { fg = f.lightbluedark },
		Statement                   = { fg = f.strongpink, style = 'bold'},
		Type                        = { fg = f.purplelight },
		Keyword                     = { fg = f.purpledark },
		Delimiter                   = { fg = f.purple },
		Operator                    = { fg = f.normalplus },
		VertSplit                   = { bg = 'none' },
		StatusLine                  = { style = 'bold' },
		StatusLineNC                = { style = 'none' },
		Search                      = f.search,
		IncSearch                   = f.incsearch,
	}
	return syntax
end

function f.load_lazy_syntax()
	local syntax = {
		LineNr                      = { fg = f.gothpink},
		CursorLineNr                = { fg = f.goldcontrast, gui = 'bold' },
		SignColumn                  = { bg = 'none' },
		LspDiagnosticsDefaultError  = { fg = '#ec5f67' },
		LspDiagnosticsDefaultWarning= { fg = '#fabd2f' },
		LspDiagnosticsDefaultHint   = { fg = '#51afef' },
		LspDiagnosticsDefaultInforma= { fg = '#51afef' },
	}
	return syntax
end

function f.highlight(group, color)
	local style = 'gui='..(color.style or 'NONE')
	local fg = 'guifg='..(color.fg or 'NONE')
	local bg = 'guibg='..(color.bg or 'NONE')
	local sp = 'guisp='..(color.sp or 'NONE')
	vim.api.nvim_command('highlight '..group..' '..style..' '..fg..' '..bg..' '..sp)
end


local async_lazy_load
async_lazy_load = vim.loop.new_async(vim.schedule_wrap(function ()
	local syntax = f.load_lazy_syntax()
	for group, colors in pairs(syntax) do
		f.highlight(group, colors)
	end
	async_lazy_load:close()
end))

function f.colorscheme()
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
	async_lazy_load:send()
end

f.colorscheme()
return f
