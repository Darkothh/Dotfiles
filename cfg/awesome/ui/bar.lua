local gears = require("gears")
local naughty = require("naughty")
local util = require("util")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")
local assets_path = gfs.get_configuration_dir() .. "assets/"
local icons_path = assets_path .. "icons/"


local volume = require("ui.modules.volume.volume")

awful.screen.connect_for_each_screen(function(s)

  -- Each screen has its own tag table.
  awful.tag({ "", "", "", "", "", "" }, s, awful.layout.layouts[2])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))

  local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal(
          "request::activate",
          "tasklist",
          { raise = true }
        )
      end
    end),
    awful.button({}, 3, function()
      awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
      awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
      awful.client.focus.byidx(-1)
    end))

  local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
  )
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen          = s,
    filter          = awful.widget.tasklist.filter.currenttags,
    buttons         = tasklist_buttons,
    style           = {
      shape = gears.shape.rounded_rect,
    },
    layout          = {
      spacing = 5,
      layout = wibox.layout.grid.horizontal
    },
    widget_template = {
      {
        {
          id     = "clienticon",
          widget = awful.widget.clienticon,
        },
        margins = 4,
        widget  = wibox.container.margin,
      },
      id              = "background_role",
      -- forced_width    = 48,
      forced_height   = 50,
      widget          = wibox.container.background,
      create_callback = function(self, c, index, objects) --luacheck: no unused
        self:get_children_by_id("clienticon")[1].client = c
      end,
    },
  }

  s.systray = wibox.widget {
    {
      wibox.widget.systray(),
      top    = 2,
      bottom = 2,
      widget = wibox.container.margin,
    },
    widget = wibox.container.background,
  }
  -- Create the wibox
  s.mywibox = awful.wibar({
    position = "bottom",
    screen   = s,
    height   = 40,
  })
  local function mkcontainer(template)
    return wibox.widget {
      template,
      left = 8,
      right = 8,
      top = 6,
      bottom = 6,
      widget = wibox.container.margin,
    }
  end

  s.mywibox:setup {
    {
      layout = wibox.layout.align.horizontal,
      {
        {
          mkcontainer {
            util.mkbutton {
              icon = 'launcher',
              color = '#fff',
              command = function()
                awful.spawn('rofi -show drun')
              end
            },
            s.mytasklist,
            spacing = 12,
            layout = wibox.layout.fixed.horizontal,
          },
          widget = wibox.container.margin,
        },
        layout = wibox.layout.fixed.horizontal,
      },
      nil,
      {
        mkcontainer {
          util.mkbutton {
            icon = 'camera',
            color = '#fff',
            command = 'ss'
          },
          util.mkbutton{
            icon = 'tray/down',
          },
          volume{
            widget_type = 'arc'
          },
          s.systray,
          s.mylayoutbox,
          spacing = 8,
          layout = wibox.layout.fixed.horizontal,
        },
        layout = wibox.layout.fixed.horizontal,
      },
    },
    {
      mkcontainer {
        s.mytaglist,
        layout = wibox.layout.fixed.horizontal
      },
      halign = 'center',
      widget = wibox.widget.margin,
      layout = wibox.container.place,
    },
    layout = wibox.layout.stack
  }
end)
-- }}}
