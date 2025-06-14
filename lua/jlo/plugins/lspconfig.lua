return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }
      local keymap = vim.keymap

      keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, opts)
      keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, opts)
      keymap.set("n", "<leader>ws", function()
        vim.lsp.buf.workspace_symbol()
      end, opts)
      keymap.set("n", "<leader>d", function()
        vim.diagnostic.open_float()
      end, opts)
      keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, opts)
      keymap.set("n", "<leader>rr", function()
        vim.lsp.buf.references()
      end, opts)
      keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, opts)
      keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
      end, opts)

      -- format on save
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config['ts_ls'] = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        typescript = {
          preferences = {
            disableSuggestions = false,
          }
        }
      }
    }
    vim.lsp.config['gopls'] = {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    vim.lsp.config['lua_ls'] = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
    vim.lsp.enable({
      "gopls",
      "ts_ls",
      "lua_ls",
    })
  end,
}
