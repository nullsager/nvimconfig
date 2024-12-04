return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<M-j>", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end, { desc = "跳到当前文件下一个git变更" })

          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end, { desc = "跳到当前文件上一个git变更" })

          -- Actions
          map(
            "n",
            "<leader>hs",
            gitsigns.stage_hunk,
            { desc = "暂存当前Git变更块" }
          )
          map(
            "n",
            "<leader>hr",
            gitsigns.reset_hunk,
            { desc = "重置当前Git变更块" }
          )
          map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "暂存选中的变更块(v模式下)" })
          map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "重置选中的变更块(v模式下)" })
          map(
            "n",
            "<leader>hS",
            gitsigns.stage_buffer,
            { desc = "暂存当前缓冲区中的所有变更" }
          )
          map(
            "n",
            "<leader>hu",
            gitsigns.undo_stage_hunk,
            { desc = "撤销最近的Git暂存操作" }
          )
          map(
            "n",
            "<leader>hR",
            gitsigns.reset_buffer,
            { desc = "重置当前缓冲区的所有Git变更" }
          )
          map(
            "n",
            "<leader>hp",
            gitsigns.preview_hunk,
            { desc = "预览当前Git变更块" }
          )
          map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
          end, { desc = "显示当前行的Git blame信息" })
          map(
            "n",
            "<leader>tb",
            gitsigns.toggle_current_line_blame,
            { desc = "切换当前行的Git blame显示" }
          )
          map(
            "n",
            "<leader>hd",
            gitsigns.diffthis,
            { desc = "显示当前缓冲区与暂存区的Git差异" }
          )
          map("n", "<leader>hD", function()
            gitsigns.diffthis("~")
          end, {
            desc = "显示当前缓冲区与上一个提交的Git差异",
          })
          map(
            "n",
            "<leader>td",
            gitsigns.toggle_deleted,
            { desc = "切换删除行的显示" }
          )

          -- Text object
          map(
            { "o", "x" },
            "ih",
            ":<C-U>Gitsigns select_hunk<CR>",
            { desc = "选择当前Git变更块" }
          )
        end,
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.keymap.set(
        "n",
        "zR",
        require("ufo").openAllFolds,
        { desc = "打开所有节点" }
      )
      vim.keymap.set(
        "n",
        "zM",
        require("ufo").closeAllFolds,
        { desc = "关闭所有节点" }
      )
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup({
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        })
      end
      require("ufo").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local todo_comments = require("todo-comments")

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "[t", function()
        todo_comments.jump_next()
      end, { desc = "Next todo comment" })

      keymap.set("n", "]t", function()
        todo_comments.jump_prev()
      end, { desc = "Previous todo comment" })

      todo_comments.setup()
    end,
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
      -- ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
      ---Function to call before (un)comment
      pre_hook = nil,
      ---Function to call after (un)comment
      post_hook = nil,
    }
  }
}
