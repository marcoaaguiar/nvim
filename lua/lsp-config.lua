local lspinstaller = require'nvim-lsp-installer'
local lspconfig = require'lspconfig'

local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

local path = util.path
lspinstaller.setup{}

local on_attach_keybind = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- lspconfig.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<space>d', '<cmd>Lspsaga hover_doc<cr>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>Lspsaga rename<cr>', opts)
    buf_set_keymap('n', '<space>a', '<cmd>Lspsaga code_action<cr>', opts)
    buf_set_keymap('x', '<space>a', ':<c-u>Lspsaga range_code_action<cr>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local on_attach = function (client, bufnr)
    on_attach_keybind(client, bufnr)
    -- require("lsp_signature").on_attach({bind=true, handler_options={border = "rounded"}}, bufnr);
end

local function file_exists(file_name)
    local f = io.open(file_name, "rb")
    if f then f:close() end
    return f ~= nil
end

local function load_local_config(filename)
    if not file_exists(filename) then
        return {}
    end
    local file = io.open('.vim/lspconfig.json', "rb") -- r read mode and b binary mode

    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return vim.fn['json_decode'](content)
end

local flake8 = {
    lintCommand = "poetry run flake8 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
    lintSource = "flake8",
}

local mypy = {
    lintCommand = "poetry run mypy --show-column-numbers --ignore-missing-imports --show-error-codes",
    lintFormats = {"%f=%l:%c: %trror: %m", "%f=%l:%c: %tarning: %m", "%f=%l:%c: %tote: %m"},
    lintSource = "mypy",
    lintIgnoreExitCode = true,
}


local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in ipairs(lspinstaller.get_installed_servers()) do
    local opts = {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
        settings = {}
    }

    local config = load_local_config('.vim/lspconfig.json')
    for k,v in pairs(config) do
        opts.settings[k] = v
    end

    opts.settings = config

    if server.name == "efm" then
        opts = {
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
            capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
            init_options = {documentFormatting = true},
            filetypes = { "python", "lua"},
            settings = {
                rootMarkers = {".git/", "pyproject.toml"},
                languages = {
                    lua = {
                        {formatCommand = "lua-format -i", formatStdin = true}
                    },
                    python = {
                        {formatCommand = "poetry run isort --profile black --quiet -", formatStdin = true},
                        {formatCommand = "poetry run black --quiet -", formatStdin = true},
                        -- mypy,
                        flake8
                    }
                }
            }
        }
    --[[ elseif server.name=="pyright" then
        opts.before_init = function(_, conf)
            conf.settings.python.pythonPath = get_python_path(config.root_dir)
        end ]]
    end
  require('lspconfig')[server.name].setup (opts)
end


local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    diagnostic_header_icon = "   ",
    -- code action title icon
    code_action_icon = " ",
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
}
