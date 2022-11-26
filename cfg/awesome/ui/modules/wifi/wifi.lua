local wibox = require 'wibox'
local beautiful = require 'beautiful'
local gfs = require 'gears.filesystem'
local awful = require 'awful'

require "ui.modules.wifi.signal"

local network = wibox.widget {
    widget = wibox.widget.textbox,
    font = beautiful.nerd_font,
    align = 'center',
    markup = beautiful.network_connected
}

awesome.connect_signal('network::connected', function (is_connected)
    network.markup = is_connected
        and beautiful.network_connected
        or beautiful.network_disconnected
end)

return network
