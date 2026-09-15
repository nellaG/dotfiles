-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require 'lspconfig.util'
local async = require 'lspconfig.async'

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pyright.setup{}
lspconfig.gopls.setup({
   cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    single_file_support = true,
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            analyses = {
                unusedparams = true,
                unusedvariable = true,
                unusedwrite = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        }
    },
    root_dir = function(fname)
        -- see: https://github.com/neovim/nvim-lspconfig/issues/804
        if not mod_cache then
          local result = async.run_command { 'go', 'env', 'GOMODCACHE' }
          if result and result[1] then
            mod_cache = vim.trim(result[1])
          else
            mod_cache = vim.fn.system 'go env GOMODCACHE'
          end
        end
        if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
          local clients = util.get_lsp_clients { name = 'gopls' }
          if #clients > 0 then
            return clients[#clients].config.root_dir
          end
        end
        return util.root_pattern('go.work', 'go.mod', '.git')(fname)
      end,
})
lspconfig.lua_ls.setup{}
