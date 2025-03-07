return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "selene",
        "tailwindcss-language-server",
        --"typescript-language-server",
        "vtsls",
        "css-lsp",
        "css-variables-language-server",
        "cssmodules-language-server",
        "html-lsp",
        "prettier",
        "intelephense",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "dot-language-server",
      },

      automatic_installation = false,
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", stop_after_first = true },
        typescript = { "prettier", stop_after_first = true },
        javascriptreact = { "prettier", stop_after_first = true },
        typescriptreact = { "prettier", stop_after_first = true },
        vue = { "prettier", stop_after_first = true },
        css = { "prettier", stop_after_first = true },
        scss = { "prettier", stop_after_first = true },
        less = { "prettier", stop_after_first = true },
        html = { "prettier", stop_after_first = true },
        json = { "prettier", stop_after_first = true },
        jsonc = { "prettier", stop_after_first = true },
        yaml = { "prettier", stop_after_first = true },
        markdown = { "prettier", stop_after_first = true },
        graphql = { "prettier", stop_after_first = true },
      },
    },
    {
      "neovim/nvim-lspconfig",

      opts = function(_, opts)
        opts.servers = {
          jdtls = {},
        }
        opts.setup = {
          jdtls = function()
            return true -- avoid duplicate servers
          end,
        }
        local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
        opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, res, ...)
              local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
              if string.match(file_name, "^%.env") == nil then
                return on_publish_diagnostics(err, res, ...)
              end
            end,
          },
        })
      end,
    },
    {
      "mfussenegger/nvim-jdtls",
      opts = {},
    },
    {
      "mfussenegger/nvim-lint",
      event = "LazyFile",
      opts = {
        -- Event to trigger linters
        events = { "BufWritePost", "BufReadPost", "InsertLeave" },
        linters_by_ft = {
          fish = { "fish" },
          yaml = { "eslint" },
          -- Use the "*" filetype to run linters on all filetypes.
          -- ['*'] = { 'global linter' },
          -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
          -- ['_'] = { 'fallback linter' },
          -- ["*"] = { "typos" },
        },
        -- LazyVim extension to easily override linter options
        -- or add custom linters.
        ---@type table<string,table>
        linters = {
          -- -- Example of using selene only when a selene.toml file is present
          -- selene = {
          --   -- `condition` is another LazyVim extension that allows you to
          --   -- dynamically enable/disable linters based on the context.
          --   condition = function(ctx)
          --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
        },
      },
    },
  },
}
