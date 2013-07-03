Texture_16bit = Core.class(Sprite)

function Texture_16bit:init()
	application:setBackgroundColor(0xc0c0c0)
	local texture = Texture.new("examples/Texture_16bit/image.png", true, {format = TextureBase.RGBA4444})
	local bitmap = Bitmap.new(texture)
	self:addChild(bitmap)
	
	local texture16 = Texture.new("examples/Texture_16bit/image_4444.png", true, {format = TextureBase.RGBA4444})
	local bitmap16 = Bitmap.new(texture16)
	bitmap16:setPosition(0, 240)
	self:addChild(bitmap16)
end