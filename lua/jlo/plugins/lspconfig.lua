return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
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
    vim.lsp.config['jsonls'] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }
    -- requires 'yaml-language-server' to be installed
    -- npm install -g yaml-language-server
    vim.lsp.config['yamlls'] = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        yaml = {
          schemaStore = {
            enable = false,
            url = ""
          },
          schemas = require("schemastore").yaml.schemas({
            extra = {
              {
                description = "Bura configuration file",
                name = "Bura",
                fileMatch = "bura.yaml",
                url = vim.fn.expand("~/.bura/bura.schema.json"),
              },
            },
          }),
        },
      }
    }

    vim.lsp.config['pyright'] = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
          }
        }
      }
    }

    vim.lsp.config['ruff'] = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    vim.lsp.enable({
      "gopls",
      "ts_ls",
      "lua_ls",
      "jsonls",
      "yamlls",
      "pyright",
      "ruff",
    })
  end,
}
