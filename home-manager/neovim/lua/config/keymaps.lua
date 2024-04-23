
vim.api.nvim_set_keymap(
  "n",
  "<c-c>",
  "\"+y",
  { noremap = false }
)

vim.api.nvim_set_keymap(
  "v",
  "<c-c>",
  "\"+y",
  { noremap = false }
)

vim.api.nvim_set_keymap(
  "n",
  "<c-v>",
  "\"+p",
  { noremap = false }
)

vim.api.nvim_set_keymap(
  "v",
  "<c-v>",
  "\"+p",
  { noremap = false }
)

vim.api.nvim_set_keymap(
  "i",
  "<c-v>",
  "<c-r>+",
  { noremap = true}
)

vim.api.nvim_set_keymap(
  "c",
  "<c-v>",
  "<c-r>+",
  { noremap = true}
)

vim.api.nvim_set_keymap(
  "i",
  "<c-r>",
  "<c-v>",
  { noremap = true}
)
