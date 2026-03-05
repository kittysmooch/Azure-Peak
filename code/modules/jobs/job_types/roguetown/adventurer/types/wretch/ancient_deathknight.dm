/datum/advclass/wretch/ancient_deathknight
	name = "Unbound Ancient Death Knight"
	tutorial = "You were once a Death Knight — a revenant warrior bound to a master's will. How long you have been dead, you cannot say. Your master is gone. You have no orders. You have no goal. But you are awake, clad in black iron, with the strength of the grave coursing through your bones. Why do you fight? You do not know. But fight you shall."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/wretch/ancient_deathknight
	class_select_category = CLASS_CAT_ACCURSED
	category_tags = list(CTAG_WRETCH)
	maximum_possible_slots = 2 // Two so that the gimmick isn't overdon
	applies_post_equipment = TRUE
	traits_applied = list(TRAIT_HEAVYARMOR)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 2,
		STATKEY_WIL = 1,
		STATKEY_INT = -2, // Weighted 5. Skeleton weakness but not too extreme.
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/roguetown/wretch/ancient_deathknight/pre_equip(mob/living/carbon/human/H)
	..()

	H.become_skeleton()

	H.choose_name_popup("Unbound Ancient Death Knight")

	H.cmode_music = 'sound/music/combat_cult.ogg'

	beltl = /obj/item/rogueweapon/scabbard/sword
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/platelegs/blkknight/death
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/blkknight/death
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	armor = /obj/item/clothing/suit/roguetown/armor/plate/blkknight/death
	gloves = /obj/item/clothing/gloves/roguetown/plate/blkknight/death
	backr = /obj/item/storage/backpack/rogue/satchel/black

	H.adjust_blindness(-3)

	var/helmets = list(
		"Pigface Bascinet"	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/black,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard/black,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff/black,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket/black,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight/black,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored/black,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet/black,
		"Hounskull Bascinet"= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull/black,
		"Etruscan Bascinet"	= /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan/black,
		"Slitted Kettle"	= /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle/black,
	)
	var/helmchoice = input(H, "Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in list("Longsword", "Ancient Warhammer", "Halberd")
	switch(weapon_choice)
		if("Longsword")
			beltl = /obj/item/rogueweapon/scabbard/sword
			l_hand = /obj/item/rogueweapon/sword/long/death
			backl = /obj/item/rogueweapon/shield/tower/metal/palloy
			H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Ancient Warhammer")
			beltr = /obj/item/rogueweapon/mace/warhammer/steel/paalloy
			backl = /obj/item/rogueweapon/shield/tower/metal/palloy
			H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		if("Halberd")
			backl = /obj/item/rogueweapon/scabbard/gwstrap
			r_hand = /obj/item/rogueweapon/halberd
			H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)

	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/corroded = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
	)
	H.set_blindness(0)

	to_chat(H, span_danger("You are playing an Antagonist role. Your very existence is an abomination — everyone is justified in laying you down. You are an ancient warrior risen from death, not a comedic skeleton. Having fun with your character is encouraged, but do not use the role to grief or disregard the setting — play it with gravitas and create memorable moments. Failure to maintain High Roleplay standards may result in punishment."))
