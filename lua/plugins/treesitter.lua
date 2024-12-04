return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require('nvim-ts-autotag').setup({
      enable = true,
      filetypes = { "html", "xml", "tsx" },
    })
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "lua", "cpp", "python", "html", "javascript"},
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,
      auto_install = true,
      -- ignore_install = { "javascript" },
      highlight = {
        enable = true,
        -- disable = { "c", "rust" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<M-i>",
          node_incremental = "<M-i>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
  end
}
