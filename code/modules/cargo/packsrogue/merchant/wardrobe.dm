
/datum/supply_pack/rogue/wardrobe
	group = "Wardrobe"
	crate_name = "merchant guild's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/*
THIS WHOLE FILE GETS SORTED ALPHABETICALLY IN THE ACTUAL SILVER/GOLDFACE BUT I WENT AHEAD AND TRIED TO MAKE IT
A LITTLE MORE CONSISTENT IN HERE. PLEASE DO YOUR BEST. THANKS.
*/

///////////////
/// HATS!!! //
//////////////

/datum/supply_pack/rogue/wardrobe/hat/witchhat
	name = "Witch-Hunter's Hats"
	cost = 10
	contains = list(
					/obj/item/clothing/head/roguetown/puritan,
					/obj/item/clothing/head/roguetown/puritan,
				)

/datum/supply_pack/rogue/wardrobe/hat/physicianhat
	name = "Physician's Hats"
	cost = 10
	contains = list(
					/obj/item/clothing/head/roguetown/physician,
					/obj/item/clothing/head/roguetown/physician,
				)

/datum/supply_pack/rogue/wardrobe/hat/nightmanhat
	name = "Teller's Hats"
	cost = 10
	contains = list(
					/obj/item/clothing/head/roguetown/nightman,
					/obj/item/clothing/head/roguetown/nightman,
				)

/datum/supply_pack/rogue/wardrobe/hat/bardhat
	name = "Minstrel's Hat"
	cost = 10
	contains = list(
					/obj/item/clothing/head/roguetown/bardhat,
					/obj/item/clothing/head/roguetown/bardhat,
				)

/datum/supply_pack/rogue/wardrobe/hat/keffiyeh
	name = "Keffiyeh"
	cost = 20
	contains = list(
					/obj/item/clothing/head/roguetown/roguehood/shalal,
				)

/datum/supply_pack/rogue/wardrobe/hat/fancyhat
	name = "Fancy Hat"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/fancyhat,
	)

/datum/supply_pack/rogue/wardrobe/hat/furhat
	name = "Fur Hat"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/hatfur,
	)

/datum/supply_pack/rogue/wardrobe/hat/smokingcap
	name = "Smoking Cap"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/smokingcap,
	)

/datum/supply_pack/rogue/wardrobe/hat/headband
	name = "Headband"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/headband,
	)

/datum/supply_pack/rogue/wardrobe/hat/buckled_hat
	name = "Buckled Hat"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/puritan,
	)

/datum/supply_pack/rogue/wardrobe/hat/folded_hat
	name = "Folded Hat"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/bucklehat,
	)

/datum/supply_pack/rogue/wardrobe/hat/duelist_hat
	name = "Duelist's Hat"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/duelhat,
	)

/datum/supply_pack/rogue/wardrobe/hat/hood
	name = "Hood"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/roguehood,
	)

/datum/supply_pack/rogue/wardrobe/hat/hijab
	name = "Hijab"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/roguehood/shalal/hijab,
	)

/datum/supply_pack/rogue/wardrobe/hat/heavyhood
	name = "Heavy Hood"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/roguehood/shalal/heavyhood,
	)

/datum/supply_pack/rogue/wardrobe/hat/nunveil
	name = "Nun Veil"
	cost = 15
	contains = list(
		/obj/item/clothing/head/roguetown/nun,
	)

/datum/supply_pack/rogue/wardrobe/hat/papakha
	name = "Papakha"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/papakha,
	)

/datum/supply_pack/rogue/wardrobe/hat/deserthood
	name = "Papakha"
	cost = 20
	contains = list(
		/obj/item/clothing/head/roguetown/deserthood,
	)

/////////////////////////
/// MASKS & GLASSES!!! //
/////////////////////////


/datum/supply_pack/rogue/wardrobe/masks/specs
	name = "Spectacles"
	cost = 25
	contains = list(
					/obj/item/clothing/mask/rogue/spectacles,
				)

