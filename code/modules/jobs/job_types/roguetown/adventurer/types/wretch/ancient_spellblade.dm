/datum/advclass/wretch/ancient_spellblade
	name = "Unbound Ancient Azurcaephan"
	tutorial = "You were once an Azurcaephan — a Spellblade of the old world. How long you have been dead, you cannot say. Your master is gone. The bond is severed. But the arcyne still flows through your hollow bones, and the Chant still echoes in whatever is left of your mind. You remember your craft. That is enough."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/wretch/ancient_spellblade
	class_select_category = CLASS_CAT_ACCURSED
	category_tags = list(CTAG_WRETCH)
	maximum_possible_slots = 1
	applies_post_equipment = FALSE
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_ARCYNE_T2)
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_WIL = 2,
		STATKEY_CON = 1,
		STATKEY_PER = 1,
		STATKEY_STR = -1,
	 ) // Weighted 5 - Loses str because Int make sense for a caster
	subclass_spell_point_pools = list("utility" = 4)
	subclass_skills = list(
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/magic/arcane = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/wretch/ancient_spellblade
	var/subclass_selected

/datum/outfit/job/roguetown/wretch/ancient_spellblade/Topic(href, href_list)
	. = ..()
	if(href_list["subclass"])
		subclass_selected = href_list["subclass"]
	else if(href_list["close"])
		if(!subclass_selected)
			subclass_selected = "blade"

/datum/outfit/job/roguetown/wretch/ancient_spellblade/pre_equip(mob/living/carbon/human/H)
	..()

	H.become_skeleton()

	H.choose_name_popup("Ancient Azurcaephan")

	H.cmode_music = 'sound/music/combat_cult.ogg'

	// Equipment — black chainmail loadout matching the Unbound Spellblade antagonist
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/black
	pants = /obj/item/clothing/under/roguetown/chainlegs/black
	neck = /obj/item/clothing/neck/roguetown/chaincoif/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	gloves = /obj/item/clothing/gloves/roguetown/chain/black
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine/black
	mask = /obj/item/clothing/mask/rogue/ragmask/black
	backr = /obj/item/rogueweapon/shield/heater
	backl = /obj/item/storage/backpack/rogue/satchel

	// Chant selection — uses undead faction for "MEMORIES" UI
	to_chat(H, span_warning("You start with Bind Weapon. Remember to Bind your weapon so you can use your abilities and build up Arcyne Momentum."))

	subclass_selected = null
	var/selection_html = get_spellblade_chant_html(src, H, "undead")
	H << browse(selection_html, "window=spellblade_chant;size=1300x1000")
	onclose(H, "spellblade_chant", src)

	var/open_time = world.time
	while(!subclass_selected && world.time - open_time < 5 MINUTES)
		stoplag(1)
	H << browse(null, "window=spellblade_chant")

	if(!subclass_selected)
		subclass_selected = "blade"

	var/datum/status_effect/buff/arcyne_momentum/momentum = H.apply_status_effect(/datum/status_effect/buff/arcyne_momentum)
	if(momentum)
		momentum.chant = subclass_selected

	if(H.mind)
		switch(subclass_selected)
			if("blade")
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/caedo)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/air_strike)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/leyline_anchor)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/blade_storm)
			if("phalangite")
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/azurean_phalanx)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/azurean_javelin)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/advance)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/gate_of_reckoning)
			if("macebearer")
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/shatter)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/tremor)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/charge)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/cataclysm)

		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/recall_weapon)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/empower_weapon)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bind_weapon)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mending)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/enchant_weapon)

	H.adjust_blindness(-3)
	var/helmets = list(
		"Pigface Bascinet"	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/black,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard/black,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket/black,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight/black,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored/black,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet/black,
		"Hounskull Bascinet"= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull/black,
		"Etruscan Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan/black,
		"Slitted Kettle"	= /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle/black,
		"None",
	)
	var/helmchoice = input(H, "Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	switch(subclass_selected)
		if("blade")
			var/weapons = list("Khopesh", "Sabre", "Steel Dagger")
			var/weapon_choice = input(H, "Choose your WEAPON.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Khopesh")
					beltr = /obj/item/rogueweapon/sword/sabre/bronzekhopesh
				if("Sabre")
					beltr = /obj/item/rogueweapon/sword/sabre
				if("Steel Dagger")
					beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
			if(weapon_choice == "Steel Dagger")
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
			else
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		if("phalangite")
			var/weapons = list("Spear", "Bardiche")
			var/weapon_choice = input(H, "Choose your WEAPON.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Spear")
					r_hand = /obj/item/rogueweapon/spear
				if("Bardiche")
					r_hand = /obj/item/rogueweapon/halberd/bardiche
					backr = /obj/item/rogueweapon/scabbard/gwstrap
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
		if("macebearer")
			var/weapons = list("Steel Mace", "Steel Warhammer")
			var/weapon_choice = input(H, "Choose your WEAPON.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Steel Mace")
					beltr = /obj/item/rogueweapon/mace/steel
				if("Steel Warhammer")
					beltr = /obj/item/rogueweapon/mace/warhammer/steel
			H.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
	H.set_blindness(0)

	var/tabards = list("Black Tabard", "Black Jupon")
	var/tabard_choice = input(H, "Choose your CLOAK.", "BARE YOUR HERALDRY.") as anything in tabards
	switch(tabard_choice)
		if("Black Jupon")
			cloak = /obj/item/clothing/cloak/tabard/stabard/surcoat/lich
		if("Black Tabard")
			cloak = /obj/item/clothing/cloak/tabard/lich

	// Reorder undead eyes action to the end
	var/obj/item/organ/eyes/existing_eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(existing_eyes)
		existing_eyes.Remove(H, TRUE)
		existing_eyes.Insert(H)

	H.energy = H.max_energy

	to_chat(H, span_danger("You are playing an Antagonist role. Your very existence is an abomination — everyone is justified in laying you down. Failing to play this role with the appropriate gravitas may result in punishment for Low Roleplay standards."))
