--[[
Spinarette Sleeve

After first Ante, one random card
in each drawn hand will be Infested

Radical Rat Sleeve (Doubled)

Doubles Infestation rate
--]]

MewgenicsCD.deckmusic.sleeve_mewcd_spider = "crystallinedreams"

return 6, CardSleeves.Sleeve, {
	key = "spider",
	atlas = "mewcd_sleeves",
	pos = {x = 5, y = 0},
	loc_vars = function(self)
		if self.get_current_deck_key() == "b_mewcd_spider" then
			return {key = self.key.."_double"}
		end
	end,
	calculate = MewgenicsCD.functions.spider_calculate
}
