#define GNOLL_SCALING_RANDOM  0 // Mode 0: Default behavior, pick a random mode.
#define GNOLL_SCALING_DYNAMIC 1 // Mode 1: Guaranteed increase until 3 slots, diminishing chances until 10 slots
#define GNOLL_SCALING_FLAT    2 // Mode 2: 15% chance, capped at 2 slots
#define GNOLL_SCALING_SINGLE  3 // Mode 3: Single gnoll. We do nothing in code because this is the default.

GLOBAL_VAR_INIT(gnoll_scaling_mode, 0)
GLOBAL_VAR_INIT(gnoll_playercount_lock, TRUE)
GLOBAL_VAR_INIT(desired_gnoll_slots, 1)

/proc/unlock_gnoll_scaling()
	var/players_amt = get_active_player_count(alive_check = 1, afk_check = 1, human_check = 1)
	if(players_amt < 25)
		addtimer(CALLBACK(null, .proc/unlock_gnoll_scaling), 6000)
		return

	GLOB.gnoll_playercount_lock = FALSE

	// Increase this automatically even if no further people with hunted join.
	var/datum/job/gnoll_job = SSjob.GetJob("Gnoll")
	var/total_gnoll_positions = gnoll_job.total_positions
	var/gnoll_increase = get_gnoll_slot_increase(total_gnoll_positions)
	gnoll_job.total_positions = min(total_gnoll_positions + gnoll_increase, 10)
	gnoll_job.spawn_positions = min(total_gnoll_positions + gnoll_increase, 10)
	if(gnoll_increase)
		for(var/mob/dead/new_player/player as anything in GLOB.new_player_list)
			if(!player.client)
				continue
			to_chat(player, "<span class='alert'>Graggar demands blood, gnolls flock to Azuria</span>")

/proc/get_gnoll_scaling()
	if(GLOB.gnoll_scaling_mode != 0)
		return GLOB.gnoll_scaling_mode

	// Aiming for rougly 30 minutes into the round
	// Will not unlock scaling if there's too few players
	addtimer(CALLBACK(null, .proc/unlock_gnoll_scaling), 24000)
	var/datum/storyteller/ST =  SSgamemode.selected_storyteller
	// Roll a coinflip to decide the round's behavior when default value is supplied.
	if(ST.preferred_gnoll_mode == GNOLL_SCALING_RANDOM)
		GLOB.gnoll_scaling_mode = pick(GNOLL_SCALING_DYNAMIC, GNOLL_SCALING_FLAT, GNOLL_SCALING_SINGLE)
	else
		GLOB.gnoll_scaling_mode = ST.preferred_gnoll_mode
	return GLOB.gnoll_scaling_mode

/proc/get_gnoll_slot_increase(total_positions)
	var/mode = get_gnoll_scaling()
	var/players_amt = get_active_player_count(alive_check = 1, afk_check = 1, human_check = 1)
	// Whether or not to update the desired slots for later
	var/pop_locked = GLOB.gnoll_playercount_lock
	var/slots_increase = 0

	// If pop is locked, use the desired gnoll slots for math.
	var/comparison_total = pop_locked ? GLOB.desired_gnoll_slots : total_positions

	if(players_amt < 25)
		if(total_positions >= 1)
			return 0 // Already have our 1 gnoll
		return 1

	switch(mode)
		if(GNOLL_SCALING_DYNAMIC)
			// up to two gnolls guaranteed if there's hunted.
			if(comparison_total <= 1)
				slots_increase = 1
			// up to three gnolls with a 50% chance per hunted if there's more hunted.
			else if(comparison_total <= 2 && prob(50) && !slots_increase)
				slots_increase = 1
			// Up to four gnolls with a 25% chance per hunted if there's more hunted.
			else if(comparison_total <= 3 && prob(25) && !slots_increase)
				slots_increase = 1

		if(GNOLL_SCALING_FLAT)
			if(comparison_total < 2 && prob(15))
				slots_increase = 1

	GLOB.desired_gnoll_slots = min(GLOB.desired_gnoll_slots + slots_increase, 10)

	if(pop_locked)
		return 0

	if(total_positions < GLOB.desired_gnoll_slots)
		return GLOB.desired_gnoll_slots - total_positions

	return 0
