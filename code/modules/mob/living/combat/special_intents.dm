/*

-- AOE INTENTS --
They're meant to be kept on the weapon and used via Strong stance's rclick.
At the moment the pattern is manually designated using coordinates in tile_coordinates.
This allows the devs to draw whatever shape they want at the cost of it feeling a little quirky.
*/
/datum/special_intent
	var/name = "special intent"
	var/desc = "desc"
	var/mob/living/carbon/human/howner
	var/obj/item/iparent

	/// The main place where we can draw out the pattern. Every tile entry is a list with two numbers.
	/// The origin (0,0) is one step forward from the dir the owner is facing.
	/// This is abstract, and can be modified, though it's best be done before _draw_grid().
	var/list/tile_coordinates

	/// The list of turfs the grid will be drawn on and 
	var/list/affected_turfs

	/// Whether to have the howner pass through a doafter for the delay rather than it being on every turf.
	/// Default code here does not allow for dir switching during the do after.
	var/use_doafter = FALSE

	/// Whether the special uses the target atom that was clicked on. Generally best reserved to be a turf.
	/// This WILL change how the grid is drawn, as the 'origin' will become the clicked-on turf.
	var/use_clickloc = FALSE

	/// Whether the grid pattern will rotate with the howner's dir. Set to FALSE if you want to keep the grid
	/// In a static, consistent pattern regardless of how / where it's deployed.
	var/respect_dir = TRUE

	/// The target turf ref if we use_clickloc.
	var/turf/click_loc 

	var/cooldown = 30 SECONDS

	///The delay for either the doafter or the timers on the turfs before calling post_delay() and apply_hit()
	var/delay = 1 SECONDS

	///The amount of time the post-delay effect is meant to linger.
	var/fade_delay = 0.5 SECONDS

	///Whether we'll check if our howner is adjacent to any of the tiles post-delay. 
	///This is to prevent drop-and-run effect as if it was a spell.
	var/respect_adjacency = TRUE

	var/sfx_pre_delay
	var/sfx_post_delay

	var/_icon = 'icons/effects/effects.dmi'
	var/pre_icon_state = "blip"
	var/post_icon_state = "strike"

///Called by external sources -- likely an rclick. By default the 'target' will be stored as a turf.
/datum/special_intent/proc/deploy(mob/living/user, obj/item/weapon, atom/target)
	if(!ishuman(user))
		CRASH("Special intent called from a non-human parent.")
	if(!isitem(weapon))
		CRASH("Special intent called without a valid item.")
	howner = user
	iparent = weapon
	if(use_clickloc)
		if(isturf(target))
			click_loc = target
		else
			click_loc = get_turf(target)
		if(!click_loc)
			CRASH("Special intent with clickloc called on something that has no valid turf. Potentially used at the map's edge?")
	process_attack()

///Main pipeline. Note that _delay() calls post_delay() after a timer.
/datum/special_intent/proc/process_attack()
	SHOULD_CALL_PARENT(TRUE)
	_clear_grid()
	_create_grid()
	on_create()
	_draw_grid()
	pre_delay()
	_delay()

/datum/special_intent/proc/_clear_grid()
	if(length(affected_turfs))
		LAZYCLEARLIST(affected_turfs)

///Gathers up the grid from tile_coordinates and puts the turfs into affected_turfs. Does not draw anything, yet.
/datum/special_intent/proc/_create_grid()
	var/turf/origin = use_clickloc ? click_loc : (get_step(get_turf(howner), howner.dir))	//Origin is either target or 1 step in the dir of howner.
	for(var/list/l in tile_coordinates)
		var/dx = l[1]
		var/dy = l[2]
		if(respect_dir)
			switch(howner.dir)
				//if(NORTH) Do nothing because the coords are meant to be written from north-facing perspective. All is well.
				if(SOUTH)
					dx = -dx
					dy = -dy
				if(WEST)
					var/holder = dx
					dx = -dy
					dy = holder
				if(EAST)
					var/holder = dx
					dx = dy
					dy = -holder
		var/turf/step = locate((origin.x + dx), (origin.y + dy), origin.z)
		if(step && isturf(step) && !step.density)
			LAZYADD(affected_turfs, step)

///Draws the grid. Under some circumstances this can result in nothing being drawn.
/datum/special_intent/proc/_draw_grid()
	if(!length(affected_turfs))	//Nothing to draw, but technically possible without being an error.
		return
	for(var/turf/T in affected_turfs)
		var/obj/effect/temp_visual/fx = new (T, delay)
		fx.icon = _icon
		fx.icon_state = pre_icon_state

///Called after the affected_turfs list is populated, but before the grid is drawn.
/datum/special_intent/proc/on_create()

