local create_cmd = vim.api.nvim_create_user_command

local function setProjectRootByCurrentBuffer()
  -- get path by test file
  local path = vim.fn.expand("%:p:h")
  -- find up to 5 levels to find package.json
  for i = 1, 5 do
    local package_json = path .. "/package.json"
    if vim.fn.filereadable(package_json) == 1 then
      break
    end
    path = vim.fn.fnamemodify(path, ":h")
  end

  vim.g["test#project_root"] = path
end
-- Usage: :TestWithJest when in test file or :TestWithVitest when in test file
-- vim-test plugin has not supported on large project or monorepo yet. A lot of issues on github
-- e.g: "Not a test file" error when running any of the test command
create_cmd("JestRunner", function()
  setProjectRootByCurrentBuffer()
  vim.g["test#javascript#runner"] = "jest"

  -- set npx jest to run test
  vim.g["test#javascript#jest#executable"] = "npx jest"
  vim.g["test#javascript#jest#options"] = "--detectOpenHandles --updateSnapshot"

  vim.cmd("TestNearest")
end, {})

return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-plenary",
    "olimorris/neotest-rspec",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
  },
  opts = {
    spec = {
      { "<leader>ct", group = "test" },
    },
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    adapters = {
      ["neotest-rspec"] = {
        args = { "" },
      },
      ["jest"] = {
        args = { "" },
      },
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
  },
  config = function(_, opts)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    local neotest = require("neotest")

    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          -- Replace newline and tab characters with space for more compact diagnostics
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    if opts.adapters then
      local adapters = {}

      for name, config in pairs(opts.adapters or {}) do
        if type(name) == "number" then
          if type(config) == "string" then
            config = require(config)
          end
          adapters[#adapters + 1] = config
        elseif config ~= false then
          local adapter = require(name)
          if type(config) == "table" and not vim.tbl_isempty(config) then
            local meta = getmetatable(adapter)
            if adapter.setup then
              adapter.setup(config)
            elseif meta and meta.__call then
              adapter(config)
            else
              error("Adapter " .. name .. " does not support setup")
            end
          end
          adapters[#adapters + 1] = adapter
        end
      end
      opts.adapters = adapters
    end

    neotest.setup(opts)

    local keymap = vim.keymap

    keymap.set("n", "<leader>ctt", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "run neotest" })

    keymap.set("n", "<leader>ctT", function()
      neotest.run.run(vim.uv.cwd())
    end, { desc = "Run All Test Files" })

    keymap.set("n", "<leader>ctr", function()
      neotest.run.run()
    end, { desc = "Run Nearest" })

    keymap.set("n", "<leader>ctl", function()
      neotest.run.run_last()
    end, { desc = "Run Last" })

    keymap.set("n", "<leader>cts", function()
      neotest.summary.toggle()
    end, { desc = "Toggle Summary" })

    keymap.set("n", "<leader>cto", function()
      neotest.output.open({ enter = true, auto_close = true })
    end, { desc = "Show Output" })

    keymap.set("n", "<leader>ctO", function()
      neotest.output_panel.toggle()
    end, { desc = "Toggle Output Panel" })

    keymap.set("n", "<leader>ctS", function()
      neotest.run.stop()
    end, { desc = "Stop" })

    keymap.set("n", "<leader>ctw", function()
      neotest.watch.toggle(vim.fn.expand("%"))
    end, { desc = "Toggle Watch" })
  end,
}
