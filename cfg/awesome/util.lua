---@diagnostic disable:undefined-global
local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local gfs = require("gears.filesystem")

local assets_path = gfs.get_configuration_dir() .. "assets/"
local icons_path = assets_path .. "icons/"
local configPath = gfs.get_configuration_dir()
local scriptsPath = configPath .. 'utils/scripts/'


local util = {}
function util.mkbutton(args)
  local icon_size = args.size or 20
  local icon_name = args.icon or 'hints'
  local icon_color = args.color or '#ffffff'
  local icon_margin = args.margin or 4
  local onclick = args.command or function() end
  local onopen = args.onopen or false

  local result = wibox.widget {
    {
      {
        image = gears.color.recolor_image(icons_path .. icon_name .. ".svg", icon_color),
        resize = true,
        forced_height = icon_size,
        forced_width = icon_size,
        widget = wibox.widget.imagebox
      },
      margins = icon_margin,
      widget = wibox.container.margin
    },
    bg = '#00000000',
    widget = wibox.container.background
  }

  if onclick == 'ss' then
    onclick = function()
      awful.spawn(scriptsPath .. 'screensht select')
    end
  end


  local old_cursor, old_wibox
  result:connect_signal("mouse::enter", function(c)
    pcall(function()
      local wb = mouse.current_wibox
      old_cursor, old_wibox = wb.cursor, wb
      wb.cursor = "hand1"
    end)
  end)
  result:connect_signal("mouse::leave", function(c)
    if old_wibox then
      old_wibox.cursor = old_cursor
      old_wibox = nil
    end
  end)

  result:connect_signal("button::press", function() onclick() end)

  return result
end

return util
