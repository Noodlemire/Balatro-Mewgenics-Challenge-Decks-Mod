--[[
Queen Hippo Sleeve

X0.25 Mult during Boss Blinds. Gains X0.25
per hand played. Resets at end of round

Queen Hippo Sleeve (Doubled)

Starts from X0 Mult instead
--]]

MewgenicsCD.deckmusic.sleeve_mewcd_hippo = "eatinrats"

return 3, CardSleeves.Sleeve, {
	key = "hippo",
	atlas = "mewcd_sleeves",
	pos = {x = 2, y = 0},
	config = {xmult = 0.25, xmult_gain = 0.25, xmult_double = 0},
	loc_vars = function(self, info_queue, deck)
		if self.get_current_deck_key() == "b_mewcd_hippo" then
			return {key = self.key.."_double", vars = {self.config.xmult_double}}
		else
			return {vars = {G.GAME and G.GAME.mewcd_hippo_xmult or self.config.xmult, self.config.xmult_gain}}
		end
	end,
	calculate = function(self, deck, context)
		if self.get_current_deck_key() ~= "b_mewcd_hippo" then
			return MewgenicsCD.functions.hippo_calculate(self, deck, context, self.config.xmult, self.config.xmult_gain)
		end
	end
}
