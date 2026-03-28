--[[
Boris Sleeve

If Blind is defeated by more than X1.5 the
requirement, Ante Scaling increases by X0.5
(Currently X1)

Boris Sleeve (Doubled)

The threshold is X1.1 instead
--]]

MewgenicsCD.deckmusic.sleeve_mewcd_boris = "flush"

return 4, CardSleeves.Sleeve, {
	key = "boris",
	atlas = "mewcd_sleeves",
	pos = {x = 3, y = 0},
	config = {overshoot = 1.5, overshoot_double = 1.1, increase = 0.5},
	loc_vars = function(self, info_queue, deck)
		if self.get_current_deck_key() == "b_mewcd_boris" then
			return {key = self.key.."_double", vars = {self.config.overshoot_double}}
		else
			return {vars = {self.config.overshoot, self.config.increase, G.GAME and G.GAME.modifiers.scaling or 1}}
		end
	end,
	calculate = function(self, deck, context)
		if self.get_current_deck_key() ~= "b_mewcd_boris" then
			return MewgenicsCD.functions.boris_calculate(self, deck, context, self.config.overshoot, self.config.increase)
		end
	end
}
