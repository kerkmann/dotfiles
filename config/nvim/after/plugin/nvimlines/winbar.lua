local conditions = L "heirline.conditions"
local utils = L "heirline.utils"
local colors = {
  special = utils.get_highlight("SpecialKey").fg,
  default = utils.get_highlight("Title").fg,

}
local winbar_component = {
    fallthrough = false,
    {   -- Hide the winbar for special buffers
        condition = function()
            return conditions.buffer_matches({
                buftype = { "nofile", "prompt", "help", "quickfix" },
                filetype = { "^git.*", "^Neogit" },
            })
        end,
        init = function()
            vim.opt_local.winbar = nil
        end
    },
    {   -- A special winbar for terminals
        condition = function()
            return conditions.buffer_matches({ buftype = { "terminal" } })
        end,
        utils.surround({ "", "" }, colors.special, {
            FileType,
            Space,
            TerminalName,
        }),
    },
    {   -- An inactive winbar for regular files
        condition = function()
            return not conditions.is_active()
        end,
        utils.surround({ "", "" }, colors.default, { hl = { fg = "gray", force = true }, FileNameBlock }),
    },
    -- A winbar for regular files
    -- utils.surround({ "", "" }, "bright_bg", FileNameBlock),
}

local winbar = {}
table.insert(winbar, winbar_component)

return winbar
