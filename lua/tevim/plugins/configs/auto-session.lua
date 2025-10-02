return {
"rmagatti/auto-session",
event = "VimEnter",
config = function()
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require("auto-session").setup({
auto_session_enable = true,
auto_save = true,
auto_restore = true,
session_lens = {
load_on_setup = true,
theme_conf = { border = true },
previewer = true,
},
pre_save_cmds = {},
post_restore_cmds = {},
suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/.local/share/nvim/leetcode" },
cwd_change_handling = true,
post_cwd_changed_cmds = {
function()
require("lualine").refresh()
end,
},
})

vim.keymap.set("n", "<leader>so", "<cmd>SessionSearch<CR>", { desc = "Open Session" })
vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save Session" })
vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Delete Session" })
end,
}