local xresources = require("beautiful.xresources")
local gears = require "gears"
local gfs = require("gears.filesystem")

local dpi = xresources.apply_dpi

-- paths
local themes_path = gfs.get_themes_dir()
local assets_path = gfs.get_configuration_dir() .. "assets/"

-- assets
local icons_path = assets_path .. "icons/"
local shapes_path = assets_path .. "shapes/"
local titlebar_assets_path = assets_path .. "titlebar/"

local theme = {}

-- fonts
theme.font_name = 'Product Sans'
theme.nerd_font = 'JetBrainsMono NF'
theme.material_icons = 'Material Icons'
theme.font_size = '10'
theme.font = theme.font_name .. ' ' .. theme.font_size

-- base colors
theme.black = '#151720'
theme.black2 = '#0d0d0d'
theme.dimblack = '#1a1c25'
theme.light_black = '#262831'
theme.grey = '#666891'
theme.red = '#dd6777'
theme.yellow = '#ecd3a0'
theme.magenta = '#c296eb'
theme.green = '#90ceaa'
theme.blue = '#86aaec'
theme.cyan = '#93cee9'
theme.aqua = '#7bd9e6'

-- backgrounds
theme.bg_normal     = "#000"
theme.bg_contrast   = "#0f111a"
theme.bg_lighter    = "#11131c"

-- elements bg
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.red
theme.bg_minimize   = theme.bg_normal
theme.systray_icon_spacing = 10
theme.bg_systray    = theme.bg_normal

-- foregrounds
theme.fg_normal     = "#a5b6cf"
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = theme.fg_normal

-- some actions bg colors
theme.actions = {
    bg = theme.bg_normal,
    contrast = theme.bg_contrast,
    lighter = theme.bg_lighter,
    fg = theme.fg_normal,
}

-- bar
theme.bar_height = 40

-- gaps and borders
theme.useless_gap         = dpi(4)
theme.border_width        = dpi(0)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = theme.bg_normal
theme.border_color_marked = theme.bg_normal
theme.border_radius = dpi(10)

-- taglist
theme.taglist_bg_empty = "#00000000"
theme.taglist_fg_occupied = theme.blue
theme.taglist_bg_focus = "#00000000"
theme.taglist_fg_focus = theme.red
theme.taglist_bg_volatile = "#00000000"
theme.taglist_bg_urgent = "#00000000"
theme.taglist_shape_focus = gears.shape.rounded_bar

-- titlebar
theme.titlebar_bg = theme.bg_contrast
theme.titlebar_bg_focus = theme.bg_normal
theme.titlebar_fg = theme.fg_normal

-- close
theme.titlebar_close_button_normal = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.dimblack)
theme.titlebar_close_button_focus = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.red)

-- maximized
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.dimblack)
theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.dimblack)
theme.titlebar_maximized_button_focus_active = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.yellow)
theme.titlebar_maximized_button_focus_inactive = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.yellow)

-- minimize
theme.titlebar_minimize_button_normal = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.dimblack)
theme.titlebar_minimize_button_focus = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.green)

-- layouts
theme.layout_fairh = gears.color.recolor_image(themes_path.."default/layouts/fairhw.png", theme.fg_normal)
theme.layout_fairv = gears.color.recolor_image(themes_path.."default/layouts/fairvw.png", theme.fg_normal)
theme.layout_floating  = gears.color.recolor_image(themes_path.."default/layouts/floatingw.png", theme.fg_normal)
theme.layout_magnifier = gears.color.recolor_image(themes_path.."default/layouts/magnifierw.png", theme.fg_normal)
theme.layout_max = gears.color.recolor_image(themes_path.."default/layouts/maxw.png", theme.fg_normal)
theme.layout_fullscreen = gears.color.recolor_image(themes_path.."default/layouts/fullscreenw.png", theme.fg_normal)
theme.layout_tilebottom = gears.color.recolor_image(themes_path.."default/layouts/tilebottomw.png", theme.fg_normal)
theme.layout_tileleft   = gears.color.recolor_image(themes_path.."default/layouts/tileleftw.png", theme.fg_normal)
theme.layout_tile = gears.color.recolor_image(themes_path.."default/layouts/tilew.png", theme.fg_normal)
theme.layout_tiletop = gears.color.recolor_image(themes_path.."default/layouts/tiletopw.png", theme.fg_normal)
theme.layout_spiral  = gears.color.recolor_image(themes_path.."default/layouts/spiralw.png", theme.fg_normal)
theme.layout_dwindle = gears.color.recolor_image(themes_path.."default/layouts/dwindlew.png", theme.fg_normal)
theme.layout_cornernw = gears.color.recolor_image(themes_path.."default/layouts/cornernww.png", theme.fg_normal)
theme.layout_cornerne = gears.color.recolor_image(themes_path.."default/layouts/cornernew.png", theme.fg_normal)
theme.layout_cornersw = gears.color.recolor_image(themes_path.."default/layouts/cornersww.png", theme.fg_normal)
theme.layout_cornerse = gears.color.recolor_image(themes_path.."default/layouts/cornersew.png", theme.fg_normal)

-- tooltip
theme.tooltip_bg = theme.bg_normal
theme.tooltip_fg = theme.fg_normal

return theme
