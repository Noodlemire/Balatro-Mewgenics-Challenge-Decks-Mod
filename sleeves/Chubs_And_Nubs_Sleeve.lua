--[[
Chubs & Nubs Sleeve

+Chips and +Mult effects only work during
odd and even numbered rounds, respectively
Diamonds and Hearts score +Mult instead of +Chips

Chubs & Nubs Sleeve (Doubled)

XChips and XMult effects work the same way
--]]

MewgenicsCD.deckmusic.sleeve_mewcd_boris = "chumbucketkitty"

return 5, CardSleeves.Sleeve, {
	key = "nubchub",
	atlas = "mewcd_sleeves",
	pos = {x = 4, y = 0},
	loc_vars = function(self, info_queue, deck)
		if self.get_current_deck_key() == "b_mewcd_nubchub" then
			return {key = self.key.."_double"}
		end
	end
}
