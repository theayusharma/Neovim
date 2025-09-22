local colors = require("tevim.themes").getCurrentTheme()
local utils = require("tevim.core.utils")

return {
  FzfLuaNormal = { bg = colors.darker },
  FzfLuaBorder = { fg = colors.darker, bg = colors.darker },

  FzfLuaPromptTitle = { fg = colors.background, bg = colors.red },
  FzfLuaPromptBorder = { fg = colors.lighter, bg = colors.lighter },
  FzfLuaPromptNormal = { fg = colors.foreground, bg = colors.lighter },

  FzfLuaPreviewTitle = { fg = colors.background, bg = colors.blue },
  FzfLuaPreviewBorder = { bg = colors.darker, fg = colors.darker },

  FzfLuaResultsTitle = { fg = colors.background, bg = colors.green },
  FzfLuaResultsBorder = { bg = colors.darker, fg = colors.darker },

  FzfLuaMatching = { bold = true },
  FzfLuaSelection = { bg = colors.lighter, fg = colors.blue, bold = true },
  FzfLuaResultsDiffAdd = { fg = colors.green },
  FzfLuaResultsDiffChange = { fg = colors.blue },
  FzfLuaResultsDiffDelete = { fg = colors.red },
}
