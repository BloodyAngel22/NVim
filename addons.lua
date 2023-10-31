


  { -- Minimap
    --TAKE
    "gorbit99/codewindow.nvim",

    keys = {
      {
        "<leader>mo",
        "codewindow.toggle_minimap()",
        mode = "n",
        desc = "Toggle Minimap",
      },
      {
        "<leader>mm",
        "codewindow.toggle_focus()",
        mode = "n",
        desc = "Focus Minimap",
      },
    },

    config = function(_, opts)
      local codewindow = require "codewindow"
      codewindow.setup(opts)
      codewindow.apply_default_keybinds()
    end,

    opts = {
      show_cursor = false,
      screen_bounds = "lines",
      window_border = "none",
    },
  },


  { -- Show lsp signature help when in a function (param info)
    --TAKE
    "ray-x/lsp_signature.nvim",
    -- event = "VeryLazy", -- TODO: Add keys to enable as mode
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },




  { --TAKE
    "folke/todo-comments.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "kevinhwang91/nvim-bqf",
    }, -- bqf is optional

    keys = {
      {
        "<leader>ltq",
        "<cmd>TodoQuickFix<cr>",
        mode = "n",
        desc = "QuickFix TODOs",
      },
      {
        "<leader>ltt",
        "<cmd>TodoTelescope<cr>",
        mode = "n",
        desc = "Telescope TODOs",
      },
      {
        "<leader>ltl",
        "<cmd>TodoLocList<cr>",
        mode = "n",
        desc = "LocList TODOs",
      },
      -- 🚦 :TodoTrouble is an option too!
      {
        "<leader>ltn",
        function()
          require("todo-comments").jump_next() -- More arguments: {keywords = { "ERROR", "WARNING"}}
        end,
        mode = "n",
        desc = "Next TODO",
      },
      {
        "<leader>ltp",
        function()
          require("todo-comments").jump_prev()
        end,
        mode = "n",
        desc = "Prev TODO",
      },
    },

    opts = {

      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = { -- TODO. Add hlgroups
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },

  {--TAKE
    "LudoPinelli/comment-box.nvim",
    config = function(_, opts)
      require("comment-box").setup(opts)
    end,

    keys = {
      {
        "<leader>bb",
        function()
          require("comment-box").ccbox()
        end,
        mode = { "n", "v" },
        desc = "Comment Box",
      },

      {
        "<leader>be",
        function()
          -- take an input:
          local input = vim.fn.input "Catalog: "
          require("comment-box").ccbox(input)
        end,
        mode = { "n", "v" },
        desc = "Left Comment Box",
      },

      {
        "<leader>bc",
        function()
          require("comment-box").lbox()
        end,
        mode = { "n", "v" },
        desc = "Left Comment Box",
      },

      {
        "<leader>bx",
        function()
          require("comment-box").catalog()
        end,
        mode = { "n", "v" },
        desc = "Comment Catalog",
      },
    },

    opts = {
      doc_width = 80, -- width of the document
      box_width = 60, -- width of the boxes
      borders = { -- symbols used to draw a box
        top = "─",
        bottom = "─",
        left = "│",
        right = "│",
        top_left = "╭",
        top_right = "╮",
        bottom_left = "╰",
        bottom_right = "╯",
      },
      line_width = 70, -- width of the lines
      line = { -- symbols used to draw a line
        line = "─",
        line_start = "─",
        line_end = "─",
      },
      outer_blank_lines = false, -- insert a blank line above and below the box
      inner_blank_lines = false, -- insert a blank line above and below the text
      line_blank_line_above = false, -- insert a blank line above the line
      line_blank_line_below = false, -- insert a blank line below the line
    },
  },
