local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  group = augroup("create_dir", { clear = true }),
  callback = function(args)
    if args.match:match("^%w%w+://") then
      return
    end
    vim.fn.mkdir(vim.fn.fnamemodify(vim.uv.fs_realpath(args.match) or args.match, ":p:h"), "p")
  end,
})

autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float({ scope = "cursor", focusable = false })
  end,
})

autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.cursorline = false
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})

autocmd("BufWinEnter", {
  group = augroup("q_close_windows", { clear = true }),
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
    if vim.tbl_contains({ "help", "nofile", "quickfix" }, buftype) and vim.fn.maparg("q", "n") == "" then
      vim.keymap.set("n", "q", "<cmd>close<cr>", {
        buffer = args.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
})

autocmd("FileType", {
  group = augroup("unlist_quickfix", { clear = true }),
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
