-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到 nvim-tree")
  return
end

nvim_tree.setup({
  -- 完全禁止内置netrw
  disable_netrw = true,
  -- 不显示 git 状态图标
  git = {
    enable = false,
  },
  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    -- 隐藏 .文件
    dotfiles = false,
    -- 隐藏 node_modules 文件夹
    -- custom = { "node_modules" },
  },
  view = {
    -- 宽度
    width = 34,
    -- 也可以 'left'
    side = "right",
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = "yes",
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时关闭 tree
      quit_on_open = false,
    },
  },
})
