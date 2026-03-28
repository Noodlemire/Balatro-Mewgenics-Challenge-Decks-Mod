--[[
Spinarette Deck

After first Ante, one
random card in each drawn
hand will be Infested
--]]

local key = "spider"

MewgenicsCD.deckmusic["b_mewcd_"..key] = "crystallinedreams"
MewgenicsCD.quip_colours[key] = {HEX("361e1e"), HEX("2b2b2b"), HEX("000000")}
MewgenicsCD.add_quip(key, "delicious", "loss", 6)
MewgenicsCD.add_quip(key, "brood", "loss", 7)
MewgenicsCD.add_quip(key, "angry", "loss", 5)
MewgenicsCD.add_quip(key, "watching", "loss", 6)

MewgenicsCD.functions.spider_calculate = function(self, obj, context)
	if G.GAME.round_resets.ante > 1 and (context.hand_drawn or context.other_drawn) then
		local drawn = context.hand_drawn or context.other_drawn
		local eligible_blank, eligible_any = {}, {}
		for pos, card in ipairs(drawn) do
			if not next(SMODS.get_enhancements(card)) and not card.debuff then
				table.insert(eligible_blank, pos)
			end
			if not SMODS.has_enhancement(card, "m_mewcd_infested") and not SMODS.has_enhancement(card, "m_mewcd_spider") then
				table.insert(eligible_any, pos)
			end
		end
		local pos = pseudorandom_element(eligible_blank, "b_mewcd_spider")
		if not pos then
			pos = pseudorandom_element(eligible_any, "b_mewcd_spider")
		end
		if pos then
			drawn[pos]:set_ability("m_mewcd_infested")
			drawn[pos]:juice_up()
			play_sound("tarot1")
		end
	end
end

local get_old_boss = get_new_boss
function get_new_boss()
	if (G.GAME.selected_back.effect.center.key == "b_mewcd_spider" or G.GAME.selected_sleeve == "sleeve_mewcd_spider") and G.GAME.round_resets.ante == 1 then
		return "bl_mewcd_obs"
	else
		return get_old_boss()
	end
end

return 6, SMODS.Back, {
	key = key,
	atlas = "mewcd_decks",
	pos = {x = 5, y = 0},
	calculate = MewgenicsCD.functions.spider_calculate
}
