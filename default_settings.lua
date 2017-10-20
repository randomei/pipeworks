-- Various settings

local prefix = "pipeworks_"

local settings = {
	enable_pipes = true,
	enable_autocrafter = true,
	enable_deployer = true,
	enable_dispenser = true,
	enable_node_breaker = true,
	enable_teleport_tube = true,
	enable_pipe_devices = true,
	enable_redefines = true,
	enable_mese_tube = true,
	enable_detector_tube = true,
	enable_digiline_detector_tube = true,
	enable_conductor_tube = true,
	enable_digiline_conductor_tube = true,
	enable_accelerator_tube = true,
	enable_crossing_tube = true,
	enable_sand_tube = true,
	enable_mese_sand_tube = true,
	enable_one_way_tube = true,
	enable_priority_tube = true,
	enable_lua_tube = true,
	enable_cyclic_mode = true,
	drop_on_routing_fail = false,

	delete_item_on_clearobject = true,
}

pipeworks.toggles = {}
-- documentation for toggles controlling pressure logic features.
-- do not edit this file directly;
-- instead, create pipeworks_settings.txt in your world directory,
-- and copy the uncommented lines from the block comments below into it.
--[[
-- flow logic implementation.
-- set to one of the following strings.
-- "classic": classic mode written by VanessaE
-- "pressure": pressure metadata based, written by thetaepsilon.
--	has caveats such as water speed issues though.
-- setting to nil inhibits all flow logic, useful for debugging ABM crashes,
-- or for rendering the pipes purely decorative.
]]
pipeworks.toggles.pipe_mode = "classic"
--[[
-- force-enable finite water handling mode.
-- this changes the way that water node placement is handled;
-- volume will always be preserved,
-- and water is assumed to move itself downwards.
-- nil (the default) means autodetect from installed finite liquid mods,
-- true is force-on, false is force-off.
-- note that you should NOT normally explicitly set this to true/false,
-- unless the mod you want this for is not covered by auto-detection
-- (please see autodetect-finite-water.lua).
-- please file an issue if you have a finite water mod not covered there,
-- and feel it necessary to explicitly set this toggle
pipeworks.toggles.finite_water = nil
]]

for name, value in pairs(settings) do
	local setting_type = type(value)
	if setting_type == "boolean" then
		pipeworks[name] = minetest.settings:get_bool(prefix..name)
		if pipeworks[name] == nil then
			pipeworks[name] = value
		end
	else
		pipeworks[name] = value
	end
end
