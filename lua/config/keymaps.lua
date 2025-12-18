local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map({ "n", "v", "i" }, "<C-a>", "<ESC>ggVG", opts)
map("v", "<C-c>", "y", opts)
map({ "n", "i" }, "<C-v>", "<ESC>pa", opts)
map({ "n", "v" }, "<C-x>", "d", opts)
map({ "n", "v", "i" }, "<C-z>", "<cmd>undo<CR>", opts)

map("n", "<A-Tab>", function()
  require("fzf-lua").buffers({
    sort_mru = true,
    ignore_current_buffer = true,
    previewer = false,
  })
end, opts)

map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

map("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
map("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
map("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
map("n", "<C-l>", "<cmd>wincmd l<CR>", opts)

map({ "n", "i" }, "<C-s>", "<ESC><cmd>w<CR>", opts)
map({ "n", "v" }, "<Leader>q", "<cmd>qa!<CR>", opts)

map({ "n", "i" }, "<M-Up>", "<Esc><cmd>m-2<CR>", opts)
map({ "n", "i" }, "<M-Down>", "<Esc><cmd>m+<CR>", opts)
map("x", "<M-Up>", ":move '<-2<CR>gv-gv", opts)
map("x", "<M-Down>", ":move '>+1<CR>gv-gv", opts)

map({ "n", "v" }, "<C-Up>", "<cmd>resize +2<CR>", opts)
map({ "n", "v" }, "<C-Down>", "<cmd>resize -2<CR>", opts)
map({ "n", "v" }, "<C-Left>", "<cmd>vertical resize +2<CR>", opts)
map({ "n", "v" }, "<C-Right>", "<cmd>vertical resize -2<CR>", opts)

map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)

map("n", "<Enter>", "<cmd>nohlsearch<CR>", opts)

map({ "n", "v" }, "<Leader>wv", "<C-w>v", opts)
map({ "n", "v" }, "<Leader>wh", "<C-w>s", opts)
map({ "n", "v" }, "<Leader>we", "<C-w>=", opts)
map({ "n", "v" }, "<Leader>wq", "<cmd>close<CR>", opts)

map({ "n", "v" }, "<Leader>ff", "<cmd>FzfLua files<CR>", opts)
map({ "n", "v" }, "<Leader>fr", "<cmd>FzfLua oldfiles<CR>", opts)
map({ "n", "v" }, "<Leader>fw", "<cmd>FzfLua live_grep<CR>", opts)
map({ "n", "v" }, "<Leader>fm", "<cmd>FzfLua keymaps<CR>", opts)
map({ "n", "v" }, "<Leader>fM", "<cmd>FzfLua man_pages<CR>", opts)
map({ "n", "v" }, "<Leader>fR", "<cmd>FzfLua registers<CR>", opts)
map({ "n", "v" }, "<Leader>fj", "<cmd>FzfLua commands<CR>", opts)
map({ "n", "v" }, "<Leader>fh", "<cmd>FzfLua highlights<CR>", opts)
map({ "n", "v" }, "<Leader>ft", "<cmd>TodoFzfLua<CR>", opts)

map({ "n", "v" }, "<Leader>gl", "<cmd>LazyGit<CR>", opts)
map({ "n", "v" }, "<Leader>go", "<cmd>FzfLua git_status<CR>", opts)
map({ "n", "v" }, "<Leader>gc", "<cmd>FzfLua git_branches<CR>", opts)
map({ "n", "v" }, "<Leader>gm", "<cmd>FzfLua git_commits<CR>", opts)
map({ "n", "v" }, "<Leader>gj", "<cmd>Gitsigns next_hunk<CR>", opts)
map({ "n", "v" }, "<Leader>gk", "<cmd>Gitsigns prev_hunk<CR>", opts)
map({ "n", "v" }, "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
map({ "n", "v" }, "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)
map({ "n", "v" }, "<Leader>gR", "<cmd>Gitsigns reset_buffer<CR>", opts)
map({ "n", "v" }, "<Leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts)
map({ "n", "v" }, "<Leader>gS", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
map({ "n", "v" }, "<Leader>gb", "<cmd>Gitsigns blame_line<CR>", opts)
map({ "n", "v" }, "<Leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", opts)

map({ "n", "v" }, "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map({ "n", "v" }, "<Leader>li", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", opts)
map({ "n", "v" }, "<Leader>lI", "<cmd>LspInfo<CR>", opts)
map({ "n", "v" }, "<Leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
map({ "n", "v" }, "<Leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
map({ "n", "v" }, "<Leader>lo", "<cmd>Lspsaga outline<CR>", opts)
map({ "n", "v" }, "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map({ "n", "v" }, "<Leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", opts)
map({ "n", "v" }, "<Leader>lS", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts)

map({ "n", "v" }, "<Leader>si", "<cmd>TSInstallInfo<CR>", opts)
map({ "n", "v" }, "<Leader>su", "<cmd>TSUpdate<CR>", opts)

map({ "n", "v" }, "<Leader>t1", "<cmd>1ToggleTerm<CR>", opts)
map({ "n", "v" }, "<Leader>t2", "<cmd>2ToggleTerm<CR>", opts)
map({ "n", "v" }, "<Leader>t3", "<cmd>3ToggleTerm<CR>", opts)
map({ "n", "v" }, "<Leader>t4", "<cmd>4ToggleTerm<CR>", opts)
map({ "n", "v" }, "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
map({ "n", "v" }, "<Leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", opts)
map({ "n", "v" }, "<Leader>tv", "<cmd>ToggleTerm size=50 direction=vertical<CR>", opts)

map("n", "<c-w>", "<cmd>bdelete<cr>", { desc = "close current file" })

--yazi boi
map("n", "<leader>e", "<cmd>Yazi cwd<cr>")
map("n", "<space><space>", "<cmd>Yazi toggle<cr>")
map("n", "<leader>ow", "<cmd>Yazi<cr>")
map("n", "<c-w>", "<cmd>bdelete<cr>")

map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<s-tab>", "<cmd>b#<cr>", { desc = "Last used buffer" })
