local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map({ "n", "v" }, "<C-a>", "ggVG", opts, { desc = "Select All" })
map("v", "<C-c>", "y", opts, { desc = "Copy" })
map({ "n", "i" }, "<C-v>", "<ESC>pa", opts, { desc = "Paste" })
map({ "n", "v" }, "<C-x>", "d", opts, { desc = "Cut" })
map({ "n", "v" }, "<C-z>", "<cmd>undo<CR>", opts, { desc = "Undo" })

map(
	"n",
	"j",
	'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
	{ expr = true },
	{ desc = "Move Cursor Down (Allow Wrapped)" }
)
map(
	"n",
	"k",
	'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
	{ expr = true },
	{ desc = "Move Cursor Up (Allow Wrapped)" }
)

map("n", "<C-h>", "<C-w>h", opts, { desc = "Move Cursor Left Buffer" })
map("n", "<C-j>", "<C-w>j", opts, { desc = "Move Cursor Down Buffer" })
map("n", "<C-k>", "<C-w>k", opts, { desc = "Move Cursor Up Buffer" })
map("n", "<C-l>", "<C-w>l", opts, { desc = "Move Cursor Right Buffer" })

map({ "n", "i" }, "<C-s>", "<ESC><cmd>w<CR>", opts, { desc = "Save" })
map({ "n", "v" }, "<Leader>q", "<cmd>qa!<CR>", opts, { desc = "Quit" })

map({ "n", "i" }, "<M-Up>", "<Esc><cmd>m-2<CR>", opts, { desc = "Move Line Up (Insert)" })
map({ "n", "i" }, "<M-Down>", "<Esc><cmd>m+<CR>", opts, { desc = "Move Line Down (Insert)" })
map("x", "<M-Up>", ":move '<-2<CR>gv-gv", opts, { desc = "Move Line Up (Visual)" })
map("x", "<M-Down>", ":move '>+1<CR>gv-gv", opts, { desc = "Move Line Down (Visual)" })

map({ "n", "v" }, "<C-Up>", "<cmd>resize +2<CR>", opts, { desc = "Resize Window Up" })
map({ "n", "v" }, "<C-Down>", "<cmd>resize -2<CR>", opts, { desc = "Resize Window Down" })
map({ "n", "v" }, "<C-Left>", "<cmd>vertical resize +2<CR>", opts, { desc = "Resize Window Left" })
map({ "n", "v" }, "<C-Right>", "<cmd>vertical resize -2<CR>", opts, { desc = "Resize Window Right" })

map("i", "<C-j>", "<Down>", opts, { desc = "Move Cursor Down in Insert Mode" })
map("i", "<C-k>", "<Up>", opts, { desc = "Move Cursor Up in Insert Mode" })
map("i", "<C-h>", "<Left>", opts, { desc = "Move Cursor Left in Insert Mode" })
map("i", "<C-l>", "<Right>", opts, { desc = "Move Cursor Right in Insert Mode" })

map("n", "<Enter>", "<cmd>nohlsearch<CR>", opts, { desc = "Clear Highlight" })

-- Lazy:
map("n", "<Leader>pC", "<cmd>Lazy clean<CR>", opts, { desc = "Lazy Clean" })
map("n", "<Leader>pc", "<cmd>Lazy log<CR>", opts, { desc = "Lazy Log" })
map("n", "<Leader>pi", "<cmd>Lazy install<CR>", opts, { desc = "Lazy Install" })
map("n", "<Leader>ps", "<cmd>Lazy sync<CR>", opts, { desc = "Lazy Sync" })
map("n", "<Leader>pS", "<cmd>Lazy show<CR>", opts, { desc = "Lazy Status" })
map("n", "<Leader>pu", "<cmd>Lazy update<CR>", opts, { desc = "Lazy Update" })

-- Options:
map("n", "<Leader>oa", "<cmd>Ranger<CR>", opts, { desc = "Ranger" })
map("n", "<Leader>ow", "<cmd>lua require('tevim.core.utils').toggle_option('wrap')<CR>", opts, { desc = "Toggle Wrap" })
map("n", "<Leader>os", "<cmd>lua require('tevim.core.utils').toggle_option('spell')<CR>", opts, { desc = "Toggle Spell" })
map("n", "<Leader>on", "<cmd>lua require('tevim.core.utils').toggle_option('number')<CR>", opts,
	{ desc = "Toggle Number" })
map("n", "<Leader>or", "<cmd>lua require('tevim.core.utils').toggle_option('relativenumber')<CR>", opts,
	{ desc = "Toggle Relative Number" })

-- Windows:
map("n", "<Leader>wv", "<C-w>v", opts, { desc = "Vertical Split" })
map("n", "<Leader>wh", "<C-w>s", opts, { desc = "Horizontal Split" })
map("n", "<Leader>we", "<C-w>=", opts, { desc = "Make Splits Equal" })
map("n", "<Leader>wq", "<cmd>close<CR>", opts, { desc = "Close Split" })

