--[[ 

This example demonstrates a generic Button class

This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
(C) 2010 - 2011 Gideros Mobile 

]]

Button_Example = Core.class(Sprite)

function Button_Example:init()

-- create a label to show number of clicks
local label = TextField.new(nil, "Clicked 0 time(s)")
label:setPosition(120, 240)
self:addChild(label)

-- create the up and down sprites for the button
local up = Bitmap.new(Texture.new("examples/Button_Example/button_up.png"))
local down = Bitmap.new(Texture.new("examples/Button_Example/button_down.png"))

-- create the button
local button = Button.new(up, down)

-- register to "click" event
local click = 0
button:addEventListener("click", 
	function() 
		click = click + 1
		label:setText("Clicked " .. click .. " time(s)")
	end)

button:setPosition(40, 150)
self:addChild(button)

end
