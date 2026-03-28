--[[
Bomb

Explodes if held in
hand at end of round
Chain reactions will
explode even harder
Play and score to disarm!
--]]

local already_exploding = false

local function burn_card(card)
	if card then
		if SMODS.has_enhancement(card, "m_mewcd_bomb") then
			local new_cards = {}
			for i = 1, 3 do
				new_cards[i] = SMODS.add_card{set = "Base", enhancement = "m_mewcd_burning", area = G.hand}
				G.GAME.blind:debuff_card(new_cards[i])
				draw_card(G.hand, G.deck, 90, 'up')
			end
			SMODS.calculate_context{playing_card_added = true, cards = new_cards}
			card:start_dissolve()
		else
			card:set_ability("m_mewcd_burning")
			card:juice_up()
			play_sound("tarot1")
		end
	end
end

MewgenicsCD.explode = function(pos, i)
	if not i then
		if already_exploding then return end
		already_exploding = true
		G.hand.cards[pos].getting_sliced = true
		G.E_MANAGER:add_event(Event{
			func = function()
				G.hand.cards[pos]:start_dissolve()
				return true
			end
		})
	else
		local card1, card2 = G.hand.cards[pos+i], G.hand.cards[pos-i]
		if not card1 and not card2 then
			G.E_MANAGER:add_event(Event{
				trigger = "after",
				delay = 0.2,
				func = function()
					already_exploding = false
					return true
				end
			})
			return
		end
		G.E_MANAGER:add_event(Event{
			trigger = "after",
			delay = 0.2,
			func = function()
				burn_card(card1)
				burn_card(card2)
				return true
			end
		})
	end
	MewgenicsCD.explode(pos, (i or 0) + 1)
end

return 1, SMODS.Enhancement, {
	key = "bomb",
	atlas = "mewcd_enh",
	badge_colour = HEX("060404"),
	pos = {x = 6, y = 4},
	in_pool = function(self, args)
		return false
	end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			G.E_MANAGER:add_event(Event{
				func = function()
					card:set_ability("c_base")
					card:juice_up()
					play_sound("tarot1")
					return true
				end
			})
		elseif context.end_of_round and context.cardarea == G.hand and not context.game_over and not card.getting_sliced then
			for pos, othercard in ipairs(G.hand.cards) do
				if card == othercard then
					MewgenicsCD.explode(pos)
					return
				end
			end
		end
	end,
}
