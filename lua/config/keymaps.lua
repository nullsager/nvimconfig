vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<Esc>",
  "<cmd>nohlsearch<CR>",
  { noremap = true, silent = true }
)

vim.keymap.set(
  { "v", "n", "i", "t" },
  "<C-h>",
  [[<Cmd>wincmd h<CR>]],
  { desc = "将光标切换到左窗口" }
)
vim.keymap.set(
  { "v", "n", "i", "t" },
  "<C-j>",
  [[<Cmd>wincmd j<CR>]],
  { desc = "将光标切换到下窗口" }
)
vim.keymap.set(
  { "v", "n", "i", "t" },
  "<C-k>",
  [[<Cmd>wincmd k<CR>]],
  { desc = "将光标切换到上窗口" }
)
vim.keymap.set(
  { "v", "n", "i", "t" },
  "<C-l>",
  [[<Cmd>wincmd l<CR>]],
  { desc = "将光标切换到右窗口" }
)
vim.keymap.set({ "v", "n", "i", "t" }, "<M-h>", [[<Cmd>wincmd H<CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-j>", [[<Cmd>wincmd J<CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-k>", [[<Cmd>wincmd K<CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-l>", [[<Cmd>wincmd L<CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-->", [[<Cmd>wincmd s<CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-\\>", [[<Cmd>wincmd v<CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-up>", [[<Cmd>wincmd +<CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-down>", [[<Cmd>wincmd -<CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-left>", [[<Cmd>wincmd <Lt><CR>]])
vim.keymap.set({ "v", "n", "i", "t" }, "<M-right>", [[<Cmd>wincmd ><CR>]])
vim.keymap.set("n", "[t", ":tabnext<CR>", { desc = "切换到下一个tab" })
vim.keymap.set("n", "]t", ":tabnext<CR>", { desc = "切换到上一个tab" })
vim.keymap.set({ "v", "n" }, "<leader>q", ":q<CR>", { desc = "退出" })
