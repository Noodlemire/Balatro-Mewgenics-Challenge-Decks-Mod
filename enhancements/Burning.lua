--[[
Burning

No rank or suit
Never scores
Explodes immediately
if turned into a Bomb
--]]

local frame_max = 38
local columns = 8
local frame = 1
local delay = 0.05
local timer = delay

local old_game_update = Game.update
function Game:update(dt)
	local ret = old_game_update(self, dt)

	timer = timer - dt
	if timer <= 0 then
		timer = timer + delay
		frame = frame + 1
		if frame > frame_max then
			frame = 1
		end
	end

	return ret
end

return 2, SMODS.Enhancement, {
	key = "burning",
	atlas = "mewcd_enh",
	badge_colour = HEX("ff8529"),
	pos = {x = 0, y = 0},
	no_rank = true,
	no_suit = true,
	never_scores = true,
	replace_base_card = true,
	in_pool = function(self, args)
		return false
	end,
	update = function(self, card, dt)
		local x = (frame - 1) % columns
		local y = math.floor((frame - 1) / columns)
		card.children.center:set_sprite_pos({x = x, y = y})
	end,
}
