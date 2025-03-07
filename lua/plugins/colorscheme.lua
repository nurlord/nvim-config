return {
  {
    "marko-cerovac/material.nvim",
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "cool",
    },
  },

  --[[
  {
    "nobbmaestro/nvim-andromeda",
    dependencies = { "tjdevries/colorbuddy.nvim" },
    opts = {
      preset = "andromeda",
      -- transparent_bg = true,
      styles = {
        italic = true,
      },
    },
  },
  ]]
  --
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        -- transparent = true,
        -- styles = {
        --   sidebars = "transparent",
        --   floats = "transparent",
        -- },
        style = "night",
      }
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    flavour = "macchiato",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      colorscheme = "tokyonight",
    },
  },
}
