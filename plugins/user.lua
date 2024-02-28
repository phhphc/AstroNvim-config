return {
  {
    "tzachar/local-highlight.nvim",
    opts = function(_, opts) opts.hlgroup = "Underlined" end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>ur",
        "<cmd>LocalHighlightToggle<CR>",
        desc = "Toggle highlight cursor word",
      },
    },
  },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
