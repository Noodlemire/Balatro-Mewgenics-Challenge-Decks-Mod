--[[
Queen Hippo Deck

X0.25 Mult during Boss Blinds
Gains X0.25 per hand played
Resets at end of round
--]]

local key = "hippo"

MewgenicsCD.deckmusic["b_mewcd_"..key] = "eatinrats"
MewgenicsCD.quip_colours[key] = {HEX("b6b07c"), HEX("cbbfaf"), HEX("e5c7c7")}
MewgenicsCD.add_quip(key, "eating", "loss", 11)
MewgenicsCD.add_quip(key, "weaknesses", "loss", 13)
MewgenicsCD.add_quip(key, "queen", "loss", 9)
MewgenicsCD.add_quip(key, "nipple", "loss", 13)

MewgenicsCD.functions.hippo_calculate = function(self, obj, context, xmult_base, xmult_gain)
	if not (G.GAME.blind and G.GAME.blind.in_blind and G.GAME.blind.boss) then return end
	if context.final_scoring_step then
		return {xmult = G.GAME.mewcd_hippo_xmult}
	elseif context.first_hand_drawn then
		if G.GAME.blind.config.blind.key == "bl_needle" then
			--Not elegant, but it's better than Needle instantly killing Queen Hippo runs.
			xmult_base = 1
		end
		G.GAME.mewcd_hippo_xmult = xmult_base
		return {message = localize{type = "variable", key = "a_xmult", vars = {G.GAME.mewcd_hippo_xmult}}}
	elseif context.after then
		if G.GAME.chips + SMODS.calculate_round_score() > G.GAME.blind.chips then
			G.GAME.mewcd_hippo_xmult = xmult_base
			return {message = localize{key = "k_reset"}}
		else
			G.GAME.mewcd_hippo_xmult = G.GAME.mewcd_hippo_xmult + xmult_gain
			return {message = localize{type = "variable", key = "a_xmult", vars = {G.GAME.mewcd_hippo_xmult}}}
		end
	end
end

return 3, SMODS.Back, {
	key = key,
	atlas = "mewcd_decks",
	pos = {x = 2, y = 0},
	config = {extra = {xmult = 0.25, xmult_gain = 0.25, xmult_double = 0}},
	loc_vars = function(self, info_queue, deck)
		return {vars = {G.GAME and G.GAME.mewcd_hippo_xmult or self.config.extra.xmult, self.config.extra.xmult_gain}}
	end,
	calculate = function(self, deck, context)
		return MewgenicsCD.functions.hippo_calculate(self, deck, context, G.GAME.selected_sleeve == "sleeve_mewcd_hippo" and self.config.extra.xmult_double or self.config.extra.xmult, self.config.extra.xmult_gain)
	end
}
