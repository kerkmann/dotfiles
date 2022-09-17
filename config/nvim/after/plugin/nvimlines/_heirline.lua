-- statusline
-- left: Mode, Branch, Git changes
-- mid: ft icon, filename
-- rigt diagnostic, lsp, line info, ft

-- tabline
-- ft icon, filename, close button

-- winbar
-- fullpath, modified indicator
L("heirline", function(heirline)
  -- local statusline = require("after.plugin.nvimlines.statusline")
  local winbar = require("after.plugin.nvimlines.winbar")
  heirline.setup({}, winbar, {})
end)
