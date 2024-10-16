-- This is my reference
-- https://github.com/Wiebesiek/ZeoVim


local dap = require "dap"

dap.adapters.coreclr = {
  type = "executable",
  command = vim.fs.normalize(vim.fn.stdpath('data') .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe"),
  args = {"--interpreter=vscode"},
}

dap.configurations.cs = {
  {
    justMyCode = false,
    stopAtEntry = false,
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll: ", vim.fs.normalize(vim.fn.getcwd()) .. "/bin/Debug/net8.0/", "file")
    end,
    env = {
      ASPNETCORE_ENVIRONMENT = function()
        return vim.fn.input("ASPNETCORE_ENVIRONMENT: ", "Development")
      end,
      ASPNETCORE_URLS = function()
        return "http://localhost:5050"
      end,
    },
    cwd = function()
      return vim.fn.input("Workspace Folder: ", vim.fn.getcwd() .. "/", "file")
    end,
  },
}
