--[[
Pebbles Sleeve

Once per Ante: If your total score is
above 75% of the Blind's goal without
beating it, destroy rightmost Joker

Pebbles Sleeve (Doubled)

The threshold is 50% instead
--]]

MewgenicsCD.deckmusic.sleeve_mewcd_pebbles = "katfight"

return 1, CardSleeves.Sleeve, {
	key = "pebbles",
	atlas = "mewcd_sleeves",
	pos = {x = 0, y = 0},
	config = {requirement = 75, doubled = 50},
	loc_vars = function(self)
		if self.get_current_deck_key() == "b_mewcd_pebbles" then
			return {key = self.key.."_double", vars = {self.config.doubled}}
		else
			return {vars = {self.config.requirement}}
		end
	end,
	apply = MewgenicsCD.functions.pebbles_apply,
	calculate = function(self, sleeve, context)
		--Due to order of operations, this calculate will only ever do anything when this Sleeve is not paired with the Pebbles Deck.
		return MewgenicsCD.functions.pebbles_calculate(self, sleeve, context, self.config.requirement)
	end
}
