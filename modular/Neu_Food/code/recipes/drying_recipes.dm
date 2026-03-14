/*	........   Drying Rack recipes   ................ */
/datum/crafting_recipe/roguetown/cooking/salami
	name = "salumoi"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/sausage = 1,
		/obj/item/reagent_containers/powder/salt = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/meat/salami
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 2

/datum/crafting_recipe/roguetown/cooking/coppiette
	name = "coppiette"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1,
		/obj/item/reagent_containers/powder/salt = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/meat/coppiette
	craftdiff = 1
	structurecraft = /obj/machinery/tanningrack

/datum/crafting_recipe/roguetown/cooking/salo
	name = "salo"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/fat = 1,
		/obj/item/reagent_containers/powder/salt = 1)
	result = /obj/item/reagent_containers/food/snacks/fat/salo
	craftdiff = 1
	structurecraft = /obj/machinery/tanningrack

/datum/crafting_recipe/roguetown/cooking/pemmican
	name = "pemmican"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/reagent_containers/food/snacks/rogue/raisins = 1,
		/obj/item/reagent_containers/food/snacks/rogue/meat/salami = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/meat/pemmican
	craftdiff = 2
	structurecraft = /obj/machinery/tanningrack

/datum/crafting_recipe/roguetown/cooking/pemmicanalt
	name = "pemmican, alternate"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/reagent_containers/food/snacks/rogue/raisins = 1,
		/obj/item/reagent_containers/food/snacks/rogue/meat/coppiette = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/meat/pemmican
	craftdiff = 2
	structurecraft = /obj/machinery/tanningrack

/datum/crafting_recipe/roguetown/cooking/raisins
	name = "raisins"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1)
	parts = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/cooking/raisinsraspberry
	name = "raisins, raspberries"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/raspberry = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins/raspberry
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/raisinsblackberry
	name = "raisins, blackberries"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/blackberry = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins/blackberry
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/raisinsstrawberry
	name = "raisins, strawberry"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/strawberry = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins/strawberry
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/raisinsplum
	name = "raisins, plum"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/plum = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins/plum
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/raisinspear
	name = "raisins, pear"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/pear = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins/pear
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/raisinstangerine
	name = "raisins, tangerine"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/tangerine = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins/tangerine
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/raisinslemon
	name = "raisins, lemon"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lemon = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins/lemon
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/raisinslime
	name = "raisins, lime"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lime = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins/lime
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/trailmix
	name = "trail-mix"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rogue/raisins = 1,
		/obj/item/reagent_containers/food/snacks/rogue/fruit/pumpkin_sliced = 1,
		/obj/item/reagent_containers/food/snacks/roastseeds = 1,
		/obj/item/ration = 1
		)
	result = /obj/item/reagent_containers/food/snacks/rogue/trailmix
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 2

/datum/crafting_recipe/roguetown/cooking/fish
	name = "dried fish filet"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/fish = 1,
		/obj/item/reagent_containers/powder/salt = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/meat/driedfishfilet
	craftdiff = 2
	structurecraft = /obj/machinery/tanningrack

/datum/crafting_recipe/roguetown/cooking/frybirdbucket
	name = "frybird bucket"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried = 3,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/reagent_containers/powder/salt = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/frybirdbucket
	craftdiff = 3

/datum/crafting_recipe/roguetown/cooking/dryleaf
	name = "dry swampweed"
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/swampweed = 1)
	structurecraft = /obj/machinery/tanningrack
	time = 2 SECONDS
	verbage_simple = "dry"
	verbage = "dries"
	craftsound = null

/datum/crafting_recipe/roguetown/cooking/drytea
	name = "dry tea leaves"
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/tealeaves_dry
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/tea = 1)
	structurecraft = /obj/machinery/tanningrack
	time = 2 SECONDS
	verbage_simple = "dry"
	verbage = "dries"
	craftsound = null