///Called after the grid has been drawn on every affected_turfs entry. The delay has not been initiated yet.
/datum/special_intent/proc/pre_delay()
	SHOULD_CALL_PARENT(TRUE)
	if(sfx_pre_delay)
		playsound(howner, sfx_pre_delay, 100, TRUE)

///Delay proc. Preferably it won't be hooked into.
/datum/special_intent/proc/_delay()
	if(use_doafter)
		if(_try_doafter())
			post_delay()
	else
		addtimer(CALLBACK(src, PROC_REF(post_delay)), delay)

/datum/special_intent/proc/_try_doafter()
	if(do_after(howner, delay, same_direction = TRUE))
		return TRUE
	else
		to_chat(howner, span_warning("I was interrupted!"))
		apply_cooldown()
		return FALSE

/// This is called immediately after the delay of the intent.
/// It performs any needed adjacency checks and will try to draw the "post" visuals on any valid turfs.
/// It calls apply_hit() after where most of the logic for any on-hit effects should go.
/datum/special_intent/proc/post_delay()
	SHOULD_CALL_PARENT(TRUE)
	if(respect_adjacency)
		var/is_adjacent = FALSE
		for(var/turf/T in affected_turfs)
			if(howner.Adjacent(T))
				is_adjacent = TRUE
				break
		if(!is_adjacent)
			to_chat(howner, span_danger("I moved too far from my maneuvre!"))
			apply_cooldown()
			return
	if(post_icon_state)
		for(var/turf/T in affected_turfs)
			var/obj/effect/temp_visual/fx = new /obj/effect/temp_visual(T, fade_delay)
			fx.icon = _icon
			fx.icon_state = post_icon_state
	if(sfx_post_delay)
		playsound(howner, sfx_post_delay, 100, TRUE)

	apply_hit()
	
/// Main proc where stuff should happen. This is called immediately after the post_delay of the intent.
/datum/special_intent/proc/apply_hit()
	SHOULD_CALL_PARENT(TRUE)
	apply_cooldown()

/// This is called by post_delay() and _try_doafter() if the doafter fails.
/// If you dynamically tweak the cooldown remember that it will /stay/ that way on this datum without
/// refreshing it with Initial() somewhere.
/datum/special_intent/proc/apply_cooldown()
	howner.apply_status_effect(/datum/status_effect/debuff/specialcd, cooldown)

/datum/special_intent/side_sweep
	name = "Side Sweep"
	desc = "Swings at your primary flank in a distracting fashion. Anyone caught in it will be exposed for a short while."
	tile_coordinates = list(list(0,0), list(1,0), list(1,-1))	//L shape that hugs our flank.
	post_icon_state = "emote"
	sfx_post_delay = 'sound/combat/sidesweep_hit.ogg'
	delay = 1 SECONDS
	cooldown = 20 SECONDS
	var/eff_dur = 2 SECONDS
	

/datum/special_intent/side_sweep/process_attack()
	if(howner.used_hand == 1)	//Left hand. We mirror the pattern.
		tile_coordinates = list(list(0,0), list(-1,0), list(-1,-1))
	else
		tile_coordinates = initial(tile_coordinates)
	..()

/datum/special_intent/side_sweep/apply_hit()
	for(var/mob/living/L in get_hearers_in_view(world.view, howner))
		if(get_turf(L) in affected_turfs)
			L.apply_status_effect(/datum/status_effect/debuff/exposed, eff_dur)
	..()

/datum/special_intent/shin_swipe
	name = "Shin Swipe"
	desc = "A hasty attack at the legs, extending ourselves. Slows down the opponent if hit."
	tile_coordinates = list(list(0,0), list(0,1))
	post_icon_state = "emote"
	pre_icon_state = "blip"
	sfx_post_delay = 'sound/combat/shin_swipe.ogg'
	delay = 1 SECONDS
	cooldown = 15 SECONDS
	var/eff_dur = 4	//We do NOT want to use SECONDS macro here.

/datum/special_intent/side_sweep/apply_hit()
	for(var/mob/living/L in get_hearers_in_view(world.view, howner))
		if(get_turf(L) in affected_turfs)
			L.Slowdown(eff_dur)
	..()

/*/datum/special_intent/mage_cast
	name = "Mage Cast"
	desc = "A hasty attack at the legs, extending ourselves. Slows down the opponent if hit."
	tile_coordinates = list(list(1,1), list(-1,1), list(-1,-1), list(1,-1),list(0,0))
	use_clickloc = TRUE
	respect_adjacency = FALSE
	respect_dir = FALSE
	pre_icon_state = "chronofield"
	post_icon_state = "at_shield2"
	sfx_post_delay = 'sound/magic/repulse.ogg'
	delay = 1 SECONDS
	cooldown = 2 SECONDS */
