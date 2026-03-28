--[[
Throbbing King Deck

Played hand must contain
a Three of a Kind/Two Pair/Flush!
Hand changes each round
Second phase after Ante 6

Throbbing King Deck (Phase 2)

Causes X0.5 mult when
cards of rank Ace are
scored or held in hand
Rank changes each round
--]]

local key = "throb"

MewgenicsCD.deckmusic["b_mewcd_"..key] = "sweetdelicious"
MewgenicsCD.quip_colours[key] = {HEX("b43136"), HEX("7a5c5c"), HEX("5a465b")}
MewgenicsCD.add_quip(key, "kneel", "loss", 4)
MewgenicsCD.add_quip(key, "obey", "loss", 4)
MewgenicsCD.add_quip(key, "heavy", "loss", 9)
MewgenicsCD.add_quip(key, "hail", "loss", 4)

MewgenicsCD.functions.throb_ranks_to_string = function(ranks)
	if #ranks <= 1 then
		return localize(ranks[1] or "Ace", "ranks")
	else
		return localize({key = "k_mewcd_or", type = "variable", vars = {MewgenicsCD.functions.throb_ranks_to_string({ranks[1]}), MewgenicsCD.functions.throb_ranks_to_string({ranks[2]})}})
	end
end

MewgenicsCD.functions.throb_calculate = function(self, obj, context, data, phase)
	if phase == 1 then
		if context.setting_blind then
			G.GAME.mewcd_throb_hand = pseudorandom_element(data, "b_mewcd_throb_hand")
			return {message = localize(G.GAME.mewcd_throb_hand, 'poker_hands')}
		elseif context.debuff_hand and not next(context.poker_hands[G.GAME.mewcd_throb_hand]) then
			return {
				debuff = true,
				debuff_source = obj,
				debuff_text = localize({key = "k_mewcd_order", type = "variable", vars = {G.GAME.mewcd_throb_hand}})
			}
		end
	else
		if context.setting_blind then
			local chosen_ranks = {}
			G.GAME.mewcd_throb_rank = {}
			for i = 1, data.count do
				local ranks = {}
				for _, card in ipairs(G.playing_cards) do
					if not SMODS.has_no_rank(card) and not G.GAME.mewcd_throb_rank[card.base.value] then
						table.insert(ranks, card.base.value)
					end
				end
				chosen_ranks[i] = pseudorandom_element(ranks, "b_mewcd_throb_rank")
				if not chosen_ranks[i] and i == 1 then
					chosen_ranks[i] = "Ace"
				end
				if chosen_ranks[i] then
					G.GAME.mewcd_throb_rank[chosen_ranks[i]] = true
				end
			end
			G.GAME.mewcd_throb_ranks = chosen_ranks
			return {message = MewgenicsCD.functions.throb_ranks_to_string(chosen_ranks)}
		elseif context.individual and (context.cardarea == G.play or context.cardarea == G.hand) and not context.end_of_round and not SMODS.has_no_rank(context.other_card) and G.GAME.mewcd_throb_rank[context.other_card.base.value] and not context.other_card.debuff then
			return {
				xmult = data.xmult
			}
		end
	end
end

MewgenicsCD.functions.throb_data = function(info, double)
	if G.GAME.round_resets.ante > info.ante then
		return {
			count = double and 2 or 1,
			xmult = info.xmult
		}
	else
		return double and info.hands_double or info.hands_regular
	end
end

local get_old_boss = get_new_boss
function get_new_boss()
	if (G.GAME.selected_back.effect.center.key == "b_mewcd_throb" or G.GAME.selected_sleeve == "sleeve_mewcd_throb") and G.GAME.round_resets.ante == G.GAME.win_ante then
		return "bl_mewcd_throb"
	else
		return get_old_boss()
	end
end

return 8, SMODS.Back, {
	key = key,
	atlas = "mewcd_decks",
	pos = {x = 7, y = 0},
	config = {extra = {
		ante = 6,
		hands_regular = {"Three of a Kind", "Two Pair", "Flush"},
		hands_double = {"Four of a Kind", "Full House", "Straight"},
		xmult = 0.5
	}},
	loc_vars = function(self, info_queue, deck)
		if G.GAME.round_resets.ante > self.config.extra.ante then
			return {vars = {self.config.extra.xmult, MewgenicsCD.functions.throb_ranks_to_string(G.GAME.mewcd_throb_ranks or {})}, key = self.key.."_2"}
		else
			return {vars = {localize(G.GAME.mewcd_throb_hand or self.config.extra.hands_regular[1], "poker_hands"), self.config.extra.ante}}
		end
	end,
	calculate = function(self, deck, context)
		return MewgenicsCD.functions.throb_calculate(self, deck, context, MewgenicsCD.functions.throb_data(self.config.extra, G.GAME.selected_sleeve == "sleeve_mewcd_throb"), G.GAME.round_resets.ante > self.config.extra.ante and 2 or 1)
	end
}
