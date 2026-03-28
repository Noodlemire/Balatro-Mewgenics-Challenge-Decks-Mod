return {
	descriptions = {
		Back = {
			b_mewcd_pebbles = {
				name = "Pebbles Deck",
				text = {
					"Once per {C:attention}Ante{}:",
					"If your total score is",
					"above {C:green}#1#%{} of the {C:attention}Blind{}'s",
					"goal without beating it,",
					"{C:mult}destroy{} rightmost {C:attention}Joker"
				}
			},
			b_mewcd_radrat = {
				name = "Radical Rat Deck",
				text = {
					"Each round, one random",
					"card in the first drawn",
					"hand will turn into a {C:attention}Bomb"
				}
			},
			b_mewcd_hippo = {
				name = "Queen Hippo Deck",
				text = {
					"{X:mult,C:white}X#1#{} Mult during {C:attention}Boss Blinds",
					"Gains {X:mult,C:white}X#2#{} per hand played",
					"{C:attention}Resets{} at end of round"
				}
			},
			b_mewcd_boris = {
				name = "Boris Deck",
				text = {
					"If {C:attention}Blind{} is defeated by more",
					"than {C:mult}X#1#{} the requirement,",
					"{C:attention}Ante Scaling{} increases by {X:attention,C:white}X#2#",
					"{C:inactive}(Currently {X:attention,C:white}X#3#{C:inactive})"
				}
			},
			b_mewcd_nubchub = {
				name = "Chubs & Nubs Deck",
				text = {
					"{C:chips}+Chips{} and {C:mult}+Mult{} effects only",
					"work during {C:chips}odd{} and {C:mult}even",
					"numbered rounds, respectively",
					"{C:diamonds}Diamonds{} and {C:hearts}Hearts{} score",
					"{C:mult}+Mult{} instead of {C:chips}+Chips{}"
				}
			},
			b_mewcd_spider = {
				name = "Spinarette Deck",
				text = {
					"After first {C:attention}Ante{}, one",
					"random card in each drawn",
					"hand will be {C:attention}Infested"
				}
			},
			b_mewcd_dybbuk = {
				name = "Dybbuk Deck",
				text = {
					"Beating a {C:attention}Boss Blind",
					"makes one random {C:attention}Joker",
					"gain {C:dark_edition}Negative{}, {C:purple}Eternal{},",
					"and {C:red}-X1 to any values",
				}
			},
			b_mewcd_throb = {
				name = "Throbbing King Deck",
				text = {
					"Played hand must contain",
					"a {C:attention}#1#{}!",
					"Hand changes each round",
					"Second phase after Ante {C:attention}#2#",
				}
			},
			b_mewcd_throb_2 = {
				name = "Throbbing King Deck",
				text = {
					"Causes {X:mult,C:white}X#1#{} mult when",
					"cards of rank {C:attention}#2#{} are",
					"scored or held in hand",
					"Rank changes each round",
				}
			},
		},
		Blind = {
			bl_mewcd_obs = {
				name = "One Baby Spider",
				text = {
					"Please don't hurt me!"
				}
			},
			bl_mewcd_throb = {
				name = "Throbbing King",
				text = {
					"Becomes {X:mult,C:white}X#1#{} stronger",
					"with each card moved",
					"to your {C:attention}discard pile"
				}
			},
			bl_mewcd_tina = {
				name = "Guillotina",
				text = {
					"Debuffs one of your better",
					"jokers until you reach {C:attention}#1#%",
					"of the score requirement"
				}
			},
		},
		Enhanced = {
			m_mewcd_bomb = {
				name = "Bomb Card",
				text = {
					"{C:mult}Explodes{} if held in",
					"hand at end of round",
					"Chain reactions will",
					"explode even harder!",
					"Play and score to {C:green}disarm"
				}
			},
			m_mewcd_burning = {
				name = "Burning Card",
				text = {
					"No rank or suit",
					"Never scores",
					"Explodes {C:mult}immediately",
					"if turned into a {C:attention}Bomb"
				}
			},
			m_mewcd_infested = {
				name = "Infested Card",
				text = {
					"Turns into {C:attention}3 {C:mult}Spider",
					"{C:mult}Cards{} when discarded"
				}
			},
			m_mewcd_spider = {
				name = "Spider Card",
				text = {
					"No rank or suit",
					"Play to destroy"
				}
			},
		},
		Sleeve = {
			sleeve_mewcd_pebbles = {
				name = "Pebbles Sleeve",
				text = {
					"Once per {C:attention}Ante{}: If your total score is",
					"above {C:green}#1#%{} of the {C:attention}Blind{}'s goal without",
					"beating it, {C:mult}destroy{} rightmost {C:attention}Joker"
				}
			},
			sleeve_mewcd_pebbles_double = {
				name = "Pebbles Sleeve",
				text = {
					"The threshold is {C:green}#1#%{} instead"
				}
			},
			sleeve_mewcd_radrat = {
				name = "Radical Rat Sleeve",
				text = {
					"Each round, one random card in the",
					"first drawn hand will turn into a {C:attention}Bomb"
				}
			},
			sleeve_mewcd_radrat_double = {
				name = "Radical Rat Sleeve",
				text = {
					"An extra card becomes a {C:attention}Bomb{} each round"
				}
			},
			sleeve_mewcd_hippo = {
				name = "Queen Hippo Sleeve",
				text = {
					"{X:mult,C:white}X#1#{} Mult during {C:attention}Boss Blinds{}. Gains {X:mult,C:white}X#2#{}",
					"per hand played. {C:attention}Resets{} at end of round"
				}
			},
			sleeve_mewcd_hippo_double = {
				name = "Queen Hippo Sleeve",
				text = {
					"Starts from {X:mult,C:white}X#1#{} Mult instead"
				}
			},
			sleeve_mewcd_boris = {
				name = "Boris Sleeve",
				text = {
					"If {C:attention}Blind{} is defeated by more than {C:mult}X#1#{} the",
					"requirement, {C:attention}Ante Scaling{} increases by {X:attention,C:white}X#2#",
					"{C:inactive}(Currently {X:attention,C:white}X#3#{C:inactive})"
				}
			},
			sleeve_mewcd_boris_double = {
				name = "Boris Sleeve",
				text = {
					"The threshold is {C:mult}X#1#{} instead"
				}
			},
			sleeve_mewcd_nubchub = {
				name = "Chubs & Nubs Sleeve",
				text = {
					"{C:chips}+Chips{} and {C:mult}+Mult{} effects only work during",
					"{C:chips}odd{} and {C:mult}even{} numbered rounds, respectively",
					"{C:diamonds}Diamonds{} and {C:hearts}Hearts{} score {C:mult}+Mult{} instead of {C:chips}+Chips{}"
				}
			},
			sleeve_mewcd_nubchub_double = {
				name = "Chubs & Nubs Sleeve",
				text = {
					"{X:chips,C:white}XChips{} and {X:mult,C:white}XMult{} effects work the same way"
				}
			},
			sleeve_mewcd_spider = {
				name = "Spinarette Sleeve",
				text = {
					"After first {C:attention}Ante{}, one random card",
					"in each drawn hand will be {C:attention}Infested"
				}
			},
			sleeve_mewcd_spider_double = {
				name = "Spinarette Sleeve",
				text = {
					"Doubles {C:attention}Infestation{} rate"
				}
			},
			sleeve_mewcd_dybbuk = {
				name = "Dybbuk Sleeve",
				text = {
					"Beating a {C:attention}Boss Blind{} makes one random {C:attention}Joker",
					"gain {C:dark_edition}Negative{}, {C:purple}Eternal{}, and {C:red}-X1 to any values",
				}
			},
			sleeve_mewcd_dybbuk_double = {
				name = "Dybbuk Sleeve",
				text = {
					"If this would select a {C:attention}Joker{} that lacks values",
					"that can be inverted, it will be {C:mult}destroyed{} instead.",
				}
			},
			sleeve_mewcd_throb = {
				name = "Throbbing King Sleeve",
				text = {
					"Played hand must contain a {C:attention}#1#{}!",
					"Hand changes each round",
					"Second phase after Ante {C:attention}#2#",
				}
			},
			sleeve_mewcd_throb_double = {
				name = "Throbbing King Sleeve",
				text = {
					"Chooses significantly harder hands",
				}
			},
			sleeve_mewcd_throb_2 = {
				name = "Throbbing King Sleeve",
				text = {
					"Causes {X:mult,C:white}X#1#{} mult when cards of",
					"rank {C:attention}#2#{} are scored or held in hand",
					"Rank changes each round",
				}
			},
			sleeve_mewcd_throb_2_double = {
				name = "Throbbing King Sleeve",
				text = {
					"Chooses an additional rank each round",
				}
			},
		},
		Other = {
			card_mult = {
				text = {
					"{C:mult}+#1#{} mult",
				},
			},
		}
	},
	misc = {
		quips = {
			mewcd_pebbles_rocked = {
				"You’re gonna get rocked!"
			},
			mewcd_pebbles_world = {
				"I'm gonna rock your world!"
			},
			mewcd_pebbles_boulder = {
				"Boulder Drop!"
			},
			mewcd_radrat_dynamite = {
				"Boom goes the dynamite!"
			},
			mewcd_radrat_undefeatable = {
				"My bombs are undefeatable!",
				"Well, unless you defeat them."
			},
			mewcd_radrat_napalm = {
				"I love the smell of",
				"napalm in the morning!"
			},
			mewcd_radrat_glasses = {
				"Like my glasses?",
				"They are vintage."
			},
			mewcd_hippo_eating = {
				"I feel like eating.",
				"Time for lunch!",
				"Ha Ha Ha!"
			},
			mewcd_hippo_weaknesses = {
				"I have my weaknesses.",
				"But you won't find them!",
				"Ha Ha Ha!"
			},
			mewcd_hippo_queen = {
				"Ha Ha Ha!",
				"I'm the Queen!",
				"Ha Ha Ha!"
			},
			mewcd_hippo_nipple = {
				"My missing nipple?",
				"Guess I got hungry!",
				"Ha Ha Ha!"
			},
			mewcd_boris_blub = {
				"Blub blub"
			},
			mewcd_boris_glub = {
				"Glub glub"
			},
			mewcd_boris_fart = {
				"Snort... fart"
			},
			mewcd_boris_grumble = {
				"Grumble grumble"
			},
			mewcd_nubchub_borkruff = {
				"{C:purple}Bork bork",
				"{C:green}Ruff roff",
			},
			mewcd_nubchub_arfyiff = {
				"{C:purple}Arf gorf!",
				"{C:green}Yiff yiff!",
			},
			mewcd_nubchub_coughhorf = {
				"{C:purple}Cough sputter",
				"{C:green}Horf!",
			},
			mewcd_nubchub_rooofgurgle = {
				"{C:purple}Rooof blurp!",
				"{C:green}Gurgle...",
			},
			mewcd_spider_delicious = {
				"You look delicious.",
			},
			mewcd_spider_brood = {
				"Your blood will nourish my brood!",
			},
			mewcd_spider_angry = {
				"Mother is angry...",
			},
			mewcd_spider_watching = {
				"Mother is watching you...",
			},
			mewcd_dybbuk_spoil = {
				"Time to spoil those good looks!"
			},
			mewcd_dybbuk_inside = {
				"I can't wait to see what",
				"you look like from the inside!"
			},
			mewcd_dybbuk_touch = {
				"Can't touch this!"
			},
			mewcd_dybbuk_death = {
				"Not even Death can catch me!"
			},
			mewcd_throb_kneel = {
				"KNEEL BEFORE ME!",
			},
			mewcd_throb_obey = {
				"OBEY YOUR KING!",
			},
			mewcd_throb_heavy = {
				"HEAVY IS THE HEAD",
				"THAT WEARS THE CROWN!"
			},
			mewcd_throb_hail = {
				"HAIL TO THE KING!"
			}
		},
		dictionary = {
			k_mewcd_boulder_drop = "Boulder Drop!",
			k_mewcd_hehehe = "He he he!",
			k_mewcd_yum = "Yum!"
		},
		v_dictionary = {
			k_mewcd_order = "Hand must contain a #1#!",
			k_mewcd_or = "#1# or #2#" 
		}
	}
}
