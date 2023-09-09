require('telescope').load_extension('fzf')

require("telescope").setup({
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
})
