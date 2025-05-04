return {
  {
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
      require("luasnip.loaders.from_vscode").lazy_load()

      local select_next = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" })
      local select_prev = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" })

      -- gray
      vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
      -- blue
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
      -- light blue
      vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
      vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
      -- pink
      vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
      vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
      -- front
      vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
      vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
      vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

      local kind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
      }

      local ELLIPSIS_CHAR = '…'
      local MAX_LABEL_WIDTH = 20
      local MIN_LABEL_WIDTH = 20
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- performance = {
          --   max_view_entries = 15  -- 限制所有补全源最多显示15项
          -- },
          sources = {
            { name = 'nvim_lsp' },
            { name = "buffer" },
            { name = "luasnip", max_item_count = 5 },
          },
          mapping = cmp.mapping.preset.insert({
            ['<Up>'] = cmp.mapping.select_prev_item(),
            ['<Down>'] = cmp.mapping.select_next_item(),
            ["<CR>"] = cmp.mapping.confirm({
              select = true,
              behavior = cmp.ConfirmBehavior.Insert,
            }),
            ['<C-e>'] = cmp.mapping.abort(),

            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          }),
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          -- formatting = {
            --   format = function(entry, vim_item)
              --     local lspkind_ok, lspkind = pcall(require, "lspkind")
              --     if not lspkind_ok then
              --       -- From kind_icons array
              --       vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
              --       -- Source
              --       vim_item.menu = ({
                --         buffer = "[Buffer]",
                --         nvim_lsp = "[LSP]",
                --         luasnip = "[LuaSnip]",
                --         nvim_lua = "[Lua]",
                --         latex_symbols = "[LaTeX]",
                --       })[entry.source.name]
                --       return vim_item
                --     else
                --       -- From lspkind
                --       return lspkind.cmp_format()(entry, vim_item)
                --     end
                --   end
                -- },
                formatting = {
                  format = function(entry, vim_item)
                    local ELLIPSIS_CHAR = '…'
                    local MAX_LABEL_WIDTH = 20
                    local MIN_LABEL_WIDTH = 20

                    -- 处理标签宽度
                    local label = vim_item.abbr
                    local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
                    if truncated_label ~= label then
                      vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
                    elseif string.len(label) < MIN_LABEL_WIDTH then
                      local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
                      vim_item.abbr = label .. padding
                    end

                    local lspkind_ok, lspkind = pcall(require, "lspkind")
                    if not lspkind_ok then
                      -- From kind_icons array
                      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                      -- Source
                      vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[LaTeX]",
                      })[entry.source.name]
                      return vim_item
                    else
                      -- From lspkind
                      local item = lspkind.cmp_format()(entry, vim_item)
                      -- 重新应用宽度处理，因为lspkind.cmp_format可能会修改abbr
                      label = item.abbr
                      truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
                      if truncated_label ~= label then
                        item.abbr = truncated_label .. ELLIPSIS_CHAR
                      elseif string.len(label) < MIN_LABEL_WIDTH then
                        local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
                        item.abbr = label .. padding
                      end
                      return item
                    end
                  end
                },

              })
            end
          }
        }
