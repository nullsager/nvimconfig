return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "lua", "cpp", "python" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,
      auto_install = true,
      -- ignore_install = { "javascript" },
      highlight = {
        enable = true,
        -- disable = { "c", "rust" },
      },
    }
  end
}
