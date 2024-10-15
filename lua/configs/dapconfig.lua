local dap = require "dap"

dap.adapters.coreclr = {
  type = "executable",
  command = "C:/Users/mschmitt/AppData/Local/nvim-data/mason/bin/netcoredbg.cmd",
  args = {"--interpreter=vscode"},
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/net*/", "file")
    end,
  },
}
