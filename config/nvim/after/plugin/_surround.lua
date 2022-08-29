local surround = L "nvim-surround"
if not surround then
  return
end
-- local async = require 'plenary.async'

surround.setup {
  --[[ surrounds = {
    ["t"] = {
      add = function()
        local tx, rx = async.control.channel.oneshot()
        async.run(function()
          vim.ui.input({ prompt = "Enter input: " }, function(input)
            local element = input:match("^<?([^%s>]*)")
            local attributes = input:match("^<?[^%s>]*%s+(.-)>?$")

            local open = attributes and element .. " " .. attributes or element
            local close = element

            tx({ { "<" .. open .. ">" }, { "</" .. close .. ">" } })
          end)
        end)
        return rx()
      end,
      change = {
        replacement = function()
          local tx, rx = async.control.channel.oneshot()
          async.run(function()
            vim.ui.input({ prompt = "Enter HTML tag: " }, function(input)
              local element = input:match("^<?([^%s>]*)")
              local attributes = input:match("^<?[^%s>]*%s+(.-)>?$")

              local open = attributes and element .. " " .. attributes or element
              local close = element

              tx({ { open }, { close } })
            end)
          end)
          return rx()
        end,
      },
    },
    ["T"] = {
      add = function()
        local tx, rx = async.control.channel.oneshot()
        async.run(function()
          vim.ui.input({ prompt = "Enter input: " }, function(input)
            local element = input:match("^<?([^%s>]*)")
            local attributes = input:match("^<?[^%s>]*%s+(.-)>?$")

            local open = attributes and element .. " " .. attributes or element
            local close = element

            tx({ { "<" .. open .. ">" }, { "</" .. close .. ">" } })
          end)
        end)
        return rx()
      end,
      change = {
        replacement = function()
          local tx, rx = async.control.channel.oneshot()
          async.run(function()
            vim.ui.input({ prompt = "Enter input: " }, function(input)
              local element = input:match("^<?([^%s>]*)")
              local attributes = input:match("^<?[^%s>]*%s+(.-)>?$")

              local open = attributes and element .. " " .. attributes or element
              local close = element

              tx({ { open }, { close } })
            end)
          end)
          return rx()
        end,
      },
    },
  } ]]
}
