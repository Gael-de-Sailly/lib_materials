

local S = lib_materials.intllib

local schem_path = lib_materials.path .. "/schematics/"
local metatable = {
	__index = function(self, index)
		local path = schem_path .. index .. ".mts"
		if io.open(path) then
			self[index] = path
			return path
		else
			return nil
		end
	end
}

lib_materials.schem = setmetatable({}, metatable)