/datum/crafting_recipe/roguetown/cooking/dryweed
	name = "dry westleach leaf"
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 1)
	structurecraft = /obj/machinery/tanningrack
	time = 2 SECONDS
	verbage_simple = "dry"
	verbage = "dries"
	craftsound = null

/datum/crafting_recipe/roguetown/cooking/dryrosa
	name = "dry rosa petals"
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/rosa_petals_dried
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/rosa_petals = 1)
	structurecraft = /obj/machinery/tanningrack
	time = 2 SECONDS
	verbage_simple = "dry"
	verbage = "dries"
	craftsound = null

/datum/crafting_recipe/roguetown/cooking/sigsweet/cheroot
	name = "cheroot - swampweed"
	result = /obj/item/clothing/mask/cigarette/rollie/cannabis/cheroot
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry = 1,
		/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 1,
		)
	time = 10 SECONDS
	verbage_simple = "roll"
	verbage = "rolls"

/datum/crafting_recipe/roguetown/cooking/sigdry/cheroot
	name = "cheroot - westleach"
	result = /obj/item/clothing/mask/cigarette/rollie/nicotine/cheroot
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 1,
		/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 1,
		)
	time = 10 SECONDS
	verbage_simple = "roll"
	verbage = "rolls"

/datum/crafting_recipe/roguetown/cooking/sigsweet
	name = "zig - swampweed"
	result = /obj/item/clothing/mask/cigarette/rollie/cannabis
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry = 1,
		/obj/item/paper = 1,
		)
	time = 10 SECONDS
	verbage_simple = "roll"
	verbage = "rolls"

/datum/crafting_recipe/roguetown/cooking/sigdry
	name = "zig - westleach"
	result = /obj/item/clothing/mask/cigarette/rollie/nicotine
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 1,
		/obj/item/paper = 1,
		)
	time = 10 SECONDS
	verbage_simple = "roll"
	verbage = "rolls"

/datum/crafting_recipe/roguetown/cooking/rocknutdry
	name = "zig - rocknut"
	result = /obj/item/clothing/mask/cigarette/rollie/nicotine
	reqs = list(
		/obj/item/reagent_containers/powder/rocknut = 1,
		/obj/item/paper = 1,
		)
	time = 10 SECONDS
	verbage_simple = "roll"
	verbage = "rolls"

/datum/crafting_recipe/roguetown/cooking/sugartangerine
	name = "smothered tangerines"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/fruit/tangerine = 1,
		/obj/item/reagent_containers/food/snacks/sugar = 1)
	result = /obj/item/reagent_containers/food/snacks/grown/fruit/tangerine/sugared
	structurecraft = null
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/sugarblackberry
	name = "smothered blackberries"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/fruit/blackberry = 1,
		/obj/item/reagent_containers/food/snacks/sugar = 1)
	result = /obj/item/reagent_containers/food/snacks/grown/fruit/blackberry/sugared
	craftdiff = 1
	structurecraft = null

/datum/crafting_recipe/roguetown/cooking/spicechocolate
	name = "chocolate with pumpkin spice"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/chocolate/slice = 1,
		/obj/item/reagent_containers/food/snacks/pumpkinspice = 1)
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/chocolate_spiced
	structurecraft = null
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/spicecoffee
	name = "roasted coffee beans with pumpkin spice"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/coffeebeansroasted = 1,
		/obj/item/reagent_containers/food/snacks/pumpkinspice = 1)
	result = /obj/item/reagent_containers/food/snacks/grown/coffeebeans_spiced
	structurecraft = null
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/spicetea
	name = "ground tea leaves with pumpkin spice"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/rogue/tealeaves_ground = 1,
		/obj/item/reagent_containers/food/snacks/pumpkinspice = 1)
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/tealeaves_spiced
	structurecraft = null
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/spicerosa
	name = "dried rosa petals with pumpkin spice"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/rogue/rosa_petals_dried = 1,
		/obj/item/reagent_containers/food/snacks/pumpkinspice = 1)
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/rosa_petals_spiced
	structurecraft = null
	craftdiff = 1