-- Telescope:
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", opts, { desc = "Find File" })
map("n", "<Leader>fr", "<cmd>Telescope oldfiles<CR>", opts, { desc = "Recent File" })
map("n", "<Leader>fw", "<cmd>Telescope live_grep<CR>", opts, { desc = "Find Text" })
map("n", "<Leader>fm", "<cmd>Telescope keymaps<CR>", opts, { desc = "Keymaps" })
map("n", "<Leader>fM", "<cmd>Telescope man_pages<CR>", opts, { desc = "Man Pages" })
map("n", "<Leader>fR", "<cmd>Telescope registers<CR>", opts, { desc = "Registers" })
map("n", "<Leader>fj", "<cmd>Telescope commands<CR>", opts, { desc = "Commands" })
map("n", "<Leader>fh", "<cmd>Telescope highlights<CR>", opts, { desc = "Highlights" })
map("n", "<Leader>ft", "<cmd>TodoTelescope<CR>", opts, { desc = "Todo" })

-- Git:
map("n", "<Leader>gl", "<cmd>LazyGit<CR>", opts, { desc = "Lazygit" })
map("n", "<Leader>gj", "<cmd>Gitsigns next_hunk<CR>", opts, { desc = "Next Hunk" })
map("n", "<Leader>gk", "<cmd>Gitsigns prev_hunk<CR>", opts, { desc = "Prev Hunk" })
map("n", "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts, { desc = "Reset Hunk" })
map("n", "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts, { desc = "Preview Hunk" })
map("n", "<Leader>gR", "<cmd>Gitsigns reset_buffer<CR>", opts, { desc = "Reset Buffer" })
map("n", "<Leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts, { desc = "Stage Hunk" })
map("n", "<Leader>gS", "<cmd>Gitsigns undo_stage_hunk<CR>", opts, { desc = "Undo Stage Hunk" })
map("n", "<Leader>gb", "<cmd>Gitsigns blame_line<CR>", opts, { desc = "Blame Line" })
map("n", "<Leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", opts, { desc = "Diff" })
map("n", "<Leader>go", "<cmd>Telescope git_status<CR>", opts, { desc = "Open Changed File" })
map("n", "<Leader>gc", "<cmd>Telescope git_branches<CR>", opts, { desc = "Checkout Branch" })
map("n", "<Leader>gm", "<cmd>Telescope git_commits<CR>", opts, { desc = "Checkout Commit" })

-- LSP:
map("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts, { desc = "Code Action" })
map("n", "<Leader>li", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", opts,
	{ desc = "Toggle InlayHints" })
map("n", "<Leader>lI", "<cmd>LspInfo<CR>", opts, { desc = "Info" })
map("n", "<Leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts, { desc = "Next Diagnostic" })
map("n", "<Leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts, { desc = "Prev Diagnostic" })
map("n", "<Leader>lo", "<cmd>Lspsaga outline<CR>", opts, { desc = "Outline" })
map("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts, { desc = "Rename" })
map("n", "<Leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts, { desc = "Document Symbols" })
map("n", "<Leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts, { desc = "Workspace Symbols" })

-- Treesitter:
map("n", "<Leader>si", "<cmd>TSInstallInfo<CR>", opts, { desc = "Treesitter Info" })
map("n", "<Leader>su", "<cmd>TSUpdate<CR>", opts, { desc = "Treesitter Update" })

-- Terminal:
map("n", "<Leader>t1", "<cmd>1ToggleTerm<CR>", opts, { desc = "Terminal 1" })
map("n", "<Leader>t2", "<cmd>2ToggleTerm<CR>", opts, { desc = "Terminal 2" })
map("n", "<Leader>t3", "<cmd>3ToggleTerm<CR>", opts, { desc = "Terminal 3" })
map("n", "<Leader>t4", "<cmd>4ToggleTerm<CR>", opts, { desc = "Terminal 4" })
map("n", "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts, { desc = "Float Terminal" })
map("n", "<Leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", opts, { desc = "Horizontal Terminal" })
map("n", "<Leader>tv", "<cmd>ToggleTerm size=50 direction=vertical<CR>", opts, { desc = "Vertical Terminal" })

-- TeVim:
map("n", "<Leader><Leader>u", "<cmd>TeVimUpdate<CR>", opts, { desc = "Update TeVim" })
map("n", "<Leader><Leader>m", "<cmd>TeVimCheckMason<CR>", opts, { desc = "Check Mason" })
map("n", "<Leader><Leader>t", "<cmd>TeVimToggleTrans<CR>", opts, { desc = "Toggle Transparency" })
map("n", "<Leader><Leader>c", "<cmd>TeVimThemes<CR>", opts, { desc = "TeVim Themes" })
