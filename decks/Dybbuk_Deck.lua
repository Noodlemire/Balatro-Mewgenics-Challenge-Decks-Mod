--[[
Dybbuk Deck

Beating a Boss Blind
makes one random Joker
gain Negative, Eternal,
and -X1 to any values
--]]

local key = "dybbuk"

MewgenicsCD.deckmusic["b_mewcd_"..key] = "themkittybones"
MewgenicsCD.quip_colours[key] = {HEX("73848d"), HEX("b7b7b7"), HEX("383147")}
MewgenicsCD.add_quip(key, "spoil", "loss", 7)
MewgenicsCD.add_quip(key, "inside", "loss", 13)
MewgenicsCD.add_quip(key, "touch", "loss", 3)
MewgenicsCD.add_quip(key, "death", "loss", 7)

local joker_exceptions = {
	j_chaos = true,
	j_dusk = true,
	j_hack = true,
	j_hanging_chad = true,
	j_marble = true,
	j_mime = true,
	j_riff_raff = true,
	j_selzer = true,
	j_sock_and_buskin = true,
	j_misprint = true,
	j_supernova = true,
}

local nonfunc_vars = {
	card_limit = true,
	edition = true,
	order = true,
	hands_played_at_create = true,
}

local meant_to_be_1 = {
	x_chips = true,
	x_mult = true,
	x_chips = true,
	h_x_chips = true
}

local function has_numbers(tbl, inner)
	for k, v in pairs(tbl) do
		if type(v) == "table" and not nonfunc_vars[k] then
			if has_numbers(v, true) then return true end
		elseif type(v) == "number" and not nonfunc_vars[k] and (inner or (not meant_to_be_1[k] and v ~= 0) or (meant_to_be_1[k] and v ~= 1)) then
			print("Found: "..k)
			return true
		end
	end
end

local function invert(tbl, inner)
	for k, v in pairs(tbl) do
		if type(v) == "table" and not nonfunc_vars[k] then
			invert(v, true)
		elseif type(v) == "number" and not nonfunc_vars[k] and (inner or not meant_to_be_1[k] or v ~= 1) then
			tbl[k] = -v
		end
	end
end

MewgenicsCD.functions.dybbuk_calculate = function(self, obj, context, doubled)
	if context.end_of_round and context.main_eval and not context.game_over and context.beat_boss then
		local eligible_numbered = {}
		local eligible_any = {}
		local destroy = false
		for _, joker in ipairs(G.jokers.cards) do
			if not joker.edition or not joker.edition.negative or not SMODS.is_eternal(joker, obj) then
				table.insert(eligible_any, joker)
				print(joker.config.center.key)
				if not joker_exceptions[joker.config.center.key] and has_numbers(joker.ability) then
					table.insert(eligible_numbered, joker)
				end
			end
		end
		local inverted = pseudorandom_element(eligible_numbered, "b_mewcd_dybbuk")
		if not inverted then
			inverted = pseudorandom_element(eligible_any, "b_mewcd_dybbuk")
			destroy = doubled
		end
		if inverted then
			if destroy then
				inverted:start_dissolve()
			else
				if inverted.ability and not joker_exceptions[inverted.config.center.key] then
					inverted:remove_from_deck(true)
					invert(inverted.ability)
					inverted:add_to_deck(true)
				end
				inverted:set_edition({ negative = true }, true)
				inverted:add_sticker("eternal", true)
				inverted:juice_up()
			end
			return {message = localize("k_mewcd_hehehe")}
		end
	elseif context.check_eternal and context.other_card.ability.set == "Joker" and context.other_card.ability.eternal then
		return {no_destroy = {override_compat = true}}
	end
end

return 7, SMODS.Back, {
	key = key,
	atlas = "mewcd_decks",
	pos = {x = 6, y = 0},
	calculate = function(self, deck, context)
		return MewgenicsCD.functions.dybbuk_calculate(self, deck, context, G.GAME.selected_sleeve == "sleeve_mewcd_dybbuk")
	end
}
