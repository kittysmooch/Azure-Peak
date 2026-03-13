// Generic baked products. Also includes their intermediary forms (raw) before baking.
// For consistency.

/*	.................   Hardtack   ................... */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/hardtack_raw
	name = "raw hardtack"
	desc = "Doughy, soft, unacceptable."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "raw_tack"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/crackerscooked
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = null

/*	.................   Hardtack   ................... */
/obj/item/reagent_containers/food/snacks/rogue/crackerscooked
	name = "hardtack"
	desc = "Brittle and hard, like chewing on a rock. These salted biscuits will never expire, however: and for those who travel across Psydonia, that fact alone earns it a space in their packs."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "tack6"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	faretype = FARE_POOR
	w_class = WEIGHT_CLASS_TINY
	tastes = list("spelt" = 1)
	bitesize = 6
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/crackerscooked/On_Consume(mob/living/eater)
	..()
	if(bitecount == 1)
		icon_state = "tack5"
	if(bitecount == 2)
		icon_state = "tack4"
	if(bitecount == 3)
		icon_state = "tack3"
	if(bitecount == 4)
		icon_state = "tack2"
	if(bitecount == 5)
		icon_state = "tack1"


/*	.................   Bread   ................... */
/obj/item/reagent_containers/food/snacks/rogue/bread
	name = "bread loaf"
	desc = "One of Psydonia's staple foodstuffs, made from leavened dough. From the pauper to the papal, none can deny the simplistic beauty of a freshly-baked loaf."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "loaf6"
	slices_num = 6
	bitesize = 8
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/breadslice
	list_reagents = list(/datum/reagent/consumable/nutriment = DOUGH_NUTRITION)
	faretype = FARE_POOR
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1)
	slice_batch = FALSE
	slice_sound = TRUE
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks/rogue/bread/update_icon()
	if(slices_num)
		icon_state = "loaf[slices_num]"
	else
		icon_state = "loaf_slice"

/obj/item/reagent_containers/food/snacks/rogue/bread/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 3)
			slices_num = 5
		if(bitecount == 4)
			slices_num = 4
		if(bitecount == 5)
			slices_num = 3
		if(bitecount == 6)
			slices_num = 2
		if(bitecount == 7)
			changefood(slice_path, eater)

/*	.................   Breadslice & Toast   ................... */
/obj/item/reagent_containers/food/snacks/rogue/breadslice
	name = "sliced bread"
	desc = "A bit of comfort to start your dae. The finest choice-of-vessel for a slice of saloumi, salo, cheese, bacon, or jam."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "loaf_slice"
	faretype = FARE_POOR
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/breadslice/toast
	bitesize = 2
	rotprocess = SHELFLIFE_LONG
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/breadslice/attackby(obj/item/I, mob/living/user, params)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/salami/slice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/salami/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/cheese/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarslice/aged))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/parmesean/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/fat/salo/slice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/salo/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/bacon/fried))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/bacon/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	else
		return ..()

