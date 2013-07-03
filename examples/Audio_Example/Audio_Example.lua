--[[ 

This is an example of sound capabilities of Gideros Studio

This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
(C) 2010 - 2011 Gideros Mobile 

]]

Audio_Example = Core.class(Sprite)

function Audio_Example:init()

local s1 = SoundButton.new("examples/Audio_Example/1-up.png", "examples/Audio_Example/1-down.png", "examples/Audio_Example/1.wav")
local s2 = SoundButton.new("examples/Audio_Example/2-up.png", "examples/Audio_Example/2-down.png", "examples/Audio_Example/2.wav")
local s3 = SoundButton.new("examples/Audio_Example/3-up.png", "examples/Audio_Example/3-down.png", "examples/Audio_Example/3.wav")

s1:setPosition(10, 50)
s2:setPosition(110, 50)
s3:setPosition(210, 50)

self:addChild(s1)
self:addChild(s2)
self:addChild(s3)


local label = TextField.new(nil, "click buttons to play sounds") -- we pass first parameter as nil to use the system font
label:setPosition(86, 170)
self:addChild(label)

end
