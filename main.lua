MewgenicsCD = {
	deckmusic = {},
	functions = {},
	quip_colours = {},
	add_quip = function(center, keyword, play_when, length)
		SMODS.JimboQuip{
			key = center..'_'..keyword,
			type = play_when ~= "any" and play_when or nil,
			extra = {
				center = "b_mewcd_"..center,
				particle_colours = MewgenicsCD.quip_colours[center],
				times = length
			},
			filter = function(self, type)
				if G.GAME.selected_back.effect.center.key == "b_mewcd_"..center then
					return true, {weight = 100}
				end
			end
		}
	end
}

local items = {"blinds", "decks", "enhancements"}
local song_priority = 10

--[[SMODS.current_mod.optional_features = function()
	return {
		post_trigger = true,
		cardareas = {
			discard = true,
			deck = true
		}
	}
end--]]

SMODS.Atlas {
	key = "modicon",
	path = "icon.png",
	px = 33,
	py = 33
}

SMODS.Atlas {
	key = "mewcd_blinds",
	path = "Blinds.png",
	px = 34,
	py = 34,
	atlas_table = "ANIMATION_ATLAS",
	frames = 21
}

SMODS.Atlas {
	key = "mewcd_decks",
	path = "Decks.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	key = "mewcd_enh",
	path = "Enhancements.png",
	px = 71,
	py = 95,
}

if next(SMODS.find_mod("CardSleeves")) then
	SMODS.Atlas {
		key = "mewcd_sleeves",
		path = "Sleeves.png",
		px = 73,
		py = 95,
	}

	table.insert(items, "sleeves")
end

for _, item in ipairs(items) do
	local files = NFS.getDirectoryItems(SMODS.current_mod.path..item)
	local load_order = {}
	for _, filename in pairs(files) do
		if string.sub(filename, string.len(filename) - 3) == '.lua' then
			local i, func, def = assert(SMODS.load_file(item.."/"..filename))()
			load_order[i] = {func = func, def = def}
		end
	end
	for i = 1, #load_order do
		load_order[i].func(load_order[i].def)
	end
end

local sounds = NFS.getDirectoryItems(SMODS.current_mod.path.."assets/sounds")
for _, filename in pairs(sounds) do
	if string.sub(filename, string.len(filename) - 3) == ".ogg" then
		local key = string.sub(filename, 1, string.len(filename) - 4)
		if string.sub(filename, 1, 5) == "music" then
			local parts = string.gmatch(key, "[^_]+")
			local _, title, type = parts(), parts(), parts()
			SMODS.Sound({
				key = key,
				path = filename,
				pitch = 1,
				volume = 1,
				select_music_track = function(self)
					if not G.GAME then return end
					if type == "showdown" and MewgenicsCD.deckmusic[G.GAME.round_resets.blind_choices.Boss] then
						return MewgenicsCD.deckmusic[G.GAME.round_resets.blind_choices.Boss] == title and song_priority * 2
					end
					local deck_music = MewgenicsCD.deckmusic[G.GAME.selected_back.effect.center.key]
					local sleeve_music = MewgenicsCD.deckmusic[G.GAME.selected_sleeve]
					if (deck_music ~= title and sleeve_music ~= title) or ((G.GAME.selected_back.effect.center.original_mod or {}).id == "MewgenicsCD" and deck_music ~= sleeve_music and sleeve_music == title) then return end
					if type == "boss" then
						return G.GAME.blind and G.GAME.blind.in_blind and G.GAME.blind.boss and song_priority
					elseif type == "battle" then
						return G.GAME.blind and G.GAME.blind.in_blind and song_priority - 1
					elseif type == "event" then
						return G.STATE == G.STATES.SMODS_BOOSTER_OPENED and song_priority
					elseif type == "map" then
						return song_priority - 2
					else
						error("Invalid song type: "..type)
					end
				end,
			})
		else
			SMODS.Sound({
				key = key,
				path = filename
			})
		end
	end
end