//this is a child so we can be used in sammies
/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast
	name = "toast"
	desc = "Crisp and crunchy, yet not burnt - truly, an alchemical wonder. Best enjoyed with a fried egg, a knob of sliced butter, or some freshly-prepared jams."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "toast"
	faretype = FARE_NEUTRAL
	tastes = list("crispy bread" = 1)
	mill_result = /obj/item/reagent_containers/food/snacks/rogue/toastcrumbs
	cooked_type = null
	bitesize = 3
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/attackby(obj/item/I, mob/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/butterslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/buttered/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedegg/fried)) //This actually creates a toast out of regular bread so we put it here.
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/egg/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/jamtallowslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/jamtallowed_slice/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/marmaladeslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/marmaladed_slice/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
/*	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/tartar))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,short_cooktime, target = src))
				var/obj/item/reagent_containers/food/snacks/rogue/sandwich/tartar/sammich= new(get_turf(user))
				qdel(I)
				qdel(src)*/
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedegg/sausagebacon))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,short_cooktime, target = src))
				new /obj/item/reagent_containers/food/snacks/rogue/friedegg/hammerhold(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/buttered
	name = "buttered toast"
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "toast_butter"
	faretype = FARE_FINE
	tastes = list("butter" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)

/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/jamtallowed_slice
	tastes = list("crunchy, sweetly-sour jamminess" = 1, "a wonderful start to the dae" = 1)
	name = "jamtallowed toast"
	desc = "A blackberried jam, smeared across a slice of toast. It is favored as a delicacy by Psydonia's peasantry and yeomen, and is usually reserved to crown the start of a particularly special dae."
	faretype = FARE_LAVISH
	icon_state = "toast_jamtallow"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_CHUNKY)
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/marmaladed_slice
	tastes = list("crunchy, sweet-tarty jamminess" = 1, "a wonderful end to the dae" = 1)
	name = "marmaladed toast"
	desc = "A tangerine marmalade served on a bed of warm crustless bread topped with another piece of warm crustless bread. One bite, and it can satiate even a starving bear's stomach!"
	faretype = FARE_LAVISH
	icon_state = "toast_marmalade"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_CHUNKY)
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/toastcrumbs
	name = "toast crumbs"
	desc = "Perfect for adding some crunch to deep-fried food."
	icon = 'modular/Neu_Food/icons/raw/raw_deep_fried.dmi'
	icon_state = "toastcrumbs"
	slices_num = 0
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("crunch" = 1)
	cooked_type = null
	foodtype = GRAIN
	bitesize = 1
	rotprocess = SHELFLIFE_DECENT

// -------------- BREAD WITH FOOD ON IT (not american sandwich) -----------------
/obj/item/reagent_containers/food/snacks/rogue/sandwich
	desc = "A delightful piece of heaven in every slice."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	bitesize = 4
	faretype = FARE_NEUTRAL
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/snackbuff

/obj/item/reagent_containers/food/snacks/rogue/sandwich/salami
	tastes = list("salumoi" = 1,"bread" = 1)
	name = "salumoi bread"
	desc = "A piece of toast with a thin slice of salumoi on top. Often eaten by soldiers on the march. Salty!"
	icon_state = "bread_salami"
	foodtype = GRAIN | MEAT

/obj/item/reagent_containers/food/snacks/rogue/sandwich/cheese
	tastes = list("cheese" = 1,"bread" = 1)
	name = "cheese bread"
	desc = "A slice of toast with a rather thin wedge of cheese melted into the crust."
	icon_state = "bread_cheese"
	foodtype = GRAIN | DAIRY

/obj/item/reagent_containers/food/snacks/rogue/sandwich/parmesean
	tastes = list("salty yet savory cheesiness" = 1,"soft dough" = 1)
	name = "aged cheese bread"
	desc = "A slice of toast with a rather thin wedge of aged cheese melted into the crust. For a meal so humble, you'd never imagine it to be so tasty!"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS * 2)
	icon_state = "bread_agedcheese"
	foodtype = GRAIN | DAIRY
	faretype = FARE_FINE
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/sandwich/egg
	tastes = list("cheese" = 1,"egg" = 1)
	name = "egg toast"
	desc = "A piece of toast with a fried egg on top that jiggles gently when prodded."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS * 2)
	icon_state = "bread_egg"
	foodtype = GRAIN | MEAT

/obj/item/reagent_containers/food/snacks/rogue/sandwich/salo
	tastes = list("salty fat" = 1)
	name = "salo bread"
	desc = "The salo's smooth consistency helps soften the rough grainy bread."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS * 2)
	faretype = FARE_POOR
	icon_state = "bread_salo"
	foodtype = GRAIN | MEAT

