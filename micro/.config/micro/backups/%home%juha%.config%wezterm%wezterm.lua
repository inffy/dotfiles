local W = require 'wezterm'

---Create split terminal
---@param direction 'h' | 'v'
local function split(direction)
    direction = string.lower(direction):sub(1, 1)
    if direction == 'v' then
        return W.action { SplitVertical = { domain = 'CurrentPaneDomain' } }
    elseif direction == 'h' then
        return W.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } }
    end
    return nil
end

local function kb(key, mods, action)
    return { key = key, mods = mods, action = action }
end

local theme = W.color.get_builtin_schemes()['rose-pine-moon']

local bg = theme.background
local dim_bg = W.color.parse(bg):lighten(0.15)
local fg = theme.foreground
local dim_fg = W.color.parse(fg):darken(0.45)
local hl_bg = W.color.parse(bg):lighten(0.35)
local winframe_bg = W.color.parse(bg):darken(0.45):desaturate(0.5)

theme.selection_bg = theme.foreground
theme.selection_fg = theme.background

-- sizes can be int or string in units of cell, pt, px or %
local border_size = 2
local padding_size = border_size

theme.tab_bar = {
    new_tab = {
        bg_color = winframe_bg,
        fg_color = fg,
    },
    new_tab_hover = {
        bg_color = winframe_bg,
        fg_color = dim_fg,
    },
}

local PROCESS_ICONS = require('process_icons')(theme)

local function get_process(tab)
    local process_name = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')

    return W.format(
        PROCESS_ICONS[process_name] or {
            { Foreground = { Color = theme.ansi[2] } },
            { Text = string.format('[%s]', process_name) }
        }
    )
end

---Escape hyphens in string, for gsub
---@param s string
---@return string
local function clean_hyphens(s)
    local res = s:gsub('[%-...]', '%%%0')
    return res
end

---Check if string starts with prefix
---@param s string
---@param prefix string
---@return boolean
local function str_starts_with(s, prefix)
    return s:sub(0, #prefix) == prefix
end

---Add a trailing slash if there isn't one already
---@param s string
---@return string
local function trailing_slash(s)
    if s:sub(-1) ~= '/' then
        return s .. '/'
    end
    return s
end

local HOME_DIR = trailing_slash(W.home_dir)

---Get present working directory formatted for display
---@param pane any wezterm Tab object
---@return string
local function get_pwd(pane)
    local wd_url = pane.current_working_dir
    if wd_url == nil then return ' ? ' end
    local wd = wd_url.path

    return trailing_slash(wd) == HOME_DIR and '  ~' or string.format(
        '  %s', wd:gsub('(.*/)(.+)(/?)', '%2'):gsub('/', '')
    )
end

local TAB_MAX_WIDTH = 64

W.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = ' ' .. get_process(tab) .. get_pwd(tab.active_pane) .. ' '
    local tab_bg
    local tab_fg
    if tab.is_active then
        tab_bg = bg
        tab_fg = fg
    else
        tab_bg = dim_bg
        tab_fg = dim_fg
    end
    return {
        { Background = { Color = tab_bg } },
        { Foreground = { Color = tab_fg } },
        { Text = title },
    }
end)

local font_name = 'JetBrainsMono Nerd Font'
local nerd_font_name = 'JetBrainsMono Nerd Font'
local fallback_font_name = 'JetBrainsMono Nerd Font'
local emoji_font_name = 'Noto Color Emoji'

local font = W.font_with_fallback({
    font_name,
    nerd_font_name,
    fallback_font_name,
    emoji_font_name,
})
local bold_font = W.font_with_fallback({
    {
        family = font_name,
        weight = 'Bold'
    },
    nerd_font_name,
    fallback_font_name,
    emoji_font_name,
})

return {
    hide_tab_bar_if_only_one_tab = false,
    hide_mouse_cursor_when_typing = false,
    use_fancy_tab_bar = true,
    tab_max_width = TAB_MAX_WIDTH,
    colors = theme,
    window_background_opacity = 0.9,
    font = font,
    line_height = 1.0,
    font_size = 11.0,
    harfbuzz_features = {
        'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07',
        'ss08'
    },
    -- harfbuzz_features = {
    --     -- set all to 0 to disable ligatures
    --     'calt=1', 'clig=1', 'liga=1'
    -- },
    default_cursor_style = 'BlinkingUnderline',
    keys = {
        kb('s', 'CTRL|SHIFT', split('h')),
        kb('i', 'CTRL|SHIFT', split('v')),
        { key = 'L', mods = 'CTRL', action = W.action.ShowDebugOverlay },
    },
    mouse_bindings = {
        {
            event = { Down = { streak = 1, button = 'Left' } },
            mods = 'NONE',
            action = W.action.ClearSelection,
        },
    },
    window_decorations = 'INTEGRATED_BUTTONS|RESIZE',
    integrated_title_button_style = 'Gnome',
    integrated_title_button_color = fg,
    window_frame = {
        font = bold_font,
        font_size = 11.0,

        active_titlebar_bg = winframe_bg, -- theme.background,
        active_titlebar_fg = theme.foreground,
        inactive_titlebar_bg = winframe_bg,
        inactive_titlebar_fg = dim_fg,
        inactive_titlebar_border_bottom = theme.background,
        active_titlebar_border_bottom = theme.background,
        button_bg = theme.background,
        button_fg = theme.foreground,
        button_hover_bg = hl_bg,
        button_hover_fg = fg,

        border_left_width = border_size,
        border_right_width = border_size,
        border_bottom_height = border_size,
        border_top_height = 0,
        border_left_color = winframe_bg,
        border_right_color = winframe_bg,
        border_bottom_color = winframe_bg,
        border_top_color = winframe_bg,
    },
    window_padding = {
        top = padding_size+2,
        right = 0,
        bottom = 0,
        left = 0,
    },
    use_resize_increments = true,
    custom_block_glyphs = true,
}
