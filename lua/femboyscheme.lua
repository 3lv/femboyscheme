local f = {
	test          = '#ffd500',
	pink          = '#ff00aa',
	purple        = '#aa00ff',
	scontrast     = '#40bfbf',
	contrast      = '#26d9d9',
	highlight     = '#b38d51',
	gothpink      = '#9e2e48',
	comment       = '#7e677e',
	lightblue     = '#42ffff',
	lightbluedark = '#00c2c2',
	fairygreen    = '#b0da6c',
	fairydarker   = '#648424',
	errorred      = '#ad3834',
	normal        = '#fac5e7',
	none          = 'NONE',
}
function f.highlight(group, color)
	local style = color.style and 'gui='..color.style or 'gui=NONE'
	local fg = color.fg and 'guifg='..color.fg or 'guifg=NONE'
	local bg = color.bg and 'guibg='..color.bg or 'guifg=NONE'
	local sp = color.sp and 'guisp='..color.sp or ''
	vim.api.nvim_command('highlight '..group..' '..style..' '..fg..' '..bg..' '..sp)
end

function f.load_syntax()
	local syntax = {
		Normal = { fg = f.normal, bg = f.none },
		Comment = { style = 'italic', fg = f.comment },
		FFirst = { fg = f.fairygreen, bg = f.none },
		FSecond = { fg = f.fairydarker, bg = f.none },
		ErrorMsg = { fg = errorred },
		MoreMsg = { fg = fairygreen },
		Function = { fg = lightbluedark },
	}
	return syntax
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