/obj/item/reagent_containers/food/snacks/rogue/sandwich/jamtallow
	tastes = list("sweetly-sour richness" = 1, "a lovely start to the dae" = 1)
	name = "jamtallowed bread"
	desc = "'I liked it. I was good at it. And I was really.. I was alive.'"
	faretype = FARE_FINE
	icon_state = "bread_jamtallow"
	eat_effect = /datum/status_effect/buff/snackbuff

/obj/item/reagent_containers/food/snacks/rogue/sandwich/marmalade
	tastes = list("sweet-tarty richness" = 1, "a lovely end to the dae" = 1)
	name = "marmaladed bread"
	desc = "'I always keep a marmalade sandwich under my sallet, just in case!'"
	faretype = FARE_FINE
	icon_state = "bread_marmalade"
	eat_effect = /datum/status_effect/buff/snackbuff

/obj/item/reagent_containers/food/snacks/rogue/sandwich/bacon
	tastes = list("bacon" = 1)
	name = "bacon bread"
	desc = "A slice of bread with crispy bacon on top for the perfect breakfast."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS * 2)
	icon_state = "toast_bacon"
	foodtype = GRAIN | MEAT
/*
/obj/item/reagent_containers/food/snacks/rogue/sandwich/tartar
	tastes = list("dissapointment" = 1)
	name = "tartar bread"
	desc = "A slice of bread with tartar on top for the perfect breakfast. What's that stench?"
	faretype = FARE_POOR
	icon_state = "toast_tartar"
	foodtype = GRAIN | MEAT
*/
/*	.................   Bread bun   ................... */
/obj/item/reagent_containers/food/snacks/rogue/bun
	name = "bun"
	desc = "Portable, quaint, and entirely consumable - for the discerning traveler. It yearns to be further dolled with a sausage, wedge of cheese, or some delicious jams."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "bun"
	list_reagents = list(/datum/reagent/consumable/nutriment = SMALLDOUGH_NUTRITION)
	faretype = FARE_POOR
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1)
	bitesize = 3
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks/rogue/bun/attackby(obj/item/I, mob/living/user, params)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, span_notice("Pushing the wiener through the bun..."))
		if(do_after(user,short_cooktime, target = src))
			var/obj/item/reagent_containers/food/snacks/rogue/bun_grenz/hotdog= new(get_turf(user))
			user.put_in_hands(hotdog)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 100, TRUE, -1)
		to_chat(user, "<span class='notice'>Stuffing the bun with cheese...</span>")
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/bun_raston(loc)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge/aged))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 100, TRUE, -1)
		to_chat(user, "<span class='notice'>Stuffing the bun with aged cheese...</span>")
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/bun_parmesean(loc)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/jamtallowslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, span_notice("Stuffing the bun with jamtallow..."))
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/bun_jamtallow(loc)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/marmaladeslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, span_notice("Stuffing the bun with marmalade..."))
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/bun_marmalade(loc)
			qdel(I)
			qdel(src)
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/bun_jamtallow
	name = "jamtallowed bun"
	desc = "A delicious treat to bring along for those long-and-lonesome hikes through the Naledian deserts; doubly-so, if you happen to be smuggling enough starsugar to buy out Astrata's throne."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	tastes = list("sweetly-sour jamminess" = 1, "a lavish break from the dae's woes" = 1)
	icon_state = "bun_jamtallow"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_CHUNKY)
	faretype = FARE_LAVISH
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 4
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/bun_marmalade
	name = "marmaladed bun"
	desc = "A delicious treat to bring along for those long-and-lonesome hikes through the Azurian forests; doubly-so, if you happen to be a tallow-coated wildkin of the urisine variety."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	tastes = list("sweet-tarty jamminess" = 1, "a lavish break from the dae's woes" = 1)
	icon_state = "bun_marmalade"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_CHUNKY)
	faretype = FARE_LAVISH
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 4
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/* 	.................   Crossbuns   ................... */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/crossbun_raw
	name = "raw crossbun"
	desc = "A piece of raw dough with the shape of Astrata's cross pressed onto it. In Her Light."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "crossbun_raw"
	list_reagents = list(/datum/reagent/consumable/nutriment = SMALLDOUGH_NUTRITION)
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/crossbun

