--[[
Guillotina

Debuffs one of your better
jokers until you reach 50%
of the score requirement
--]]

MewgenicsCD.deckmusic.bl_mewcd_tina = "vsguillotina"

local requirement = 50

return 3, SMODS.Blind, {
	key = "tina",
	atlas = "mewcd_blinds",
	pos = {y = 2},
	boss = {showdown = true},
	boss_colour = HEX("4f6367"),
	loc_vars = function(self)
		return {vars = {requirement}}
	end,
	vars = {requirement},
	calculate = function(self, blind, context)
		if context.setting_blind then
			local jokers = {}
			local highest_rarity = 0
			local highest_sell = -999999
			for _, joker in ipairs(G.jokers.cards) do
				if not joker.debuff then
					local rarity = type(joker.config.center.rarity) == "number" and joker.config.center.rarity or highest_rarity
					local sell = joker.sell_cost
					if rarity > highest_rarity or (rarity == highest_rarity and sell > highest_sell) then
						jokers = {joker}
						highest_rarity = rarity
						highest_sell = sell
					elseif rarity == highest_rarity and sell == highest_sell then
						table.insert(jokers, joker)
					end
				end
			end
			local joker = pseudorandom_element(jokers, "bl_mewcd_tina")
			if joker then
				joker.ability.bl_mewcd_tina_vored = true
				joker:set_debuff(true)
				joker:juice_up()
				blind:wiggle()
			end
		elseif context.after and G.GAME.chips + SMODS.calculate_round_score() > G.GAME.blind.chips * requirement/100 then
			G.E_MANAGER:add_event(Event{
				func = function()
					local unvored = false
					for _, joker in ipairs(G.jokers.cards) do
						if joker.ability.bl_mewcd_tina_vored then
							joker.ability.bl_mewcd_tina_vored = nil
							joker:set_debuff(false)
							joker:juice_up()
							unvored = true
						end
					end
					if unvored then
						blind:wiggle()
					end
					return true
				end
			})
		end
	end
}
