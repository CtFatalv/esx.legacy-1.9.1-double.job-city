return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},
    
    ['handcuffs'] = {
      label = 'Handcuffs',
      weight = 100,
      stack = true,
      allowArmed = true
    },
    
    ['menotte'] = {
      label = 'Menotte',
      weight = 100,
      stack = true,
      allowArmed = true
    },

    ['rope'] = {
      label = 'Rope',
      weight = 100,
      stack = true,
      allowArmed = true
    },

	['weed'] = {
		label = 'Weed',
		stack = true,
		weight = 10,
	},

	['weed_pooch'] = {
		label = 'Pochon de weed',
		stack = true,
		weight = 10,
	},

	['coke'] = {
		label = 'Coke',
		stack = true,
		weight = 10,
	},

	['coke_pooch'] = {
		label = 'Pochon de coke',
		stack = true,
		weight = 10,
	},

	['meth'] = {
		label = 'Meth',
		stack = true,
		weight = 10,
	},

	['meth_pooch'] = {
		label = 'Pochon de meth',
		stack = true,
		weight = 10,
	},

	['thermal_charge'] = {
		label = 'Charge Thermique',
		stack = true,
		weight = 10,
	},

	['cash_wad'] = {
		label = 'Liasse de billet',
		stack = true,
		weight = 10,
	},

	['gold_bar'] = {
		label = 'Lingot d\'or',
		stack = true,
		weight = 10,
	},

	['diamant_box'] = {
		label = 'Boite de diamants',
		stack = true,
		weight = 10,
	},

	['id_card'] = {
		label = 'Carte ID',
		stack = true,
		weight = 10,
	},

	['id_card2'] = {
		label = 'Carte ID 2',
		stack = true,
		weight = 10,
	},

	['rasperry'] = {
		label = 'Rasberry PI',
		stack = true,
		weight = 10,
	},

	['jewels'] = {
		label = 'Bijoux',
		stack = true,
		weight = 10,
	},

    -- SHOP PLAYER
    ['shop01'] = {
      label = 'Epicerie N°1',
		stack = false,
		weight = 0,
    },
    
    ['shop02'] = {
      label = 'Epicerie N°2',
		stack = false,
		weight = 0,
    },
    
    ['shop03'] = {
      label = 'Epicerie N°3',
		stack = false,
		weight = 0,
    },
    
    ['shop04'] = {
      label = 'Epicerie N°4',
		stack = false,
		weight = 0,
    },
    
    ['shop05'] = {
      label = 'Epicerie N°5',
		stack = false,
		weight = 0,
    },
    
    ['shop06'] = {
      label = 'Epicerie N°6',
		stack = false,
		weight = 0,
    },
    
    ['shop07'] = {
      label = 'Epicerie N°7',
		stack = false,
		weight = 0,
    },
    
    ['shop08'] = {
      label = 'Epicerie N°8',
		stack = false,
		weight = 0,
    },
    
    ['shop09'] = {
      label = 'Epicerie N°9',
		stack = false,
		weight = 0,
    },
    
    ['shop10'] = {
      label = 'Epicerie N°10',
		stack = false,
		weight = 0,
    },
}
