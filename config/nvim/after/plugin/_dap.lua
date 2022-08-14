local dap, dapui, sign_define = require "dap", require "dapui", vim.fn.sign_define

Map("n", "<F4>", dap.toggle_breakpoint, { silent = true })
Map("n", "<F16>", function() dapui.float_element('breakpoints', {enter = true}) end, { silent = true })
Map("n", "<F28>", function()
  vim.ui.input({ prompt = 'Breakpoint condition: ' }, function(input)
    dap.set_breakpoint(input)
   end)
end, { silent = true })
Map("n", "g<F28>", function()
  vim.ui.input({ prompt = 'Log Point message: ' }, function(input)
    dap.set_breakpoint(nil, nil, input)
   end)
end, { silent = true })

Map("n", "<F5>", dap.continue, { silent = true })
Map("n", "<F17>", dap.pause, { silent = true })

Map("n", "<F6>", function() dapui.float_element('stacks', {enter = true}) end, { silent = true })
Map("n", "<F19>", function() dapui.float_element('console', {enter = true}) end, { silent = true })

Map("n", "<F9>", dap.step_over, { silent = true })
Map("n", "<F21>", dap.goto_, { silent = true })

Map("n", "<F10>", dap.step_into, { silent = true })
Map("n", "<F20>", dap.step_out, { silent = true })

Map("n", "<F11>", dap.up, { silent = true })
Map("n", "<F23>", dap.down, { silent = true })

Map("n", "<F12>", dap.repl.toggle, { silent = true })
Map("n", "<F24>", dap.disconnect, { silent = true })

-- TODO: setup configurations for debug options
-- dap.configuration.rust = {}

-- setting up debugger ui
dapui.setup {
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.5 },
        { id = "watches", size = 0.5 },
      },
      size = 50,
      position = "left",
    },
  },
}

sign_define('DapBreakpoint', {text='◉', texthl='', linehl='', numhl=''})
sign_define('DapBreakpointCondition', {text='◍', texthl='', linehl='', numhl=''})
sign_define('DapLogPoint', {text='○', texthl='', linehl='', numhl=''})

-- open dapui when start debugging
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  vim.opt.ls = 3
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  vim.opt.ls = 2
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  vim.opt.ls = 2
end

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode", -- adjust as needed, must be absolute path
  name = "lldb",
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input {
        prompt = "Target: ",
        default = vim.fn.getcwd() .. "/target/",
        completion = "file_in_path",
      }
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}