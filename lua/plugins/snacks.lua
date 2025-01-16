return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
  },
}
--return {
--  "folke/snacks.nvim",
--  ---@type snacks.Config
--  opts = {
--    bigfile = { enabled = true },
--    quickfile = { enabled = true },
--    terminal = {
--      win = {
--        relative = "editor",
--        keys = {
--          nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
--          nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
--          nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
--          nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
--        },
--      },
--    },
--    scroll = {},
--  },
--  config = function()
--    -- Disable the scroll animation
--    require("snacks").scroll.disable()
--  end,
--}
