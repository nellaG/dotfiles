require("nvchad.configs.lspconfig").defaults()

-- macOS FSEvents can block libuv when recursive LSP watchers are stopped.
-- rust-analyzer watches workspace files itself when the client declines this.
if vim.uv.os_uname().sysname == "Darwin" then
  vim.lsp.config("*", {
    capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = false } } },
  })
end

-- Bound graceful server shutdown using Neovim's public API (0.12+).
if vim.fn.has "nvim-0.12" == 1 then
  vim.lsp.config("*", { exit_timeout = 500 })
end

-- rust-analyzer 설정 (Neovim 0.11+ 방식)
vim.lsp.config("rust_analyzer", {
  on_attach = function(client, bufnr)
    -- inlay hints 활성화
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = false,
      numThreads = 4,
      cachePriming = {
        enable = false,
      },
      diagnostics = {
        disabled = { "typed-hole" },
      },
      cargo = {
        targetDir = true,
      },
      files = {
        exclude = { "target", ".git", "node_modules" },
      },
      procMacro = {
        enable = true,
      },
      inlayHints = {
        bindingModeHints = {
          enable = false,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = "never",
        },
        lifetimeElisionHints = {
          enable = "never",
          useParameterNames = false,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        expressionAdjustmentHints = {
          enable = "never",
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    },
  },
})

-- gopls 설정
vim.lsp.config("gopls", {
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
    },
  },
})

-- LSP 서버들 활성화
vim.lsp.enable "gopls"
vim.lsp.enable "lua_ls"
vim.lsp.enable "pyright"
vim.lsp.enable "html"
vim.lsp.enable "cssls"
vim.lsp.enable "marksman"
vim.lsp.enable "rust_analyzer"
