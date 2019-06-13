

lib_materials = {}
lib_materials.version = "5.0"
lib_materials.path = minetest.get_modpath(minetest.get_current_modname())

-- Intllib
local S
local NS
if minetest.get_modpath("game") then
	S = game.intllib
else
	if minetest.get_modpath("intllib") then
		S = intllib.Getter()
	else
		S, NS = dofile(lib_materials.path.."/intllib.lua")
	end
end
lib_materials.intllib = S

lib_materials.mgv7_mapgen_scale_factor = minetest.setting_get("lib_materials_mgv7_mapgen_scale_factor") or 8
lib_materials.biome_altitude_range = minetest.setting_get("lib_materials_biome_altitude_range") or 40

lib_materials.mg_params = minetest.get_mapgen_params()
lib_materials.mg_seed = lib_materials.mg_params.seed


--DEFAULTS
-- -192, -4, 0, 4, 30, 60, 90, 120, 150, 285, 485, 1250
-- -192, -4, 0, 4, 40, 80, 120, 160, 200, 380, 780, 1800
lib_materials.ocean_depth = -192
lib_materials.beach_depth = -4
lib_materials.sea_level = 0
lib_materials.maxheight_beach = 4
--lib_materials.maxheight_coastal = 30
--lib_materials.maxheight_lowland = 60
--lib_materials.maxheight_shelf = 90
--lib_materials.maxheight_highland = 120
--lib_materials.maxheight_mountain = 150
lib_materials.maxheight_coastal = lib_materials.sea_level + lib_materials.biome_altitude_range
lib_materials.maxheight_lowland = lib_materials.maxheight_coastal + lib_materials.biome_altitude_range
lib_materials.maxheight_shelf = lib_materials.maxheight_lowland + lib_materials.biome_altitude_range
lib_materials.maxheight_highland = lib_materials.maxheight_shelf + lib_materials.biome_altitude_range
lib_materials.maxheight_mountain = lib_materials.maxheight_highland + lib_materials.biome_altitude_range
lib_materials.minheight_snow = lib_materials.maxheight_mountain + lib_materials.biome_altitude_range
lib_materials.maxheight_snow = lib_materials.minheight_snow  + (lib_materials.biome_altitude_range * 2)
lib_materials.maxheight_strato = lib_materials.maxheight_snow  + (lib_materials.biome_altitude_range * (lib_materials.mgv7_mapgen_scale_factor / 2))

-- 100, 75, 50, 25, 0
-- 90, 75, 50, 25, 10
-- 90, 70, 50, 30, 10
lib_materials.temperature_hot = 100
lib_materials.temperature_warm = 75
lib_materials.temperature_temperate = 50
lib_materials.temperature_cool = 25
lib_materials.temperature_cold = 0
lib_materials.humidity_humid = 100
lib_materials.humidity_semihumid = 75
lib_materials.humidity_temperate = 50
lib_materials.humidity_semiarid = 25
lib_materials.humidity_arid = 0

-- 8, 4
--lib_materials.biome_vertical_blend = 4
lib_materials.biome_vertical_blend = lib_materials.biome_altitude_range / 5

minetest.clear_registered_biomes()
minetest.clear_registered_decorations()
minetest.clear_registered_ores()

minetest.log(S("[MOD] lib_materials:  Loading..."))

dofile(lib_materials.path.."/lib_materials_sound_defaults.lua")

dofile(lib_materials.path.."/type_fluids.lua")
dofile(lib_materials.path.."/type_stone.lua")
dofile(lib_materials.path.."/type_stone_deco.lua")
dofile(lib_materials.path.."/type_dirt.lua")
dofile(lib_materials.path.."/type_sand.lua")
dofile(lib_materials.path.."/type_ice_snow.lua")
dofile(lib_materials.path.."/type_ore.lua")
dofile(lib_materials.path.."/type_glass.lua")

dofile(lib_materials.path.."/lib_materials_schematics.lua")

dofile(lib_materials.path.."/lib_materials_tools.lua")

dofile(lib_materials.path.."/lib_materials_biomes.lua")

dofile(lib_materials.path.."/lib_materials_lakes.lua")

dofile(lib_materials.path.."/lib_materials_ore_defs.lua")

dofile(lib_materials.path.."/lib_materials_utils.lua")

dofile(lib_materials.path.."/lib_materials_abms.lua")

dofile(lib_materials.path.."/lib_materials_chatcommands.lua")

minetest.log(S("[MOD] lib_materials:  Successfully loaded."))





