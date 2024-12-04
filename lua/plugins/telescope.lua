return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },

  keys = {
    {"<leader><leader>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "对当前buffer模糊查找"},
    {"<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "查找文件"},
    {"<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "对内容进行正则搜索"},
    {"<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "查找切换打开的buffer"},
    {"<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "查看插件帮助文档"},
    {"<leader>ft", "<cmd>lua require('telescope.builtin').git_files()<cr>", desc = "查看git文件"},
    {"<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "搜索光标下的单词，或者跳着字母模糊搜索"},
    {"<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "查找最近打开的文件"},
    {"<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>", desc = "列出插件/用户的命令并运行"},
    {"<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "查看normal模式下的keymaps"},
    {"<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", desc = "查看manpage"},
    {"<leader>fl", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", desc = "预览切换主题"},
    {"<leader>fd", "<cmd>TodoTelescope<cr>", desc = "预览TODO"},
  },
  config = function()
    require('telescope').setup {
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end
}
