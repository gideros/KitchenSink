--[[

A frame by frame bird animation example
The old frame is removed by Sprite:removeChild and the new frame is added by Sprite:addChild

This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
(C) 2010 - 2011 Gideros Mobile 

]]

Bird_Animation = Core.class(Sprite)

function Bird_Animation:init()

-- load texture, create bitmap from it and set as background
local background = Bitmap.new(Texture.new("examples/Bird_Animation/sky_world.png"))
self:addChild(background)

-- these arrays contain the image file names of each frame
local frames1 = {
	"examples/Bird_Animation/bird_black_01.png",
	"examples/Bird_Animation/bird_black_02.png",
	"examples/Bird_Animation/bird_black_03.png"}

local frames2 = {
	"examples/Bird_Animation/bird_white_01.png",
	"examples/Bird_Animation/bird_white_02.png",
	"examples/Bird_Animation/bird_white_03.png"}

-- create 2 white and 2 black birds
local bird1 = Bird.new(frames1)
local bird2 = Bird.new(frames1)
local bird3 = Bird.new(frames2)
local bird4 = Bird.new(frames2)

-- add birds to the stage
self:addChild(bird1)
self:addChild(bird2)
self:addChild(bird3)
self:addChild(bird4)

end
