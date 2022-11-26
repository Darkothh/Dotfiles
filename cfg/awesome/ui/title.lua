local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")


local function paddined_button(button, margins)
  margins = margins or {
    top = 9,
    bottom = 9,
    left = 4,
    right = 4
  }

  return wibox.widget {
    button,
    top = margins.top,
    bottom = margins.bottom,
    left = margins.left,
    right = margins.right,
    widget = wibox.container.margin,
  }
end

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({}, 1, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c):setup {
    { -- Left
      layout = wibox.layout.fixed.horizontal
    },
    { -- Middle
      -- { -- Title
      --   align  = "center",
      --   widget = awful.titlebar.widget.titlewidget(c)
      -- },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      paddined_button(awful.titlebar.widget.maximizedbutton(c)),
      paddined_button(awful.titlebar.widget.floatingbutton(c)),
      paddined_button(awful.titlebar.widget.closebutton(c), {
        top = 9,
        bottom = 9,
        right = 13,
        left = 4,
      }),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)
