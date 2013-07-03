Texture_Formats = Core.class(Sprite)

function Texture_Formats:init()
	local bmp0 = Bitmap.new(Texture.new("examples/Texture_Formats/crate.png"))
	bmp0:setPosition(0, 50)
	self:addChild(bmp0)
	
	local bmp1 = Bitmap.new(Texture.new("examples/Texture_Formats/crate.png", false, {format = TextureBase.RGBA8888}))
	bmp1:setPosition(200, 50)
	self:addChild(bmp1)
	
	local bmp2 = Bitmap.new(Texture.new("examples/Texture_Formats/crate.png",false, {format = TextureBase.RGBA5551}))
	bmp2:setPosition(0, 200)
	self:addChild(bmp2)
	
	local bmp3 = Bitmap.new(Texture.new("examples/Texture_Formats/crate.png", false, {format = TextureBase.RGBA4444}))
	bmp3:setPosition(200, 200)
	self:addChild(bmp3)
	
	local bmp4 = Bitmap.new(Texture.new("examples/Texture_Formats/crate.png", false, {format = TextureBase.RGB888}))
	bmp4:setPosition(0, 350)
	self:addChild(bmp4)
	
	local bmp4 = Bitmap.new(Texture.new("examples/Texture_Formats/crate.png", false, {format = TextureBase.RGB565}))
	bmp4:setPosition(200, 350)
	self:addChild(bmp4)
end