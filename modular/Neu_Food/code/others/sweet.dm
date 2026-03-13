// -------------- CHOCOLATE -----------------
/obj/item/reagent_containers/food/snacks/chocolate
	name = "chocolate ingot"
	desc = "An unbelievably decadant slab of fudge, made with Amazonia's cocoa beans and Grenzelhoft's saiga milk. A \
	recent trade agreement between the two nations has turned this once-expensive delicacy into a slightly-less-expensive \
	treat for many. </br>Following a rather unfortunate diplomatic incident involving a Lupian nobleman and a box of chocolates, \
	chocolate is also now-known to double as a potent 'humor rebalancer' for some of Dendor's children. </br>It looks like it can be \
	split in half with a dagger."
	icon = 'modular/Neu_Food/icons/others/sweet.dmi'
	icon_state = "chocolate"
	bitesize = 4
	slices_num = 2
	slice_path = /obj/item/reagent_containers/food/snacks/chocolate/slice
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("sugary richness" = 1)
	faretype = FARE_LAVISH
	rotprocess = null
	eat_effect = /datum/status_effect/buff/snackbuff
	chopping_sound = TRUE

/obj/item/reagent_containers/food/snacks/chocolate/On_Consume(mob/living/eater)
	if(islupian(eater) || isvulp(eater))
		to_chat(eater, span_warning("The chocolate tastes delicious but my stomach churns violently!"))
		if(iscarbon(eater))
			var/mob/living/carbon/C = eater
			C.add_nausea(120) // enough to trigger vomiting
		eater.adjustToxLoss(5)
	return ..()

/obj/item/reagent_containers/food/snacks/chocolate/slice
	name = "halved chocolate ingot"
	desc = "An unbelievably decadant halve of fudge, made with Amazonia's cocoa beans and Grenzelhoft's saiga milk. A \
	recent trade agreement between the two nations has turned this once-expensive delicacy into a slightly-less-expensive \
	treat for many. </br>Following a rather unfortunate diplomatic incident involving a Lupian nobleman and a box of chocolates, \
	chocolate is also now-known to double as a potent 'humor rebalancer' for some of Dendor's children. </br>When combined with \
	pumpkin spice and tossed into a kettle, it makes for an absolutely divine drink."
	bitesize = 3 //Sharing is caring!
	icon_state = "chocolatehalf"

/obj/item/reagent_containers/food/snacks/jamtallow
	name = "stick of jamtallow"
	desc = "An ingot of jammified blackberries, fit only for the finest slices of bread. It beckons to be sliced with proper cutlery."
	icon = 'modular/Neu_Food/icons/others/sweet.dmi'
	icon_state = "jamtallow6"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	faretype = FARE_POOR //Slightly better than eating a whole log of butter on your lonesome. Slightly.
	slice_path = /obj/item/reagent_containers/food/snacks/jamtallowslice
	slices_num = 6
	slice_batch = FALSE
	bitesize = 6
	slice_sound = TRUE
	tastes = list("stickied deliciousness" = 1, "subtle sour-tartiness" = 1)

/obj/item/reagent_containers/food/snacks/jamtallow/update_icon()
	if(slices_num)
		icon_state = "jamtallow[slices_num]"
	else
		icon_state = "jamtallow_slice"

/obj/item/reagent_containers/food/snacks/jamtallow/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 1)
			slices_num = 5
		if(bitecount == 2)
			slices_num = 4
		if(bitecount == 3)
			slices_num = 3
		if(bitecount == 4)
			slices_num = 2
		if(bitecount == 5)
			changefood(slice_path, eater)

/obj/item/reagent_containers/food/snacks/jamtallowslice
	name = "slice of jamtallow"
	desc = "A portion of jammy paradise, bearing the same hues as Azuria's morning skies. It yearns to be savored not by its lonesome, but upon a slice of bread - be it plain or toasted."
	icon = 'modular/Neu_Food/icons/others/sweet.dmi'
	icon_state = "jamtallow_slice"
	faretype = FARE_POOR
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("stickied deliciousness" = 1, "subtle sour-tartiness" = 1)

/obj/item/reagent_containers/food/snacks/marmalade
	name = "stick of marmalade"
	desc = "An ingot of jammified tangerines, fit only for the finest slices of bread. It beckons to be sliced with proper cutlery."
	icon = 'modular/Neu_Food/icons/others/sweet.dmi'
	icon_state = "marmalade6"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	faretype = FARE_POOR //Slightly better than eating a whole log of butter on your lonesome. Slightly.
	slice_path = /obj/item/reagent_containers/food/snacks/marmaladeslice
	slices_num = 6
	slice_batch = FALSE
	bitesize = 6
	slice_sound = TRUE
	tastes = list("stickied deliciousness" = 1, "subtle sweet-tartiness" = 1)

/obj/item/reagent_containers/food/snacks/marmalade/update_icon()
	if(slices_num)
		icon_state = "marmalade[slices_num]"
	else
		icon_state = "marmalade_slice"

/obj/item/reagent_containers/food/snacks/marmalade/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 1)
			slices_num = 5
		if(bitecount == 2)
			slices_num = 4
		if(bitecount == 3)
			slices_num = 3
		if(bitecount == 4)
			slices_num = 2
		if(bitecount == 5)
			changefood(slice_path, eater)

/obj/item/reagent_containers/food/snacks/marmaladeslice
	name = "slice of marmalade"
	desc = "A portion of jammy paradise, bearing the same hues as Azuria's evening seas. It yearns to be savored not by its lonesome, but upon a slice of bread - be it plain or toasted."
	icon = 'modular/Neu_Food/icons/others/sweet.dmi'
	icon_state = "marmalade_slice"
	faretype = FARE_POOR
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("stickied deliciousness" = 1, "subtle sweet-tartiness" = 1)
