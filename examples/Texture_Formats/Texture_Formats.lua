Texture_Formats = Core.class(Sprite)

function Texture_Formats:init()
	application:setBackgroundColor(0xc0c0c0)

	local textures = {}
	
	textures[1] = Texture.new("examples/Texture_Formats/image_rgb565.png", true, {format = Texture.RGB565})
	textures[2]  = Texture.new("examples/Texture_Formats/image_rgb888.png", true, {format = Texture.RGB888})
	textures[3]  = Texture.new("examples/Texture_Formats/image_rgba5551.png", true, {format = Texture.RGBA5551})
	textures[4]  = Texture.new("examples/Texture_Formats/image_rgba4444.png", true, {format = Texture.RGBA4444})
	textures[5]  = Texture.new("examples/Texture_Formats/image_rgba8888.png", true, {format = Texture.RGBA8888})
	
	local curTexture = 1
	local bitmap = Bitmap.new(textures[curTexture])
	self:addChild(bitmap)
	
	local timer = Timer.new(1000)
	timer:addEventListener(Event.TIMER, function()
		curTexture = curTexture + 1
		if(curTexture > #textures) then curTexture = 1 end
		bitmap:setTexture(textures[curTexture])
	end)
	timer:start()
	self:addEventListener("exitEnd", function()
		timer:stop()
		timer = nil
	end)
end