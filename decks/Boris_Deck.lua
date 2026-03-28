--[[
Boris Deck

If Blind is defeated by more
than X1.5 the requirement,
Ante Scaling increases by X0.5
(Currently X1)
--]]

local active = false
local key = "boris"

MewgenicsCD.deckmusic["b_mewcd_"..key] = "flush"
MewgenicsCD.quip_colours[key] = {HEX("858691"), HEX("6b6c74"), HEX("4c4d53")}
MewgenicsCD.add_quip(key, "blub", "loss", 2)
MewgenicsCD.add_quip(key, "glub", "loss", 2)
MewgenicsCD.add_quip(key, "fart", "loss", 2)
MewgenicsCD.add_quip(key, "grumble", "loss", 4)

MewgenicsCD.functions.boris_calculate = function(self, obj, context, overshoot, increase)
	if context.after and G.GAME.chips + SMODS.calculate_round_score() > G.GAME.blind.chips * overshoot then
		active = true
	elseif context.end_of_round and context.main_eval and not context.game_over and active then
		G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + increase
		active = false
		return {message = "X"..G.GAME.modifiers.scaling, colour = G.C.YELLOW}
	end
end

return 4, SMODS.Back, {
	key = key,
	atlas = "mewcd_decks",
	pos = {x = 3, y = 0},
	config = {extra = {overshoot = 1.5, overshoot_double = 1.1, increase = 0.5}},
	loc_vars = function(self, info_queue, deck)
		return {vars = {self.config.extra.overshoot, self.config.extra.increase, G.GAME and G.GAME.modifiers.scaling or 1}}
	end,
	calculate = function(self, deck, context)
		return MewgenicsCD.functions.boris_calculate(self, deck, context, G.GAME.selected_sleeve == "sleeve_mewcd_boris" and self.config.extra.overshoot_double or self.config.extra.overshoot, self.config.extra.increase)
	end
}
