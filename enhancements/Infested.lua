--[[
Infested

Turns into 3 Spider
Cards when discarded
--]]

return 3, SMODS.Enhancement, {
	key = "infested",
	atlas = "mewcd_enh",
	badge_colour = HEX("acacac"),
	pos = {x = 7, y = 4},
	in_pool = function(self, args)
		return false
	end,
	calculate = function(self, card, context)
		if context.discard and context.other_card == card then
			G.E_MANAGER:add_event(Event{
				func = function()
					for i = 1, 3 do
						SMODS.add_card {set = "Base", enhancement = "m_mewcd_spider", area = G.hand}
					end
					return true
				end
			})
			return {remove = true}
		end
	end,
}
