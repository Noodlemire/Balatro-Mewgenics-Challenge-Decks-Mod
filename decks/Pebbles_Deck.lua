--[[
Pebbles Deck

Once per Ante:
If your total score is
above 75% of the Blind's
goal without beating it,
destroy rightmost Joker
--]]

local key = "pebbles"

MewgenicsCD.deckmusic["b_mewcd_"..key] = "katfight"
MewgenicsCD.quip_colours[key] = {HEX("746b6c"), HEX("bfbdbe"), HEX("938a7f")}
MewgenicsCD.add_quip(key, "rocked", "loss", 5)
MewgenicsCD.add_quip(key, "world", "loss", 6)
MewgenicsCD.add_quip(key, "boulder", "loss", 3)

MewgenicsCD.functions.pebbles_apply = function(self, obj)
	G.GAME.mewcd_pebbles_active = true
end

MewgenicsCD.functions.pebbles_calculate = function(self, obj, context, requirement)
	if (context.ante_change or 0) > 0 then
		G.GAME.mewcd_pebbles_active = true
	elseif context.after and G.GAME.mewcd_pebbles_active then
		local score = G.GAME.chips + SMODS.calculate_round_score()
		if context.after and score > G.GAME.blind.chips * requirement / 100 and score < G.GAME.blind.chips then
			local joker = nil
			for i = #G.jokers.cards, 1, -1 do
				if not SMODS.is_eternal(G.jokers.cards[i], obj) and not G.jokers.cards[i].getting_sliced then
					joker = G.jokers.cards[i]
					break
				end
			end
			if joker then
				G.GAME.mewcd_pebbles_active = false
				joker.getting_sliced = true
				G.E_MANAGER:add_event(Event({
					func = function()
						joker:start_dissolve({G.C.RED}, nil, 1.6)
						return true
					end
				}))
				return {
					message = localize("k_mewcd_boulder_drop"),
					colour = G.C.RED
				}
			end
		end
	end
end

return 1, SMODS.Back, {
	key = key,
	atlas = "mewcd_decks",
	pos = {x = 0, y = 0},
	config = {extra = {requirement = 75, doubled = 50}},
	loc_vars = function(self, info_queue, back)
		return {vars = {self.config.extra.requirement}}
	end,
	apply = MewgenicsCD.functions.pebbles_apply,
	calculate = function(self, deck, context)
		return MewgenicsCD.functions.pebbles_calculate(self, deck, context, G.GAME.selected_sleeve == "sleeve_mewcd_pebbles" and self.config.extra.doubled or self.config.extra.requirement)
	end
}
