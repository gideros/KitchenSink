Native_Json = Core.class(Sprite)

function Native_Json:init()
	--recursive print of tables
	function print_r (t, indent, done)
	done = done or {}
	indent = indent or ''
	local nextIndent -- Storage for next indentation value
	for key, value in pairs (t) do
		if type (value) == "table" and not done [value] then
		nextIndent = nextIndent or
			(indent .. string.rep(' ',string.len(tostring (key))+2))
			-- Shortcut conditional allocation
		done [value] = true
		print (indent .. "[" .. tostring (key) .. "] => Table {");
		print  (nextIndent .. "{");
		print_r (value, nextIndent .. string.rep(' ',2), done)
		print  (nextIndent .. "}");
		else
		print  (indent .. "[" .. tostring (key) .. "] => " .. tostring (value).."")
		end
	end
	end
	
	function load( filename )
		-- will hold contents of file
		local contents
	
		-- io.open opens a file at path. returns nil if no file found
		local file = io.open( filename, "r" )
		if file then
			-- read all contents of file into a string
			contents = file:read( "*a" )
			-- close the file after using it
			io.close( file )
			--return Decoded Json string
			return contents
		else
			--or return nil if file didn't ex
			return nil
		end
	end
	
	require "json"
	print(Json)
	
	local t = {}
	local str = Json.Encode(t)
	print(str)
	t = Json.Decode(str)
	print(t)
	
	local contents = load("examples/Native_Json/test_data.json")
	local table_contents = Json.Decode(contents)
	print(#table_contents.objects[1].shapeP)
end