return {
  "lewis6991/gitsigns.nvim",
  ft = { "gitcommit", "diff" },
  init = function()
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
      callback = function()
        -- Use vim.uv instead of vim.loop (updated API)
        vim.fn.jobstart({ "git", "-C", vim.uv.cwd(), "rev-parse" }, {
          on_exit = function(_, return_code)
            if return_code == 0 then
              -- Safe deletion with error handling
              pcall(vim.api.nvim_del_augroup_by_name, "GitSignsLazyLoad")
              vim.schedule(function()
                require("lazy").load({ plugins = { "gitsigns.nvim" } })
              end)
            end
          end,
        })
      end,
      desc = "Load gitsigns only if git repository",
    })
  end,
  opts = function()
    return require("tevim.plugins.configs.gitsign")
  end,
}