/datum/supply_pack/rogue/wardrobe/masks/goldspecs
	name = "Golden Spectacles"
	cost = 60
	contains = list(
					/obj/item/clothing/mask/rogue/spectacles/golden,
				)

// This is kinda weird and should probably be in the smith's face but I had a specific request for it.
// IDK What category I'd put it under if we did the smithy is the problem.
/datum/supply_pack/rogue/wardrobe/masks/goldmask
	name = "Golden Mask"
	cost = 140 // smiths need to be able 2 be competitive w/ this. It also smelts into gold. Base value 100. If people start using it to exploit, raise price.
	contains = list(
					/obj/item/clothing/mask/rogue/facemask/goldmask
,
				)

//////////////////////////
/// CLOAKS & TABARDS!!! //
//////////////////////////

/datum/supply_pack/rogue/wardrobe/cloaks/tabard
	name = "Tabard"
	cost = 20
	contains = list(
					/obj/item/clothing/cloak/tabard
				)

/datum/supply_pack/rogue/wardrobe/cloaks/surcoat
	name = "Surcoat"
	cost = 20
	contains = list(/obj/item/clothing/cloak/tabard/stabard)

/datum/supply_pack/rogue/wardrobe/cloaks/jupon
	name = "Jupon"
	cost = 20
	contains = list(/obj/item/clothing/cloak/tabard/stabard/surcoat)

/datum/supply_pack/rogue/wardrobe/cloaks/jupon_short
	name = "Short Jupon"
	cost = 20
	contains = list(/obj/item/clothing/cloak/tabard/stabard/surcoat/short)

/datum/supply_pack/rogue/wardrobe/cloaks/halfcloak
	name = "Halfcloak"
	cost = 20
	contains = list(/obj/item/clothing/cloak/half)

/datum/supply_pack/rogue/wardrobe/cloaks/ridercloak
	name = "Ridercloak"
	cost = 20
	contains = list(/obj/item/clothing/cloak/half/rider)

/datum/supply_pack/rogue/wardrobe/cloaks/thief_cloak
	name = "Rapscallion's Shawl"
	cost = 20
	contains = list(/obj/item/clothing/cloak/thief_cloak)

/datum/supply_pack/rogue/wardrobe/cloaks/furcloak
	name = "Fur Cloak"
	cost = 20
	contains = list(/obj/item/clothing/cloak/raincloak/furcloak)

/datum/supply_pack/rogue/wardrobe/cloaks/direbear
	name = "Direbear Cloak"
	cost = 30
	contains = list(/obj/item/clothing/cloak/darkcloak/bear)

/datum/supply_pack/rogue/wardrobe/cloaks/direbear_light
	name = "Light Direbear Cloak"
	cost = 30
	contains = list(/obj/item/clothing/cloak/darkcloak/bear/light)

/datum/supply_pack/rogue/wardrobe/cloaks/poncho
	name = "Poncho"
	cost = 20
	contains = list(/obj/item/clothing/cloak/poncho)

/datum/supply_pack/rogue/wardrobe/cloaks/bcloaks
	name = "Blue Raincloak"
	cost = 20
	contains = list(
					/obj/item/clothing/cloak/raincloak/blue,
				)

/datum/supply_pack/rogue/wardrobe/cloaks/rcloaks
	name = "Red Raincloak"
	cost = 20
	contains = list(
					/obj/item/clothing/cloak/raincloak/red,
				)

/datum/supply_pack/rogue/wardrobe/cloaks/gcloaks
	name = "Green Raincloak"
	cost = 20
	contains = list(
					/obj/item/clothing/cloak/raincloak/green,
				)

/datum/supply_pack/rogue/wardrobe/cloaks/fitted_cloak
	name = "Fitted Cloak"
	cost = 20
	contains = list(
					/obj/item/clothing/cloak/cotehardie,
				)

/////////////////////////////////
/// SUITS & DRESSES & ROBES!!! //
/////////////////////////////////

/datum/supply_pack/rogue/wardrobe/suits/bardress
	name = "Bar Dress"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress
				)

/datum/supply_pack/rogue/wardrobe/suits/blackdress
	name = "Chemise"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/silkdress
				)

