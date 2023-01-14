-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local diaopts = {noremap=true, silent=true}
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, diaopts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, diaopts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, diaopts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, diaopts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'go', vim.lsp.buf.declaration, bufopts)
    -- @see moved to map.vim for telescope features
    --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    --vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'q', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'Q', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>e', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

-- completion
local cmp = require('cmp')
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
        { name = 'spell' },
    })
})

-- Setup language servers managed by nvim-lsp-installer
-- https://github.com/williamboman/nvim-lsp-installer#setup
local servers = require('servers')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('nvim-lsp-installer').on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
    }

    if server.name == "gopls" then
        opts.settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
            },
        }
    end

    if server.name == "intelephense" then
        opts.settings = {
            intelephense = {
                files = {
                    maxSize = 10000000;
                },
                environment = {
                    phpVersion = '8.1'
                }
            }
        }

        opts.init_options = {
            cacheClear = true
        }
    end

    if server.name == 'sumneko_lua' then
        opts.settings = {
            Lua = {
                diagnostics = { globals = { 'vim' } }
            }
        }
    end

    if servers[server.name] ~= nil then
        opts = vim.tbl_deep_extend('force', opts, servers[server.name])
    end

    server:setup(opts)
end)
