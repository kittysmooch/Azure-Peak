// Ported from Vanderlin Gaffer PR. But this is meant to be a machine for lowpop headhunting that gives you such a poor price you'd rather sell to the merchant.
/obj/structure/roguemachine/headeater
	name = "HEADEATER"
	desc = "A machine where you deposit heads of wanted creechurs and spits out coins. The makers charges a hefty fee - 60% of the bounty. Seeking the cooperation of a merchant might be more profitable."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "headeater"
	density = FALSE
	blade_dulling = DULLING_BASH
	pixel_y = 32
	var/return_ratio = 0.4 // 40% cost should make it enticing enough to sell to merchant probably?

/obj/structure/roguemachine/headeater/attackby(obj/item/H, mob/user, params)
	. = ..()
	if(!istype(H, /obj/item/natural/head) && !istype(H, /obj/item/bodypart/head))
		to_chat(user, span_danger("It seems uninterested by [H]"))
		return

	if(istype(H, /obj/item/bodypart/head))
		var/obj/item/bodypart/head/E = H
		if(E.sellprice > 0)
			to_chat(user, span_danger("the [src] consumes [E] spitting out coins in its place!"))
			budget2change(E.sellprice * return_ratio, user)
			E.forceMove(src)
			return

	if(istype(H, /obj/item/natural/head))
		var/obj/item/natural/head/A = H
		if(A.sellprice > 0)
			to_chat(user, span_danger("the [src] consumes [A] spitting out coins in its place!"))
			budget2change(A.sellprice * return_ratio, user)
			A.forceMove(src)
			return
