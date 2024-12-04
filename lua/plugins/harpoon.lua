return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "添加任务" })

    vim.keymap.set("n", "<M-1>", function()
      harpoon:list():select(1)
    end, { desc = "切换到第1个文件" })
    vim.keymap.set("n", "<M-2>", function()
      harpoon:list():select(2)
    end, { desc = "切换到第2个文件" })
    vim.keymap.set("n", "<M-3>", function()
      harpoon:list():select(3)
    end, { desc = "切换到第3个文件" })
    vim.keymap.set("n", "<M-4>", function()
      harpoon:list():select(4)
    end, { desc = "切换到第4个文件" })

    vim.keymap.set("n", "]h", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "[h", function()
      harpoon:list():next()
    end)

    local function toggle_telescope(harpoon_files)
      local finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(paths, item.value)
        end

        return require("telescope.finders").new_table({
          results = paths,
        })
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = finder(),
          previewer = false,
          sorter = require("telescope.config").values.generic_sorter({}),
          layout_config = {
            height = 0.4,
            width = 0.5,
            prompt_position = "top",
            preview_cutoff = 120,
          },
          attach_mappings = function(prompt_bufnr, map)
            map("i", "<C-d>", function()
              local state = require("telescope.actions.state")
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_bufnr)

              table.remove(harpoon_files.items, selected_entry.index)
              current_picker:refresh(finder())
            end)
            return true
          end,
        })
        :find()
    end

    vim.keymap.set("n", "<leader>ht", function()
      toggle_telescope(harpoon:list())
    end, { desc = "打开harpoon任务菜单" })
  end,
}
