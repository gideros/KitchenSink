StartScene = Core.class(Sprite)

function StartScene:init()
	self.startX = 20
	self.startY = 20
	self.scale = 2
	self.curScene = nil
	self.time = 0.2
		
	--common back button
	self.back = TextField.new(nil, "Back")
	self.back:setScale(self.scale)
	self.back:setPosition(self.startX, self.startY)
	self.back:addEventListener(Event.MOUSE_DOWN, function(self, e)
		if self.back:hitTestPoint(e.x, e.y) then
			self:moveBack()
		end
	end, self)
	
	
	--common next button
	self.next = TextField.new(nil, "Next")
	self.next:setScale(self.scale)
	self.next:setPosition((application:getContentWidth() - self.next:getWidth()) - self.startX, self.startY)
	self.next:addEventListener(Event.MOUSE_DOWN, function(self, e)
		if self.next:hitTestPoint(e.x, e.y) then
			self:moveNext()
		end
	end, self)
	
	local buttonText
	for key, val in pairs(scenes) do
		if key ~= "startScene" then
			--add button for this scene
			buttonText = TextField.new(nil, key)
			buttonText:setScale(self.scale)
			buttonText:setPosition(self.startX, self.startY)
			buttonText.scene = key
			buttonText:addEventListener(Event.MOUSE_DOWN, function(self, e)
				if self:hitTestPoint(e.x, e.y) then
					self:getParent().curScene = self.scene
					sceneManager:changeScene(self.scene, self:getParent().time, SceneManager.moveFromRight)
					stage:addChild(self:getParent().back)
					stage:addChild(self:getParent().next)
				end
			end, buttonText)
			self:addChild(buttonText)
			self.startY = self.startY + 50
		end
	end
end

function StartScene:moveBack()
	self.curScene = nil
	stage:removeChild(self.back)
	stage:removeChild(self.next)
	sceneManager:changeScene("startScene", self.time, SceneManager.moveFromLeft)
end

function StartScene:moveNext()
	local nextItem = false
	--lets find the next scene in scenes table
	for key, val in pairs(scenes) do
		if key ~= "startScene" then
			--got the next scene
			if nextItem then
				self.curScene = key
				sceneManager:changeScene(key, self.time, SceneManager.moveFromRight)
				nextItem = false
				break
			end
			--we will be taking next scene
			if key == self.curScene then
				nextItem = true
			end
		end
	end
	--current scene was the last one, return to th start
	if nextItem then
		self.curScene = nil
		stage:removeChild(self.back)
		stage:removeChild(self.next)
		sceneManager:changeScene("startScene", self.time, SceneManager.moveFromLeft)
	end
end