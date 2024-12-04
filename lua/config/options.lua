vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'

-- 在复制（yank）时高亮显示被复制的文本
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',    -- 使用内置的 'IncSearch' 高亮组
      timeout = 200,            -- 高亮持续时间（毫秒）
      on_visual = true,        -- 如果为 true，在可视模式下也高亮
    }
  end,
})
