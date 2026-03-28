--[[
Throbbing King Sleeve

Played hand must contain a Three of a Kind/Two Pair/Flush!
Hand changes each round
Second phase after Ante 6

Throbbing King Sleeve (Doubled)

Chooses significantly harder hands

Throbbing King Sleeve (Phase 2)

Causes X0.5 mult when cards of
rank Ace are scored or held in hand
Rank changes each round

Throbbing King Sleeve (Phase 2) (Doubled)

Chooses an additional rank each round
--]]

MewgenicsCD.deckmusic.sleeve_mewcd_throb = "sweetdelicious"

return 8, CardSleeves.Sleeve, {
	key = "throb",
	atlas = "mewcd_sleeves",
	pos = {x = 7, y = 0},
	config = {
		ante = 6,
		hands_regular = {"Three of a Kind", "Two Pair", "Flush"},
		xmult = 0.5
	},
	loc_vars = function(self, info_queue, sleeve)
		if self.get_current_deck_key() == "b_mewcd_throb" then
			return {key = self.key..(G.GAME.round_resets.ante > self.config.ante and "_2" or "").."_double"}
		end
		if G.GAME.round_resets.ante > self.config.ante then
			return {vars = {self.config.xmult, MewgenicsCD.functions.throb_ranks_to_string(G.GAME.mewcd_throb_ranks or {})}, key = self.key.."_2"}
		else
			return {vars = {localize(G.GAME.mewcd_throb_hand or self.config.hands_regular[1], "poker_hands"), self.config.ante}}
		end
	end,
	calculate = function(self, sleeve, context)
		if self.get_current_deck_key() ~= "b_mewcd_throb" then
			return MewgenicsCD.functions.throb_calculate(self, sleeve, context, MewgenicsCD.functions.throb_data(self.config, false), G.GAME.round_resets.ante > self.config.ante and 2 or 1)
		end
	end
}
