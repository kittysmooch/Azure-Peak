
/mob/living/simple_animal/hostile/retaliate/rogue/werewolf_npc
	name = "WEREWOLF"
	desc = "THE HOWL OF A MAD GOD SHAKES YOUR BONES! FLESH SHORN INTO VISCERA SPRAYS THE WALLS! RIP AND TEAR!"
	icon = 'icons/roguetown/mob/monster/werewolf.dmi'
	icon_state = "wwolf_m"
	icon_living = "wwolf_m"
	icon_dead = "wwolf_dead"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 3
	see_in_dark = 6
	move_to_delay = 3
	base_intents = list(/datum/intent/simple/claw/simplewwnpc)
	head_butcher = /obj/item/natural/head/volf
	faction = list("wolfs", "zombie")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 333
	maxHealth = 333
	melee_damage_lower = 19
	melee_damage_upper = 29
	obj_damage = 20
	vision_range = 7
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = BLADEWOOSH_LARGE
	dextrous = TRUE
	retreat_distance = 0
	minimum_distance = 0
	robust_searching = TRUE
	food_type = list(/obj/item/reagent_containers/food/snacks,
					//obj/item/bodypart,
					//obj/item/organ,
					/obj/item/natural/bone,
					/obj/item/natural/hide)
	footstep_type = FOOTSTEP_MOB_HEAVY
	STACON = 20
	STASTR = 20
	STAWIL = 20
	STASPD = 20
	simple_detect_bonus = 20
	food = 0
	attack_sound = list('sound/vo/mobs/vw/attack (1).ogg','sound/vo/mobs/vw/attack (2).ogg','sound/vo/mobs/vw/attack (3).ogg','sound/vo/mobs/vw/attack (4).ogg')
	dodgetime = 30
	aggressive = 1
	eat_forever = TRUE
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak/wolf = 1, /obj/item/alch/viscera = 1, /obj/item/alch/sinew = 1, /obj/item/natural/bone = 2)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak/wolf = 2,
						/obj/item/natural/hide = 2,
						/obj/item/alch/sinew = 2,
						/obj/item/alch/bone = 1,
						/obj/item/alch/viscera = 1,
						/obj/item/natural/fur/wolf = 1,
						/obj/item/natural/bone = 3)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak/wolf = 2,
						/obj/item/natural/hide = 2,
						/obj/item/alch/sinew = 2,
						/obj/item/alch/bone = 1,
						/obj/item/alch/viscera = 1,
						/obj/item/natural/fur/wolf = 2,
						/obj/item/natural/bone = 4)

/mob/living/simple_animal/hostile/retaliate/rogue/werewolf_npc/Initialize()
	. = ..()
	regenerate_icons()
	ADD_TRAIT(src, TRAIT_SIMPLE_WOUNDS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_SILVER_WEAK, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/werewolf_npc/f
	icon_state = "wwolf_f"
	icon_living = "wwolf_f"
	gender = FEMALE

/mob/living/simple_animal/hostile/retaliate/rogue/werewolf_npc/f/Initialize()
	. = ..()
	regenerate_icons()
	regenerate_icons()
	ADD_TRAIT(src, TRAIT_SIMPLE_WOUNDS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_SILVER_WEAK, TRAIT_GENERIC)