/datum/supply_pack/rogue/wardrobe/suits/gown
	name = "Spring Gown"
	cost = 30
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/gown
				)

/datum/supply_pack/rogue/wardrobe/suits/summergown
	name = "Summer Gown"
	cost = 30
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/gown/summergown
				)

/datum/supply_pack/rogue/wardrobe/suits/fallgown
	name = "Fall Gown"
	cost = 30
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/gown/fallgown
				)

/datum/supply_pack/rogue/wardrobe/suits/wintergown
	name = "Winter Gown"
	cost = 30
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/gown/wintergown
				)

/datum/supply_pack/rogue/wardrobe/suits/nunhabit
	name = "Nun Habit"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/robe/nun
				)

/datum/supply_pack/rogue/wardrobe/suits/blackdress
	name = "Black Dresses"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/gen/black,
					/obj/item/clothing/suit/roguetown/shirt/dress/gen/black,
				)

/datum/supply_pack/rogue/wardrobe/suits/bluedress
	name = "Blue Dresses"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/gen/blue,
					/obj/item/clothing/suit/roguetown/shirt/dress/gen/blue,
				)

/datum/supply_pack/rogue/wardrobe/suits/whiterobes
	name = "White Robes"
	cost = 30
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/robe/white,
					/obj/item/clothing/suit/roguetown/shirt/robe/white,
				)

/datum/supply_pack/rogue/wardrobe/suits/magerobes
	name = "Mage Robes Multipack (4 Colours!)"
	cost = 30
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/robe/mageblue,
					/obj/item/clothing/suit/roguetown/shirt/robe/magegreen,
					/obj/item/clothing/suit/roguetown/shirt/robe/mageorange,
					/obj/item/clothing/suit/roguetown/shirt/robe/mageyellow,
				)

/datum/supply_pack/rogue/wardrobe/suits/formal
	name = "Formal Silks"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/undershirt/puritan,
					/obj/item/clothing/suit/roguetown/shirt/undershirt/puritan,
				)

//////////////////////////////////////////////////////////////////////////////
/// SHIRTS BUT ITS KINDA SUITS TOO THEYRE KINDA THE SAME THING SOMETIMES!!! //
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/rogue/wardrobe/shirt/desertbra
	name = "Desert Bra"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/desertbra

				)

/datum/supply_pack/rogue/wardrobe/shirt/undervestements
	name = "Undervestements"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/undershirt/priest

				)

/datum/supply_pack/rogue/wardrobe/shirt/shirt
	name = "Shirt"
	cost = 15
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/undershirt

				)

/datum/supply_pack/rogue/wardrobe/shirt/striped_shirt
	name = "Striped Shirt"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor

				)

/datum/supply_pack/rogue/wardrobe/shirt/lowcut
	name = "Low-Cut Shirt"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut

				)

/datum/supply_pack/rogue/wardrobe/shirt/lowcut
	name = "Tunic"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/tunic

				)

/datum/supply_pack/rogue/wardrobe/shirt/lowcut
	name = "Tunic"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/tunic

				)
		

/datum/supply_pack/rogue/wardrobe/shirt/blackforeignshirt
	name = "Black Foreign Shirt"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt1

				)

/datum/supply_pack/rogue/wardrobe/shirt/whiteforeignshirt
	name = "White Foreign Shirt"
	cost = 20
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt2

				)

//////////////////
/// PANTS!!!!!! //
//////////////////

/datum/supply_pack/rogue/wardrobe/pants/tights
	name = "Cloth Tights"
	cost = 15
	contains = list(
					/obj/item/clothing/under/roguetown/tights/black
				)

/datum/supply_pack/rogue/wardrobe/pants/leather_pants
	name = "Leather Trousers"
	cost = 30
	contains = list(
					/obj/item/clothing/under/roguetown/trou/leather
				)

/datum/supply_pack/rogue/wardrobe/pants/leather_shorts
	name = "Heavy Leather Shorts"
	cost = 35
	contains = list(
					/obj/item/clothing/under/roguetown/heavy_leather_pants/shorts
				)

