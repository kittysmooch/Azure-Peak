/obj/structure/flagpole
	name = "flagpole"
	icon = 'icons/roguetown/misc/flagpole.dmi'
	icon_state = "flagpole"
	desc = "A half-alive magitech vending machine. The stomach of this thing can be stuffed with fun things to buy. Be mindful, however; for while its favorite snack is coinage, the limits of \
	its diet is set by another."
	density = TRUE
	blade_dulling = DULLING_BASH
	integrity_failure = 0.1
	max_integrity = 0
	anchored = TRUE
	layer = BELOW_OBJ_LAYER

/obj/structure/flagpole/Initialize(mapload)
	. = ..()
	SSrogueinfo.all_flags += src

/obj/structure/flagpole/Destroy()
	SSrogueinfo.all_flags -= src
	return ..()

/obj/structure/flagpole/proc/update_single_role(role_name, is_visible)
	var/icon_state_name = "[role_name]"
	var/image/I = image(icon, icon_state_name)

	if(is_visible)
		add_overlay(I)
	else
		cut_overlay(I)
	update_desc()

/obj/structure/flagpole/proc/update_desc()
	var/list/active_names = list()
	for(var/role in SSrogueinfo.role_visibility)
		if(SSrogueinfo.role_visibility[role])
			active_names += role

	desc = active_names.len ? "Flags flying: [english_list(active_names)]." : "The flagpole stands bare."

/obj/item/mini_flagpole
	name = "freeform miniature flagpole"
	icon = 'icons/roguetown/misc/flagpole_mini.dmi'
	icon_state = "flagpole"

	var/controlled_role = "freeform1"
	var/flag_color = "#ffffff"
	var/mutable_appearance/flag_overlay

/obj/item/mini_flagpole/proc/update_visuals()
	flag_overlay = mutable_appearance(icon, "flag")
	flag_overlay.color = flag_color

	var/active = SSrogueinfo.role_visibility[controlled_role]

	if(active)
		add_overlay(flag_overlay)
	else
		cut_overlay(flag_overlay)

/obj/item/mini_flagpole/attack_self(mob/user)
	var/new_status = !SSrogueinfo.role_visibility[controlled_role]

	if(SSrogueinfo.set_role_visibility(controlled_role, new_status))
		update_visuals()
		to_chat(user, "You set the [controlled_role] flag to [new_status ? "raised" : "lowered"].")

/obj/item/mini_flagpole/freeform2
	name = "freeform miniature flagpole"
	controlled_role = "freeform2"
	flag_color = "#ffffff"

/obj/item/mini_flagpole/blacksmith
	name = "blacksmith miniature flagpole"
	controlled_role = "blacksmith"
	flag_color = "#808080" // Gray

/obj/item/mini_flagpole/artificer
	name = "artificer miniature flagpole"
	controlled_role = "artificer"
	flag_color = "#B87333" // Copper

/obj/item/mini_flagpole/steward
	name = "steward miniature flagpole"
	controlled_role = "steward"
	flag_color = "#FFD700" // Gold

/obj/item/mini_flagpole/duke
	name = "duke miniature flagpole"
	controlled_role = "duke"
	flag_color = "#007FFF" // Azure

/obj/item/mini_flagpole/apothecary
	name = "apothecary miniature flagpole"
	controlled_role = "apothecary"
	flag_color = "#A9A9A9" // Dark Gray

/obj/item/mini_flagpole/church
	name = "church miniature flagpole"
	controlled_role = "church"
	flag_color = "#00FFFF" // Cyan

/obj/item/mini_flagpole/fisher
	name = "fisher miniature flagpole"
	controlled_role = "fisher"
	flag_color = "#006400" // Dark Green

/obj/item/mini_flagpole/university
	name = "university miniature flagpole"
	controlled_role = "university"
	flag_color = "#000080" // Deep Marine Blue

/obj/item/mini_flagpole/innkeeper
	name = "innkeeper miniature flagpole"
	controlled_role = "innkeeper"
	flag_color = "#800020" // Burgundy

/obj/item/mini_flagpole/tailor
	name = "tailor miniature flagpole"
	controlled_role = "tailor"
	flag_color = "#FFFFFF" // Bright White

/obj/item/mini_flagpole/bathhouse
	name = "bathhouse miniature flagpole"
	controlled_role = "bathhouse"
	flag_color = "#800080" // Purple

/obj/item/mini_flagpole/merchant
	name = "merchant miniature flagpole"
	controlled_role = "merchant"
	flag_color = "#C0C0C0" // Silver
