--[[
Radical Rat Sleeve

Each round, one random card in the
first drawn hand will turn into a Bomb

Radical Rat Sleeve (Doubled)

An extra card becomes a Bomb each round
--]]

MewgenicsCD.deckmusic.sleeve_mewcd_radrat = "eatinrats"

return 2, CardSleeves.Sleeve, {
	key = "radrat",
	atlas = "mewcd_sleeves",
	pos = {x = 1, y = 0},
	loc_vars = function(self)
		if self.get_current_deck_key() == "b_mewcd_radrat" then
			return {key = self.key.."_double"}
		end
	end,
	calculate = MewgenicsCD.functions.radrat_calculate
}