/datum/supply_pack/rogue/wardrobe/pants/sailor_pants
	name = "Sailor Pants"
	cost = 30
	contains = list(
					/obj/item/clothing/under/roguetown/tights/sailor
				)

/datum/supply_pack/rogue/wardrobe/pants/skirt
	name = "Skirt"
	cost = 20
	contains = list(
					/obj/item/clothing/under/roguetown/skirt
				)

/datum/supply_pack/rogue/wardrobe/pants/desertskirt
	name = "Desert Skirt"
	cost = 20
	contains = list(
					/obj/item/clothing/under/roguetown/skirt/desert
				)

/datum/supply_pack/rogue/wardrobe/pants/formal
	name = "Formal Pants"
	cost = 20
	contains = list(
					/obj/item/clothing/under/roguetown/tights/black,
					/obj/item/clothing/under/roguetown/tights/black,
				)

////////////////////////////
/// SHOES AND BOOTS!!!!!! //
////////////////////////////

/datum/supply_pack/rogue/wardrobe/shoes/noble
	name = "Noble Boots"
	cost = 30
	contains = list(
					/obj/item/clothing/shoes/roguetown/boots/nobleboot,
					/obj/item/clothing/shoes/roguetown/boots/nobleboot,
				)

/datum/supply_pack/rogue/wardrobe/shoes/shalal
	name = "Shalal Shoes"
	cost = 10
	contains = list(
					/obj/item/clothing/shoes/roguetown/shalal,
					/obj/item/clothing/shoes/roguetown/shalal,
				)

/datum/supply_pack/rogue/wardrobe/shoes/sandals
	name = "Sandals"
	cost = 5
	contains = list(
					/obj/item/clothing/shoes/roguetown/gladiator,
					/obj/item/clothing/shoes/roguetown/gladiator,
				)

/datum/supply_pack/rogue/wardrobe/shoes/ridingboots
	name = "Riding Boots"
	cost = 15
	contains = list(
					/obj/item/clothing/shoes/roguetown/ridingboots
				)

/datum/supply_pack/rogue/wardrobe/shoes/clothanklets
	name = "Cloth Anklets"
	cost = 15
	contains = list(
					/obj/item/clothing/shoes/roguetown/boots/clothlinedanklets
				)

/datum/supply_pack/rogue/wardrobe/shoes/furanklets
	name = "Fur Anklets"
	cost = 15
	contains = list(
					/obj/item/clothing/shoes/roguetown/boots/furlinedanklets
				)

/datum/supply_pack/rogue/wardrobe/shoes/darkboots
	name = "Dark Boots"
	cost = 15
	contains = list(
					/obj/item/clothing/shoes/roguetown/boots
				)

////////////////
/// GLOVES!!! //
////////////////

/datum/supply_pack/rogue/wardrobe/gloves/fgloves
	name = "Fingerless Gloves"
	cost = 5
	contains = list(
					/obj/item/clothing/gloves/roguetown/fingerless,
					/obj/item/clothing/gloves/roguetown/fingerless,
				)


////////////////////////////
/// PACKAGES & BUNDLES!!! //
////////////////////////////

// IF A PACKAGE, REMEMBER TO SET no_name_quantity = TRUE

// https://www.youtube.com/watch?v=c8qvo7CfEf0



// The "classic" maid uniform. Just a dress, apron, and black stockings. 
/datum/supply_pack/rogue/wardrobe/suits/maid_pack_shitty
	name = "Cheap Maid Package"
	no_name_quantity = TRUE
	cost = 40
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/black,
					/obj/item/legwears/black,
					/obj/item/clothing/cloak/apron/waist,
				)

// Actual maid clothes.
/datum/supply_pack/rogue/wardrobe/packages/maid_pack
	name = "Aristocratic Maid Package"
	cost = 60
	no_name_quantity = TRUE
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/maid,
					/obj/item/clothing/head/roguetown/maidhead,
					/obj/item/clothing/cloak/apron/waist/maid,
					/obj/item/storage/belt/rogue/leather/sash/maid,
					/obj/item/legwears/black,
				)

