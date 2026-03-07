SUBSYSTEM_DEF(rogueinfo)
	name = "RogueInfo Controller"
	flags = SS_NO_FIRE

	var/list/role_visibility = list(
		"blacksmith" = FALSE,
		"artificer"  = FALSE,
		"steward"    = FALSE,
		"duke"       = FALSE,
		"apothecary" = FALSE,
		"church"     = FALSE,
		"fisher"     = FALSE,
		"university" = FALSE,
		"innkeeper"  = FALSE,
		"tailor"     = FALSE,
		"bathhouse"  = FALSE,
		"merchant"   = FALSE,
		"freeform1"  = FALSE,
		"freeform2"  = FALSE
	)

	var/list/all_flags = list()

/datum/controller/subsystem/flagpoles/Initialize()
	. = ..()

/datum/controller/subsystem/rogueinfo/proc/set_role_visibility(role_name, new_status)
	if(!(role_name in role_visibility))
		return FALSE

	if(role_visibility[role_name] == new_status)
		return FALSE

	role_visibility[role_name] = new_status

	for(var/obj/structure/flagpole/F in all_flags)
		F.update_single_role(role_name, new_status)

	return TRUE