// Psydon variant
/obj/item/reagent_containers/food/snacks/rogue/foodbase/psycrossbun_raw
	name = "raw psycrossbun"
	desc = "A piece of raw dough with the shape of a Psycross pressed onto it. He ENDURES."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "psycrossbun_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/psycrossbun

/* 	.................   Crossbuns   ................... */
// Astrata variant

/obj/item/reagent_containers/food/snacks/rogue/crossbun
	name = "crossbun"
	desc = "Traditionally eaten for breakfast amongst Psydonia's abbeys. Astratans in particular have made it a \
	practice to add a slice of marmalade to their crossbuns, in reverance of Her golden authority."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "crossbun"
	faretype = FARE_NEUTRAL // Having nobles vomit from eating holy buns is not a good idea
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1)
	bitesize = 3
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks/rogue/crossbun/attackby(obj/item/I, mob/living/user, params)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/jamtallowslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, span_notice("Stuffing the bun with jamtallow..."))
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/crossbun_jamtallowed(loc)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/marmaladeslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, span_notice("Stuffing the bun with marmalade..."))
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/crossbun_marmaladed(loc)
			qdel(I)
			qdel(src)
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/crossbun_jamtallowed
	name = "jamtallowed crossbun"
	desc = "So sinfully delicious!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "crossbun_jamtallow"
	faretype = FARE_LAVISH
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 4
	rotprocess = SHELFLIFE_EXTREME
	tastes = list("sweet-tarty jamminess" = 1, "a sense of divine fufillment" = 1)
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/crossbun_marmaladed
	name = "marmaladed crossbun"
	desc = "A particularly favorite treat amonst the papacies of Grenzelhoft and Etruscea, especially during the \
	holidaes that pay reverance to Astrata. The marmalade is said to represent the Sun's blessed light and warming \
	radiance, though the spiritual implication tends to be lost on more eager-minded children."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "crossbun_marmalade"
	faretype = FARE_LAVISH
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 4
	rotprocess = SHELFLIFE_EXTREME
	tastes = list("sweetly-sour jamminess" = 1, "a sense of divine communion" = 1)
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/psycrossbun
	name = "psycrossbun"
	desc = "How long will you endure the temptation to eat it? Surely, you wouldn't dare to jam it up as well, would you.. ?"
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "psycrossbun"
	list_reagents = list(/datum/reagent/consumable/nutriment = SMALLDOUGH_NUTRITION)
	faretype = FARE_NEUTRAL // Having nobles vomit from eating holy buns is not a good idea
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1)
	bitesize = 3
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks/rogue/psycrossbun/attackby(obj/item/I, mob/living/user, params)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/jamtallowslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, span_notice("Stuffing the bun with jamtallow..."))
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/psycrossbun_jamtallowed(loc)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/marmaladeslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, span_notice("Stuffing the bun with marmalade..."))
		if(do_after(user,short_cooktime, target = src))
			user.adjust_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/psycrossbun_marmaladed(loc)
			qdel(I)
			qdel(src)
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/psycrossbun_jamtallowed
	name = "jamtallowed psycrossbun"
	desc = "A particularly favorite treat amonst the papacies of Otava and Rockhill, especially during the \
	holidaes that pay reverance to Psydon's sacrifice. The jamtallow is said to represent the Weeping God's \
	tears, though the spiritual implication tends to be lost on more eager-minded children."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "psycrossbun_jamtallow"
	faretype = FARE_LAVISH
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 4
	rotprocess = SHELFLIFE_EXTREME
	tastes = list("sweet-tarty jamminess" = 1, "a sense of enduring sorrow" = 1)
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/psycrossbun_marmaladed
	name = "marmaladed psycrossbun"
	desc = "Wait, isn't it meant to be the other way around? Ah, well!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "psycrossbun_marmalade"
	faretype = FARE_LAVISH
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 4
	rotprocess = SHELFLIFE_EXTREME
	tastes = list("sweetly-sour jamminess" = 1, "a sense of enduring confusion" = 1)
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/*	.................   Cheese bun   ................... */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/cheesebun_raw
	name = "raw cheese bun"
	desc = "Time for the oven!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "cheesebun_raw"
	color = "#ecce61"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/cheesebun
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | DAIRY

