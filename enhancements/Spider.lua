--[[
Spider

No rank or suit
Play to destroy
--]]

return 4, SMODS.Enhancement, {
	key = "spider",
	atlas = "mewcd_enh",
	badge_colour = HEX("818181"),
	pos = {x = 7, y = 4},
	no_rank = true,
	no_suit = true,
	always_scores = true,
	replace_base_card = true,
	in_pool = function(self, args)
		return false
	end,
	calculate = function(self, card, context)
		if context.destroy_card and context.cardarea == G.play and context.destroy_card == card then
			return {remove = true}
		end
	end,
}
