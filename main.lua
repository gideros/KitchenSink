--for auto adding new examples
require"lfs"

--store found examples
scenes = {}
scenes["startScene"] = StartScene


--look in examples folder
local path = "examples"
--walk through all the files
for file in lfs.dir(path) do
	if file ~= "." and file ~= ".." then
		print(file)
		--add new scene based on the file/folder name
		scenes[file] = assert(loadstring(string.format('return %s', file)))() --hack to eval string
		print(scenes[file])
	end
end

--create scene manager with examples
sceneManager = SceneManager.new(scenes)
--add scenemanager to stage
stage:addChild(sceneManager)

sceneManager:changeScene("startScene", 0.1, SceneManager.moveFromRight)

