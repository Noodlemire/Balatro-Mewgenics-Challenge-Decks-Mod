--[[
One Baby Spider

Please don't hurt me!
--]]

return 1, SMODS.Blind, {
	key = "obs",
	atlas = "mewcd_blinds",
	pos = {y = 0},
	mult = 1,
	boss = {min = 1},
	boss_colour = HEX("454545"),
	in_pool = function(self)
		return false
	end
}