/obj/item/reagent_containers/food/snacks/rogue/cheesebun
	name = "fresh cheese bun"
	desc = "A quaint treat from the Grenzelhoftian kitchens."
	faretype = FARE_FINE
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "cheesebun"
	list_reagents = list(/datum/reagent/consumable/nutriment = SMALLDOUGH_NUTRITION+FRESHCHEESE_NUTRITION)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("crispy bread and cream cheese" = 1)
	foodtype = GRAIN | DAIRY
	bitesize = 3
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/frybread
	name = "frybread"
	desc = "Flatbread fried with butter until crispy. A staple of the elven kitchen."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "frybread"
	faretype = FARE_FINE
	list_reagents = list(/datum/reagent/consumable/nutriment = BUTTERDOUGHSLICE_NUTRITION)
	tastes = list("crispy bread with a soft inside" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 4
	eat_effect = /datum/status_effect/buff/snackbuff

/*	.................   Raisin bread   ................... */
/obj/item/reagent_containers/food/snacks/rogue/rbread_half
	name = "half-done raisin dough"
	desc = "It needs more raisins!"
	icon = 'modular/Neu_Food/icons/raw/raw_dough.dmi'
	icon_state = "dough_raisin"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/rbread_half/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/raisins))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, span_notice("Adding the last of the raisins, puffing up the dough for baking."))
			if(do_after(user,short_cooktime, target = src))
				add_sleep_experience(user, /datum/skill/craft/cooking, user.STAINT)
				new /obj/item/reagent_containers/food/snacks/rogue/rbreaduncooked(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, span_warning("You need to put [src] on a table to work it."))
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/rbreaduncooked
	name = "raw raisin loaf"
	desc = "Into the oven you go!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "raisinbreaduncooked"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/raisinbread
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/raisinbread
	name = "raisin loaf"
	desc = "A popular dessert amongst the peasantry, this loaf of sweetbread's speckled with fruity surprises. In recent years, it has more palettes amongst the papacy: t'was Rockhill's abbey that christened a variant, glazed with a sugary veneer."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "raisinbread6"
	bitesize = 8
	slices_num = 6
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/raisinbreadslice
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_AVERAGE)
	faretype = FARE_NEUTRAL
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1,"dried fruit" = 1)
	slice_batch = FALSE
	slice_sound = TRUE
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/snackbuff

/obj/item/reagent_containers/food/snacks/rogue/raisinbread/update_icon()
	if(slices_num)
		icon_state = "raisinbread[slices_num]"
	else
		icon_state = "raisinbread_slice"

/obj/item/reagent_containers/food/snacks/rogue/raisinbread/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 3)
			slices_num = 5
		if(bitecount == 4)
			slices_num = 4
		if(bitecount == 5)
			slices_num = 3
		if(bitecount == 6)
			slices_num = 2
		if(bitecount == 7)
			changefood(slice_path, eater)

/obj/item/reagent_containers/food/snacks/rogue/raisinbreadslice
	name = "raisin loaf slice"
	desc = "Soft and chewy. Nourishing and filling. Simple and decent."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "raisinbread_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT-1)
	w_class = WEIGHT_CLASS_NORMAL
	faretype = FARE_NEUTRAL
	cooked_type = null
	tastes = list("spelt" = 1,"dried fruit" = 1)
	bitesize = 3
	rotprocess = SHELFLIFE_LONG
	dropshrink = 0.8
	eat_effect = /datum/status_effect/buff/snackbuff

