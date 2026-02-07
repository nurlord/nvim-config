return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = "20%",
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "scottmckendry/cyberdream.nvim",
  },

  {
    "olivercederborg/poimandres.nvim",
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ft = "markdown",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  -- {
  --   "armagidon-exception/neorg",
  --   lazy = false,
  --   version = "*", -- Pin Neorg to the latest stable release
  --   config = function()
  --     require("neorg").setup({
  --       load = {
  --         ["core.defaults"] = {},
  --         ["core.concealer"] = {},
  --         ["core.dirman"] = {
  --           config = {
  --             workspaces = {
  --               main = "~/neorg",
  --             },
  --             default_workspace = "main",
  --           },
  --         },
  --       },
  --     })
  --
  --     vim.wo.foldlevel = 99
  --     vim.wo.conceallevel = 2
  --   end,
  -- },
  -- {
  --   "nvim-neorg/neorg",
  --   lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  --   version = "*", -- Pin Neorg to the latest stable release
  --   -- config = true,
  --   config = function()
  --     require("neorg").setup({
  --       load = {
  --         ["core.defaults"] = {},
  --         ["core.concealer"] = {},
  --         ["core.dirman"] = {
  --           config = {
  --             workspaces = {
  --               main = "~/neorg",
  --             },
  --             default_workspace = "main",
  --           },
  --         },
  --       },
  --     })
  --
  --     vim.wo.foldlevel = 99
  --     vim.wo.conceallevel = 2
  --   end,
  -- },
}
