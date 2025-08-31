return {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  cmd = "TodoTelescope",
  opts = { signs = false },
}