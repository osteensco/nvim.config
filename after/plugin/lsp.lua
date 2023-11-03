                                                                                                                    
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
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols, 'TS lsp_document_symbols')
  bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'TS lsp_dynamic_workspace_symbols')

  bufmap('K', vim.lsp.buf.hover, 'hover docs')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason").setup()
require("mason-lspconfig").setup_handlers({

    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

    ["lua_ls"] = function()
        require('neodev').setup()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            }
        }
    end



})




