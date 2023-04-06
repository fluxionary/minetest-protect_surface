protect_surface = fmod.create()

local s = protect_surface.settings
local S = protect_surface.S

minetest.register_on_mods_loaded(function()
	local old_is_protected = minetest.is_protected

	function minetest.is_protected(pos, name)
		if old_is_protected(pos, name) then
			return true
		elseif pos.y < s.min_y or pos.y > s.max_y then
			return false
		else
			if old_is_protected(pos, "") then
				return false
			else
				minetest.chat_send_player(name, S("you cannot modify the surface unless you protect it first."))
				return true
			end
		end
	end
end)
