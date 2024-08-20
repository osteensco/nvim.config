
local lspconfig = require("lspconfig")

local mason_lspconfig = require("mason-lspconfig")

local lsp_zero = require("lsp-zero")

local on_attach = function(_, bufnr)

  local bufmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  bufmap('<leader>r', vim.lsp.buf.rename, 'buf.rename')
  bufmap('<leader>a', vim.lsp.buf.code_action, 'buf.code_action')

  bufmap('gd', vim.lsp.buf.definition, '[g]o to [d]efinition')
  bufmap('gD', vim.lsp.buf.declaration, '[g]o to [D]eclaration')
  bufmap('gI', vim.lsp.buf.implementation, '[g]o to [I]mplementation')
  bufmap('<leader>D', vim.lsp.buf.type_definition, 'type_definition')

  bufmap('gr', require('telescope.builtin').lsp_references, '[g]o to TS [r]eferences')
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols, 'TS lsp_document_symbols. similar to github file contents view.')
  bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'TS lsp_dynamic_workspace_symbols. looks everywhere.')

  bufmap('K', vim.lsp.buf.hover, 'hover docs')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--autoformater
lsp_zero.format_on_save({
    
    format_ops = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['gopls'] = {'go'}
    }
})

require("mason").setup()
mason_lspconfig.setup({
    ensure_installed = {"lua_ls", "gopls", "basedpyright", "tsserver", "bashls", "cssls", "html", "jsonls", "sqlls"}
})
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                [server_name] = {
                    ["ui.semanticTokens"] = true
                }
            }
        }
    end
})

-- lspconfig.lua_ls.setup({})
-- lspconfig.gopls.setup({})

    -- ["pylsp"] = function()
    --     require('lspconfig').gopls.setup {
    --         on_attach = on_attach,
    --         capabilities = capabilities,
    --         settings = {
    --             ["pylsp"] = {
    --                 ["ui.semanticTokens"] = true
    --             }
    --         }
    --     }
    -- end









