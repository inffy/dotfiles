return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- This makes hidden files visible by default
        hide_dotfiles = false, -- Don't hide dotfiles
        hide_gitignored = false, -- Optional: also show git-ignored files
        hide_by_name = {
          -- You can still hide specific files/folders if needed
          -- ".DS_Store",
          -- "thumbs.db"
        },
        hide_by_pattern = {
          -- You can hide files matching certain patterns
          -- "*.meta",
          -- "*/src/*/tsconfig.json",
        },
        always_show = { -- Show these even if they match hide patterns
          ".gitignore",
          ".env",
        },
        never_show = { -- Never show these files
          ".DS_Store",
          "thumbs.db",
        },
      },
    },
  },
}
