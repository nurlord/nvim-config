return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap["<Tab>"] = {
        require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
        LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
        "fallback",
      }
      opts.sources = {
        default = { "lsp", "path", "snippets" },
      }
      opts.completion.list = { selection = { preselect = true, auto_insert = false } }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "vrischmann/tree-sitter-templ",
    },

    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "go",
        "templ",
        "gotmpl",
      })
    end,
  },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       "shfmt",
  --       "selene",
  --       "tailwindcss-language-server",
  --       --"typescript-language-server",
  --       "vtsls",
  --       "css-lsp",
  --       "css-variables-language-server",
  --       "cssmodules-language-server",
  --       "html-lsp",
  --       "prettier",
  --       "intelephense",
  --       "docker-compose-language-service",
  --       "dockerfile-language-server",
  --       "dot-language-server",
  --       "eslint-lsp",
  --       "dart-debug-adapter",
  --       "vue-language-server",
  --     },
  --
  --     automatic_installation = false,
  --   },
  -- },
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
        template = { "templ" },
        templ = { "templ" },
        tmpl = { "templ" },
        json = { "prettier", stop_after_first = true },
        jsonc = { "prettier", stop_after_first = true },
        yaml = { "prettier", stop_after_first = true },
        markdown = { "prettier", stop_after_first = true },
        graphql = { "prettier", stop_after_first = true },
        astro = { "prettier", stop_after_first = true },
      },
      formatters = {
        prettier = {
          args = function(self, ctx)
            if vim.endswith(ctx.filename, ".astro") then
              return {
                "--stdin-filepath",
                "$FILENAME",
                "--plugin",
                "prettier-plugin-astro",
                "--plugin",
                "prettier-plugin-tailwindcss",
              }
            end
            return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-tailwindcss" }
          end,
        },
        prettier_go_tmpl = {
          command = "prettier",
          stdin = true,
          args = {
            "--stdin-filepath",
            "$FILENAME",
            "--parser",
            "go-template",
            "--plugin",
            "prettier-plugin-go-template",
            "--plugin",
            "prettier-plugin-tailwindcss",
          },
        },
      },
    },
    {
      "neovim/nvim-lspconfig",

      opts = function(_, opts)
        opts.servers = {
          jdtls = {},
          gopls = {
            keys = {
              { "gd", vim.lsp.buf.references, desc = "Go to references" },
              { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions", has = "codeAction" },
            },
          },
          templ = {},
          --   clangd = {
          --     keys = {
          --       { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          --     },
          --     root_dir = function(fname)
          --       return require("lspconfig.util").root_pattern(
          --         "Makefile",
          --         "configure.ac",
          --         "configure.in",
          --         "config.h.in",
          --         "meson.build",
          --         "meson_options.txt",
          --         "build.ninja"
          --       )(fname) or require("lspconfig.util").root_pattern(
          --         "compile_commands.json",
          --         "compile_flags.txt"
          --       )(fname) or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
          --     end,
          --     capabilities = {
          --       offsetEncoding = { "utf-16" },
          --     },
          --     cmd = {
          --       "clangd",
          --       "--background-index",
          --       "--clang-tidy",
          --       "--header-insertion=iwyu",
          --       "--completion-style=detailed",
          --       "--function-arg-placeholders",
          --       "--fallback-style=llvm",
          --     },
          --     init_options = {
          --       usePlaceholders = true,
          --       completeUnimported = true,
          --       clangdFileStatus = true,
          --     },
          --   },
          -- }
          -- opts.setup = {
          --   jdtls = function()
          --     return true -- avoid duplicate servers
          --   end,
          -- }
          -- local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
          -- opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
          --   handlers = {
          --     ["textDocument/publishDiagnostics"] = function(err, res, ...)
          --       local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
          --       if string.match(file_name, "^%.env") == nil then
          --         return on_publish_diagnostics(err, res, ...)
          --       end
          --     end,
          --   },
        }
      end,
    },
    {
      "mfussenegger/nvim-lint",
      event = "LazyFile",
      opts = {
        -- Event to trigger linters
        events = { "BufWritePost", "BufReadPost", "InsertLeave" },
        linters_by_ft = {
          fish = { "fish" },
          markdown = {},
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
          shellcheck = {
            -- We must include the default args "--format=json" and "-" (stdin)
            -- plus our custom exclusion "-e SC2034"
            args = { "--format", "json", "-", "-e", "SC2034" },
          },
          golangcilint = {
            cmd = "golangci-lint",
            args = { "run", "--out-format", "json" },
            ignore_exitcode = true, -- 👈 this mutes the warning
          },
        },
      },
    },

    {
      "rafamadriz/friendly-snippets",
      opts = {
        exclude = { "javascript", "typescript" },
      },
    },
    {
      "akinsho/flutter-tools.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim",
      },
      config = true,
    },
  },
}
