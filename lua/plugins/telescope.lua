return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-fzy-native.nvim'
  },
    keys = {
      {"<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "查找文件"},
      {"<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "对内容进行正则搜索"},
      {"<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "查找切换打开的buffer"},
      {"<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "查看插件帮助文档"},
      {"<leader>ft", "<cmd>lua require('telescope.builtin').git_files()<cr>", desc = "查看git文件"},
      {"<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "搜索光标下的单词，或者跳着字母模糊搜索"},
      {"<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "查找最近打开的文件"},
      {"<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>", desc = "列出插件/用户的命令并运行"},
    }
  }
