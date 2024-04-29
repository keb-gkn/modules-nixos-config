require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

vim.opt.rtp:prepend(lazypath)
require "plugins"

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

dofile(vim.g.base46_cache .. "defaults")
