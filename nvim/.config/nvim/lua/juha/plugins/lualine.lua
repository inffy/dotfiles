return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        local colors = {
            -- Catppuccin Mocha Colors
            base = "#1e1e2e",
            mantle = "#181825",
            crust = "#11111b",
            rosewater = "#f5e0dc",
            flamingo = "#eebebe",
            pink = "#f5c2e7",
            mauve = "#cba6f7",
            red = "#f38ba8",
            maroon = "#eba0ac",
            peach = "#fab387",
            yellow = "#f9e2af",
            green = "#a6e3a1",
            teal = "#94e2d5",
            sky = "#89b4fa",
            sapphire = "#74c7ec",
            blue = "#89b4fa",
            lavender = "#b4befe",
            text = "#cdd6f4",
            subtext1 = "#bac2de",
            subtext0 = "#a6adc8",
            overlay2 = "#6c7086",
            overlay1 = "#585b70",
            overlay0 = "#45475a",
            surface2 = "#313244",
            surface1 = "#232136",
            surface0 = "#1a1b26",
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = colors.mauve, fg = colors.base, gui = "bold" }, -- Mode: Normal
                b = { bg = colors.base, fg = colors.text },
                c = { bg = colors.base, fg = colors.subtext0 },
            },
            insert = {
                a = { bg = colors.green, fg = colors.base, gui = "bold" }, -- Mode: Insert
                b = { bg = colors.base, fg = colors.text },
                c = { bg = colors.base, fg = colors.subtext0 },
            },
            visual = {
                a = { bg = colors.peach, fg = colors.base, gui = "bold" }, -- Mode: Visual
                b = { bg = colors.base, fg = colors.text },
                c = { bg = colors.base, fg = colors.subtext0 },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.base, gui = "bold" }, -- Mode: Command
                b = { bg = colors.base, fg = colors.text },
                c = { bg = colors.base, fg = colors.subtext0 },
            },
            replace = {
                a = { bg = colors.red, fg = colors.base, gui = "bold" },    -- Mode: Replace
                b = { bg = colors.base, fg = colors.text },
                c = { bg = colors.base, fg = colors.subtext0 },
            },
            inactive = {
                a = { bg = colors.crust, fg = colors.overlay0, gui = "bold" },
                b = { bg = colors.crust, fg = colors.overlay0 },
                c = { bg = colors.crust, fg = colors.overlay0 },
            },
        }

        lualine.setup({
            options = {
                theme = my_lualine_theme,
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        })
    end,
}
