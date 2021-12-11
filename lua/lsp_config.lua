local lsp = require 'lspconfig'
local configs = require 'lspconfig.configs'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'Q', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'q', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local coq = require 'coq'
local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = { 'gopls' }

-- for _, l in ipairs(servers) do
--     lsp[l].setup(coq.lsp_ensure_capabilities({
--         on_attach = on_attach,
--         flags = {
--             debounce_text_changes = 150,
--         },
--         capabilities = capabilities
--     }))
-- end

lsp.intelephense.setup(coq.lsp_ensure_capabilities({
    init_options = {
        cacheClear = true
    },
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = capabilities,
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000;
            },
            environment = {
                phpVersion = '8.0'
            }
        }
    }
}))

vim.cmd('COQnow -s')

lsp.gopls.setup(coq.lsp_ensure_capabilities({
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = capabilities
}))

-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menu,menuone,noselect'

-- if not configs.plaintext_lsp then
--     configs.plaintext_lsp = {
--         default_config = {
--             cmd = { '/home/parallels/langs/go/github.com/33r01b/lsp/bin/lsp' };
--             filtypes = {'text'};
--             root_dir = function(fname)
--                 return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
--             end;
--             settings = {};
--         }
--     }
-- end

-- require'lspconfig'.plaintext_lsp.setup{}
--

