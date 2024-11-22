return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "打开/关闭目录树" },
    { "<leader>o", "<cmd>Neotree reveal<cr>", desc = "将焦点从代码调整到目录树"},
  },
}