// Pls. Pls.
/datum/supply_pack/rogue/wardrobe/packages/maid_pack_supreme
	name = "Grand Maid Package"
	cost = 75
	no_name_quantity = TRUE
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/maid,
					/obj/item/clothing/head/roguetown/maidhead,
					/obj/item/clothing/cloak/apron/waist/maid,
					/obj/item/storage/belt/rogue/leather/sash/maid,
					/obj/item/legwears/black,
					/obj/item/clothing/neck/roguetown/collar/bell_collar // pls. its funny. pls.
				)

// 35 YILS, FREE. 35. YILS.
/datum/supply_pack/rogue/wardrobe/packages/jester_pack
	name = "Aristocratic Jester Supreme Package" // it needs a stupidly long name
	cost = 60
	contains = list(
					/obj/item/clothing/head/roguetown/jester,
					/obj/item/clothing/suit/roguetown/shirt/jester,
					/obj/item/clothing/shoes/roguetown/jester,
				)

///////////////////////////
/// WEIRD SHIT / MISC!!! //
///////////////////////////

/datum/supply_pack/rogue/wardrobe/suits/exoticsilkbra
	name = "Exotic Silk Bra"
	cost = 30
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/exoticsilkbra,
				)

/datum/supply_pack/rogue/wardrobe/suits/anklets
	name = "Exotic Silk Anklets"
	cost = 30
	contains = list(
					/obj/item/clothing/shoes/roguetown/anklets,
				)

/datum/supply_pack/rogue/wardrobe/suits/exoticsilkbelt
	name = "Exotic Silk Belt"
	cost = 30
	contains = list(
					/obj/item/storage/belt/rogue/leather/exoticsilkbelt,
				)

/datum/supply_pack/rogue/wardrobe/suits/exoticsilkmask
	name = "Exotic Silk Mask"
	cost = 30
	contains = list(
					/obj/item/clothing/mask/rogue/exoticsilkmask,
				)

/datum/supply_pack/rogue/wardrobe/caparison/caparison
	name = "Caparison"
	cost = 20
	contains = list(
					/obj/item/caparison,
				)

/datum/supply_pack/rogue/wardrobe/caparison/caparison_psy
	name = "Psydonic Caparison"
	cost = 20
	contains = list(
					/obj/item/caparison/psy,
				)

/datum/supply_pack/rogue/wardrobe/caparison/caparison_astrata
	name = "Astratan Caparison"
	cost = 20
	contains = list(
					/obj/item/caparison/astrata,
				)

/datum/supply_pack/rogue/wardrobe/caparison/caparison_eora
	name = "Eoran Caparison"
	cost = 20
	contains = list(
					/obj/item/caparison/eora
				)

/datum/supply_pack/rogue/wardrobe/collar/collar
	name = "Eoran Caparison"
	cost = 20
	contains = list(
					/obj/item/clothing/neck/roguetown/collar
				)

/datum/supply_pack/rogue/wardrobe/collar/bell_collar
	name = "Bell Collar"
	cost = 20
	contains = list(
					/obj/item/clothing/neck/roguetown/collar/bell_collar
				)

/datum/supply_pack/rogue/wardrobe/collar/cursed_collar
	name = "Cursed Collar"
	cost = 20
	contains = list(
					/obj/item/clothing/neck/roguetown/gorget/cursed_collar
				)

/datum/supply_pack/rogue/wardrobe/collar/forlorn_collar
	name = "Forlorn Collar"
	cost = 20
	contains = list(
					/obj/item/clothing/neck/roguetown/collar/forlorn
				)

/datum/supply_pack/rogue/wardrobe/belt/battleskirt
	name = "Cloth Military Skirt"
	cost = 25
	contains = list(
					/obj/item/storage/belt/rogue/leather/battleskirt
				)

/datum/supply_pack/rogue/wardrobe/belt/battleskirt_faulds
	name = "Belt w/ Faulds"
	cost = 25
	contains = list(
					/obj/item/storage/belt/rogue/leather/battleskirt/faulds
				)
