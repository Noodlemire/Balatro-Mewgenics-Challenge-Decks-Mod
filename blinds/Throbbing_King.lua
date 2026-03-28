--[[
Throbbing King

Becomes X1.1 stronger
with each card moved
to your discard pile
--]]

MewgenicsCD.deckmusic.bl_mewcd_throb = "throbbingking"

local increase = 1.1

return 2, SMODS.Blind, {
	key = "throb",
	atlas = "mewcd_blinds",
	pos = {y = 1},
	boss = {showdown = true},
	boss_colour = HEX("ac3234"),
	loc_vars = function(self)
		return {vars = {increase}}
	end,
	vars = {increase},
	calculate = function(self, blind, context)
		if context.hand_drawn and #G.discard.cards > 0 then
			blind.chips = get_blind_amount(G.GAME.round_resets.ante)*blind.mult*G.GAME.starting_params.ante_scaling * increase ^ #G.discard.cards
			blind.chip_text = number_format(G.GAME.blind.chips)
			blind:set_text()
			blind:wiggle()
			return {message = localize("k_mewcd_yum")}
		end
	end,
	in_pool = function(self)
		return false
	end
}
