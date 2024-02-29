return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.defaults.layout_strategy = "vertical"
    opts.defaults.layout_config.vertical = {
      mirror = true,
      prompt_position = "top",
      preview_cutoff = 40,
    }

    opts.pickers = {
      lsp_references = {
        fname_width = 100,
        initial_mode = "normal",
      },
      lsp_implementations = {
        fname_width = 100,
        initial_mode = "normal",
      },
      lsp_definitions = {
        fname_width = 100,
        initial_mode = "normal",
      },
    }
  end,
}
