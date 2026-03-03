/obj/effect/proc_holder/spell/invoked/projectile/fireball
	name = "Fireball"
	desc = "Shoot out a ball of fire that emits a light explosion on impact, setting the target alight. Consumes <b>Arcane Marks</b> for extra damage.\n\
	Can be fired in an arc over obstacles by toggling throw mode (R) before casting. Arced fireballs deal 25% less damage."
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/aoe/fireball/rogue
	overlay_state = "fireball"
	sound = list('sound/magic/fireball.ogg')
	releasedrain = 30
	chargedrain = 1
	chargetime = 15
	recharge_time = 15 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	spell_tier = 3 // AOE
	invocations = list("Sphaera Ignis!")
	invocation_type = "shout"
	glow_color = GLOW_COLOR_FIRE
	glow_intensity = GLOW_INTENSITY_HIGH
	chargedloop = /datum/looping_sound/invokefire
	associated_skill = /datum/skill/magic/arcane
	cost = 6
	xp_gain = TRUE

/obj/effect/proc_holder/spell/invoked/projectile/fireball/cast(list/targets, mob/user = user)
	var/mob/living/carbon/human/H = user
	if(H.in_throw_mode)
		projectile_type = /obj/projectile/magic/aoe/fireball/rogue/arc
		H.throw_mode_off()
	else
		projectile_type = /obj/projectile/magic/aoe/fireball/rogue
	. = ..()

/obj/projectile/magic/aoe/fireball/rogue
	name = "fireball"
	exp_heavy = -1
	exp_light = -1
	exp_flash = 0
	exp_fire = 1
	damage = 50
	damage_type = BURN
	npc_simple_damage_mult = 2.4 // 1 shotting crawlers is cool. intentionally different from other fireballs due to arcyne mark disparity
	accuracy = 40 // Base accuracy is lower for burn projectiles because they bypass armor
	nodamage = FALSE
	flag = "magic"
	hitsound = 'sound/blank.ogg'
	aoe_range = 0

/obj/projectile/magic/aoe/fireball/rogue/arc
	name = "Arced Fireball"
	damage = 40 // 25% damage penalty
	arcshot = TRUE

/obj/projectile/magic/aoe/fireball/rogue/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/living/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] fizzles on contact with [target]!"))
			playsound(get_turf(target), 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK
		var/mark_stacks = consume_arcane_mark_stacks(M)
		if(mark_stacks)
			M.apply_damage((mark_stacks*15), BURN) //hey fuck you dude
		if(mark_stacks == 3)
			to_chat(M, "<span class='userdanger'>SCALDING HELLFIRE; TRYPTICH-MARKE DETONATION!</span>")
		M.adjust_fire_stacks(2)
