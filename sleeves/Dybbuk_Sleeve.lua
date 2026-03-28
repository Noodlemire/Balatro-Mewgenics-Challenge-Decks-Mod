--[[
Dybbuk Sleeve

Beating a Boss Blind makes one random Joker
gain Negative, Eternal, and -X1 to any values

Dybbuk Sleeve (Doubled)

If this would select a Joker that lacks values
that can be inverted, it will be destroyed instead.
--]]

MewgenicsCD.deckmusic.sleeve_mewcd_dybbuk = "themkittybones"

return 7, CardSleeves.Sleeve, {
	key = "dybbuk",
	atlas = "mewcd_sleeves",
	pos = {x = 6, y = 0},
	loc_vars = function(self, info_queue, sleeve)
		if self.get_current_deck_key() == "b_mewcd_dybbuk" then
			return {key = self.key.."_double"}
		end
	end,
	calculate = function(self, sleeve, context)
		if self.get_current_deck_key() ~= "b_mewcd_dybbuk" then
			return MewgenicsCD.functions.dybbuk_calculate(self, sleeve, context, false)
		end
	end
}
