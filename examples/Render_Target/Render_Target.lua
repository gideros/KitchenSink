Render_Target = Core.class(Sprite)

function Render_Target:init()
	--original bitmap
	local bmp = Bitmap.new(Texture.new("examples/Render_Target/crate.png", true))
	
	--plain bitmap
	local bmp0 = Bitmap.new(Texture.new("examples/Render_Target/crate.png", true))
	bmp0:setPosition(0, 50)
	self:addChild(bmp0)
	
	local rt = RenderTarget.new(bmp:getWidth(), bmp:getHeight())
	
	--bitmap with rendertarget as texture
	local bmp1 = Bitmap.new(rt)
	bmp1:setPosition(200, 50)
	self:addChild(bmp1)
	
	
	--bitmap with rendertarget as texture region
	local region1 = TextureRegion.new(rt)
	local bmp2 = Bitmap.new(region1)
	bmp2:setPosition(200, 200)
	self:addChild(bmp2)
	
	--shape with rendertarget as texture
	local shape = Shape.new()
	shape:setFillStyle(Shape.TEXTURE, rt)
	shape:beginPath()
	shape:moveTo(0,0)
	shape:lineTo(bmp:getWidth(), 0)
	shape:lineTo(bmp:getWidth(), bmp:getHeight())
	shape:lineTo(0, bmp:getHeight())
	shape:lineTo(0, 0)
	shape:endPath()
	shape:setPosition(0, 200)
	self:addChild(shape)
	
	--bitmap with rendertarget using setTexture
	local bmp3 = Bitmap.new(Texture.new("examples/Render_Target/crate.png", true))
	bmp3:setPosition(0, 350)
	self:addChild(bmp3)
	bmp3:setTexture(rt)
	
	--bitmap with rendertarget using setTextureRegion
	local bmp4 = Bitmap.new(Texture.new("examples/Render_Target/crate.png", true))
	bmp4:setPosition(200, 350)
	self:addChild(bmp4)
	bmp4:setTextureRegion(region1)
	
	local frame = 0
	self:addEventListener(Event.ENTER_FRAME, function(event)
		local r = math.sin(frame * 0.03) * 0.3 + 0.7
		local g = math.sin(frame * 0.04) * 0.3 + 0.7
		local b = math.sin(frame * 0.05) * 0.3 + 0.7
		bmp:setColorTransform(r, g, b, 1)
		frame = frame + 1
		rt:draw(bmp)
	end)
end