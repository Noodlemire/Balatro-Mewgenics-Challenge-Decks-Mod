--[[
Radical Rat Deck

Each round, one random
card in the first drawn
hand will turn into a Bomb
--]]

local key = "radrat"

MewgenicsCD.deckmusic["b_mewcd_"..key] = "eatinrats"
MewgenicsCD.quip_colours[key] = {HEX("bdbdbd"), HEX("a7a6a6"), HEX("c3b9bd")}
MewgenicsCD.add_quip(key, "dynamite", "loss", 6)
MewgenicsCD.add_quip(key, "undefeatable", "loss", 15)
MewgenicsCD.add_quip(key, "napalm", "loss", 11)
MewgenicsCD.add_quip(key, "glasses", "loss", 8)

MewgenicsCD.functions.radrat_calculate = function(self, obj, context)
	if context.first_hand_drawn then
		local eligible_blank, eligible_any = {}, {}
		for pos, card in ipairs(context.hand_drawn) do
			if not next(SMODS.get_enhancements(card)) and not card.debuff then
				table.insert(eligible_blank, pos)
			end
			if not SMODS.has_enhancement(card, "m_mewcd_bomb") then
				table.insert(eligible_any, pos)
			end
		end
		local pos = pseudorandom_element(eligible_blank, "b_mewcd_radrat")
		if not pos then
			pos = pseudorandom_element(eligible_any, "b_mewcd_radrat")
		end
		if pos then
			if SMODS.has_enhancement(context.hand_drawn[pos], "m_mewcd_burning") then
				MewgenicsCD.explode(pos)
			else
				context.hand_drawn[pos]:set_ability("m_mewcd_bomb")
				context.hand_drawn[pos]:juice_up()
				play_sound("tarot1")
			end
		end
	end
end

return 2, SMODS.Back, {
	key = key,
	atlas = "mewcd_decks",
	pos = {x = 1, y = 0},
	calculate = MewgenicsCD.functions.radrat_calculate
}
