local fzf = require("fzf-lua")
local replaceword = require("tevim.core.utils").replaceword

local M = {}

-- Function to check if directory exists
local function dir_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
    return true
  end
  return false
end

-- Safely read directory contents
local function safe_readdir(path)
  if not dir_exists(path) then
    return {}
  end
  local success, result = pcall(vim.fn.readdir, path)
  if success then
    return result
  else
    return {}
  end
end

local themes = {}
local original_theme = vim.g.TeVimTheme

-- Read themes from tevim directory
local tevim_themes_path = vim.fn.stdpath("config") .. "/lua/tevim/themes/schemes"
for _, file in ipairs(safe_readdir(tevim_themes_path)) do
  table.insert(themes, vim.fn.fnamemodify(file, ":r"))
end

-- Read themes from custom directory
local custom_themes_path = vim.fn.stdpath("config") .. "/lua/custom/themes/schemes"
for _, file in ipairs(safe_readdir(custom_themes_path)) do
  table.insert(themes, vim.fn.fnamemodify(file, ":r"))
end

table.sort(themes)

M.setTheme = function(theme)
  if not theme or theme == "" then
    return
  end

  vim.g.TeVimTheme = theme
  local colors = require("tevim.themes").getCurrentTheme()

  -- Safely call theme functions with error handling
  local success, err = pcall(function()
    require("tevim.themes").setTermColors(colors)
    require("plenary.reload").reload_module("tevim.themes")
    require("tevim.themes").load()
    replaceword(
      "vim.g.TeVimTheme",
      '"' .. (original_theme or "") .. '"',
      '"' .. theme .. '"',
      vim.fn.stdpath("config") .. "/lua/custom/options.lua"
    )
  end)

  if not success then
    vim.notify("Error setting theme: " .. tostring(err), vim.log.levels.ERROR)
  end
end

-- Preview function for live theme changes
local function preview_theme(theme)
  if not theme or theme == "" then
    return
  end

  pcall(function()
    vim.g.TeVimTheme = theme
    local colors = require("tevim.themes").getCurrentTheme()
    require("tevim.themes").setTermColors(colors)
    require("plenary.reload").reload_module("tevim.themes")
    require("tevim.themes").load()
  end)
end

M.setup = function()
  if #themes == 0 then
    vim.notify("No themes found", vim.log.levels.WARN)
    return
  end

  -- Store original theme for restoration on escape
  original_theme = vim.g.TeVimTheme

  local opts = {
    prompt = " TEVIM COLORSCHEMES> ",
    winopts = {
      height = 0.4,
      width = 0.2,
      title = " TEVIM COLORSCHEMES ",
      title_pos = "center",
    },
    fzf_opts = {
      ["--no-multi"] = true,
      ["--layout"] = "reverse",
      ["--preview-window"] = "hidden",
    },
    keymap = {
      builtin = {
        ["<esc>"] = function()
          -- Restore original theme on escape
          if original_theme then
            preview_theme(original_theme)
          end
          return "abort"
        end,
      },
    },
    actions = {
      ["default"] = function(selected)
        if selected and #selected > 0 then
          M.setTheme(selected[1])
        end
      end,
    },
    previewer = {
      function(selected)
        if selected then
          preview_theme(selected[1])
        end
      end
    }
  }

  fzf.fzf_exec(themes, opts)
end

M.toggleTransparency = function()
  vim.g.transparency = not vim.g.transparency

  local success, err = pcall(function()
    -- Validate that theme loading functions exist and work properly
    local themes_module = require("tevim.themes")

    if themes_module and type(themes_module.load) == "function" then
      themes_module.load()
    else
      error("tevim.themes.load function not available")
    end

    -- Only try to replace if replaceword function exists
    if replaceword and type(replaceword) == "function" then
      replaceword(
        "vim.g.transparency",
        tostring(not vim.g.transparency),
        tostring(vim.g.transparency),
        vim.fn.stdpath("config") .. "/lua/custom/options.lua"
      )
    else
      vim.notify("replaceword function not available, transparency setting not saved", vim.log.levels.WARN)
    end
  end)

  if not success then
    vim.notify("Error toggling transparency: " .. tostring(err), vim.log.levels.ERROR)
    -- Revert transparency change if there was an error
    vim.g.transparency = not vim.g.transparency
  else
    vim.notify("Transparency toggled: " .. tostring(vim.g.transparency), vim.log.levels.INFO)
  end
end

return M
