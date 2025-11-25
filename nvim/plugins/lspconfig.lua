return {
  "neovim/nvim-lspconfig",
  config = function()
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
          checkOnSave = true,
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
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
            reborrowHints = {
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
    vim.lsp.enable "rust_analyzer"
    vim.lsp.enable "gopls"
    vim.lsp.enable "lua_ls"
    vim.lsp.enable "pyright"
    vim.lsp.enable "html"
    vim.lsp.enable "cssls"
  end,
}
