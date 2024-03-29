-- leader key 为空格
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

local opt = {
  noremap = true,
  silent = true,
}
-- 插件快捷键
local pluginKeys = {}
-- 本地变量
local map = vim.api.nvim_set_keymap


map("n", "<leader>w", ":w!<CR>", opt)
map("n", "<leader>sq", ":wqa!<CR>", opt)
map("n", "<leader>ss", ":wall<CR>", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- terminal key
map("t", "<leader>q", [[<C-\><C-n>]], opt)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opt)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opt)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opt)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opt)
map("n", "<leader>t", [[:ToggleTerm<CR>]], opt)
map("n", "<tab>t", [[:ToggleTermToggleAll<CR>]], opt)
-- telescope key
map("n", "<leader>q", ":Telescope lsp_definitions<CR>", opt)
map("n", "<leader>f", ":Telescope live_grep<CR>", opt)
map("n", "<leader>p", ":Telescope find_files<CR>", opt)

-- nvimTree  alt+m 打开菜单 -> a 创建文件 -> o 打开文件夹 -> r 重命名为 -> c 拷贝 -> p 粘贴 -> d 删除文件
map('n', '<leader>m', ':NvimTreeToggle<CR>', opt)
-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
  { key = { "o", "<2-LeftMouse>" }, action = "edit" },
  { key = "<CR>", action = "system_open" },
  -- v分屏打开文件
  { key = "v", action = "vsplit" },
  -- h分屏打开文件
  { key = "h", action = "split" },
  -- Ignore (node_modules)
  { key = "i", action = "toggle_ignored" },
  -- Hide (dotfiles)
  { key = ".", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  -- 文件操作
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "I", action = "toggle_file_info" },
  { key = "n", action = "tabnew" },
  -- 进入下一级
  { key = { "]" }, action = "cd" },
  -- 进入上一级
  { key = { "[" }, action = "dir_up" },
}
-- buffer左右Tab切换
map("n", "<tab>k", ":bp<CR>", opt)
map("n", "<tab>j", ":bn<CR>", opt)
map("n", "<leader>bd", ":bd<CR>", opt) -- 关闭当前 buffer
-- treesitter 折叠
--map("n", "zz", ":foldclose<CR>", opt)
--map("n", "Z", ":foldopen<CR>", opt)
-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)
-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  -- go xx
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- leader + =
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

return pluginKeys