//

/obj/item/reagent_containers/food/snacks/rogue/abread_half
	name = "half-done apple dough"
	desc = "It needs more apple slices!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "dough_apple"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/abread_half/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	update_cooktime(user)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/fruit/apple_sliced))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, span_notice("Adding the last of the apple slices, puffing up the dough for baking."))
			if(do_after(user,short_cooktime, target = src))
				add_sleep_experience(user, /datum/skill/craft/cooking, user.STAINT)
				new /obj/item/reagent_containers/food/snacks/rogue/abreaduncooked(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, span_warning("You need to put [src] on a table to work it."))
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/abreaduncooked
	name = "raw apple loaf"
	desc = "Into the oven you go!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "applebread_uncooked"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/applebread
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/applebread
	name = "apple loaf"
	desc = "A fresher cousin of the oft-adored 'raisin loaf', bespeckled with baked apples that dare to melt upon an indulger's tongue. It holds a special place in the hearts of Valoria's people, for both the peasantry and nobility."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "applebread6"
	bitesize = 8
	slices_num = 6
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/applebreadslice
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_AVERAGE)
	faretype = FARE_FINE
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("crisp-laden doughiness" = 1,"deliciously soft apples" = 1)
	slice_batch = FALSE
	slice_sound = TRUE
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/snackbuff

/obj/item/reagent_containers/food/snacks/rogue/applebread/update_icon()
	if(slices_num)
		icon_state = "applebread[slices_num]"
	else
		icon_state = "applebread_slice"

/obj/item/reagent_containers/food/snacks/rogue/applebread/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 3)
			slices_num = 5
		if(bitecount == 4)
			slices_num = 4
		if(bitecount == 5)
			slices_num = 3
		if(bitecount == 6)
			slices_num = 2
		if(bitecount == 7)
			changefood(slice_path, eater)

/obj/item/reagent_containers/food/snacks/rogue/applebreadslice
	name = "apple loaf slice"
	desc = "Soft and chewy. Nourishing and filling. Simple yet decadant. Certainly a step up from raisins, that's for sure."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "applebread_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_NORMAL
	faretype = FARE_FINE
	cooked_type = null
	tastes = list("crisp-laden doughiness" = 1,"deliciously soft apples" = 1)
	bitesize = 3
	rotprocess = SHELFLIFE_LONG
	dropshrink = 0.8
	eat_effect = /datum/status_effect/buff/snackbuff

//

/obj/item/reagent_containers/food/snacks/rogue/bun_grenz
	list_reagents = list(/datum/reagent/consumable/nutriment = SAUSAGE_NUTRITION+SMALLDOUGH_NUTRITION)
	tastes = list("savory sausage" = 1, "bread" = 1)
	name = "grenzelbun"
	desc = "The classic wiener in a bun, now a staple of Grenzelhoft cuisine. It is rumored that elves first invented it long ago, back when they practiced the consumption of other people..."
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "grenzbun"
	foodtype = GRAIN | MEAT
	faretype = FARE_NEUTRAL
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/*	.............   Raston   ................ */
/obj/item/reagent_containers/food/snacks/rogue/bun_raston
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	tastes = list("cheese" = 1, "bread" = 1)
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "raston"
	name = "raston"
	faretype = FARE_NEUTRAL
	desc = "A slice of cheese melted between two lightly-toasted buns."
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/greatsnackbuff

/obj/item/reagent_containers/food/snacks/rogue/bun_parmesean
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	tastes = list("a deliciously savory and gooey treat" = 1, "pillowy dough" = 1)
	icon = 'modular/Neu_Food/icons/cooked/cooked_baked.dmi'
	icon_state = "raston_aged"
	name = "aged raston"
	faretype = FARE_LAVISH
	desc = "A slice of aged cheese melted between two lightly-toasted buns. It is as stupidly simple as it is deliciously decadant."
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/greatsnackbuff
