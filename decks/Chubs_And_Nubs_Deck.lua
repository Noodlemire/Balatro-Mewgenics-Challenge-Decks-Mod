--[[
Chubs & Nubs Deck

+Chips and +Mult effects only
work during odd and even
numbered rounds, respectively
Diamonds and Hearts score
+Mult instead of +Chips
--]]

local key = "nubchub"

MewgenicsCD.deckmusic["b_mewcd_"..key] = "chumbucketkitty"
MewgenicsCD.quip_colours[key] = {HEX("675480"), HEX("656f76"), HEX("527652")}
MewgenicsCD.add_quip(key, "borkruff ", "loss", 4)
MewgenicsCD.add_quip(key, "arfyiff", "loss", 4)
MewgenicsCD.add_quip(key, "coughhorf", "loss", 4)
MewgenicsCD.add_quip(key, "rooofgurgle", "loss", 4)

local old_calc = SMODS.calculate_effect
function SMODS.calculate_effect(effect, scored_card, from_edition, pre_jokers)
	if G.GAME.selected_back.effect.center.key == "b_mewcd_nubchub" or G.GAME.selected_sleeve == "sleeve_mewcd_nubchub" then
		if G.GAME.round % 2 == 0 then
			effect.chips = nil
			effect.h_chips = nil
			effect.chip_mod = nil
		else
			effect.mult = nil
			effect.h_mult = nil
			effect.mult_mod = nil
		end
	end
	if G.GAME.selected_back.effect.center.key == "b_mewcd_nubchub" and G.GAME.selected_sleeve == "sleeve_mewcd_nubchub" then
		if G.GAME.round % 2 == 0 then
			effect.x_chips = nil
			effect.xchips = nil
			effect.Xchip_mod = nil
		else
			effect.x_mult = nil
			effect.Xmult = nil
			effect.xmult = nil
			effect.x_mult_mod = nil
			effect.Xmult_mod = nil
		end
	end

	return old_calc(effect, scored_card, from_edition, pre_jokers)
end

local old_card_chips = Card.get_chip_bonus
function Card:get_chip_bonus()
	local chips = old_card_chips(self)
	if (G.GAME.selected_back.effect.center.key == "b_mewcd_nubchub" or G.GAME.selected_sleeve == "sleeve_mewcd_nubchub") and not SMODS.has_no_suit(self) and (self.base.suit == "Hearts" or self.base.suit == "Diamonds") then
		chips = chips - self.base.nominal
	end
	return chips
end

local old_card_mult = Card.get_chip_mult
function Card:get_chip_mult()
	local mult = old_card_mult(self)
	if (G.GAME.selected_back.effect.center.key == "b_mewcd_nubchub" or G.GAME.selected_sleeve == "sleeve_mewcd_nubchub") and not SMODS.has_no_suit(self) and (self.base.suit == "Hearts" or self.base.suit == "Diamonds") then
		mult = mult + self.base.nominal
	end
	return mult
end

local old_generate_ui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
	local add_mult_loc = nil
	if specific_vars and specific_vars.nominal_chips and (G.GAME.selected_back.effect.center.key == "b_mewcd_nubchub" or G.GAME.selected_sleeve == "sleeve_mewcd_nubchub") and _c.name ~= 'Stone Card' and not _c.replace_base_card and (specific_vars.suit == "Hearts" or specific_vars.suit == "Diamonds") then
		local new_vars = {}
		add_mult_loc = specific_vars.nominal_chips
		for k, var in pairs(specific_vars) do
			if k ~= "nominal_chips" then
				new_vars[k] = var
			end
		end
		specific_vars = new_vars
	end

	local fut = old_generate_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)

	if add_mult_loc then
		local fake_nodes = {}
		localize({key = "card_mult", type = "other", nodes = fake_nodes, vars = {add_mult_loc}})
		table.insert(fut.main, 1, fake_nodes[1])
	end

	return fut
end

return 5, SMODS.Back, {
	key = key,
	atlas = "mewcd_decks",
	pos = {x = 4, y = 0}
}
