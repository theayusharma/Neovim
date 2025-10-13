return {
  "catgoose/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    filetypes = { "*" },
    user_default_options = {
      tailwind = true,
      mode = "background",
      names = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    },
  },
  config = function(_, opts)
    local ok, colorizer = pcall(require, "colorizer")
    if not ok then return end
    colorizer.setup(opts)

    local ns = vim.api.nvim_create_namespace("ColorizerInlineSwatch")
    local function add_swatch(buf)
      vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      for i, line in ipairs(lines) do
        for s, e in line:gmatch("()#%x%x%x%x%x%x()") do
          vim.api.nvim_buf_set_extmark(buf, ns, i - 1, e - 1, {
            -- virt_text = { { " ███", "Normal" } },
            -- virt_text_pos = "inline",
            hl_mode = "combine",
            priority = 200,
          })
        end
      end
    end

    local grp = vim.api.nvim_create_augroup("ColorizerInlineAttach", { clear = true })
    vim.api.nvim_create_autocmd({ "BufReadPost", "TextChanged", "TextChangedI" }, {
      group = grp,
      callback = function(args) add_swatch(args.buf) end,
    })
  end,
}

