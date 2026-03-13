#define STEW_COOKING_TIME 60 SECONDS // Default time to cook in seconds

/datum/stew_recipe
	var/list/obj/inputs = null // The valid inputs for the recipe
	var/datum/reagent/output = null // The reagent to be used as output for the recipe
	var/cooktime = STEW_COOKING_TIME // The time to cook the recipe

// DO NOT SORT the list unless you know what you're doing (refactor it) - I ordered specific recipe before generic one for a reason!!

/datum/stew_recipe/porridge
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/wheat, /obj/item/reagent_containers/food/snacks/rogue/crackerscooked, /obj/item/reagent_containers/food/snacks/rogue/breadslice, /obj/item/reagent_containers/food/snacks/rogue/bun)
	output = /datum/reagent/consumable/soup/porridge
	cooktime = STEW_COOKING_TIME / 2

/datum/stew_recipe/oatmeal
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/oat)
	output = /datum/reagent/consumable/soup/porridge/oatmeal
	cooktime = STEW_COOKING_TIME / 2

/datum/stew_recipe/congee
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/rice)
	output = /datum/reagent/consumable/soup/porridge/congee
	cooktime = STEW_COOKING_TIME / 2 

/datum/stew_recipe/potato
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/veg/potato_sliced)
	output = /datum/reagent/consumable/soup/veggie/potato

/datum/stew_recipe/onion
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/veg/onion_sliced)
	output = /datum/reagent/consumable/soup/veggie/onion

/datum/stew_recipe/cabbage
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/veg/cabbage_sliced)
	output = /datum/reagent/consumable/soup/veggie/cabbage

/datum/stew_recipe/turnip
	inputs = list(/obj/item/reagent_containers/food/snacks/veg/turnip_sliced)
	output = /datum/reagent/consumable/soup/veggie/turnip

/datum/stew_recipe/fish
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish)
	output = /datum/reagent/consumable/soup/stew/fish

/datum/stew_recipe/rabbit
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat/mince/rabbit)
	output = /datum/reagent/consumable/soup/stew/rabbit

/datum/stew_recipe/spider
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider)
	output = /datum/reagent/consumable/soup/stew/yucky

/datum/stew_recipe/chicken
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet, /obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry)
	output = /datum/reagent/consumable/soup/stew/chicken

/datum/stew_recipe/bisque
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat/crab, /obj/item/reagent_containers/food/snacks/fish/lobster)
	output = /datum/reagent/consumable/soup/stew/bisque

/datum/stew_recipe/bone
	inputs = list(/obj/item/natural/bone)
	output = /datum/reagent/consumable/soup/stew/bone_broth

/datum/stew_recipe/viscera
	inputs = list(/obj/item/organ/appendix, /obj/item/organ/lungs, /obj/item/organ/liver, /obj/item/organ/stomach, /obj/item/organ/ears, /obj/item/organ/eyes)
	output = /datum/reagent/consumable/soup/stew/viscera_broth

/datum/stew_recipe/pemmican
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat/pemmican/slice)
	output = /datum/reagent/consumable/soup/stew/survival_broth

// Don't alphabetically sort this list this is meant to be reached last. (You are free to change when you find a better way to do a fallback recipe)
/datum/stew_recipe/meat
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat)
	output = /datum/reagent/consumable/soup/stew/meat

// Yet another order issue - specific berries must go before generic. Sigh.
/datum/stew_recipe/berry_poisoned
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison)
	output = /datum/reagent/consumable/soup/stew/berry_poisoned

/datum/stew_recipe/berry
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue, /obj/item/reagent_containers/food/snacks/grown/fruit/strawberry, /obj/item/reagent_containers/food/snacks/grown/fruit/blackberry, /obj/item/reagent_containers/food/snacks/grown/fruit/raspberry)
	output = /datum/reagent/consumable/soup/stew/berry

/datum/stew_recipe/lemon
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lemon)
	output = /datum/reagent/consumable/soup/stew/lemon

/datum/stew_recipe/lime
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lime)
	output = /datum/reagent/consumable/soup/stew/lime

/datum/stew_recipe/pear
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/pear)
	output = /datum/reagent/consumable/soup/stew/pear

/datum/stew_recipe/apple
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/apple, /obj/item/reagent_containers/food/snacks/rogue/fruit/apple_sliced)
	output = /datum/reagent/consumable/soup/stew/apple

/datum/stew_recipe/cheese
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/cheese, /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge, /obj/item/reagent_containers/food/snacks/rogue/cheddarslice)
	output = /datum/reagent/consumable/soup/stew/cheese

/datum/stew_recipe/parmesan
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/cheddar/aged, /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge/aged, /obj/item/reagent_containers/food/snacks/rogue/cheddarslice/aged)
	output = /datum/reagent/consumable/soup/stew/parmesan

/datum/stew_recipe/egg
	inputs = list(/obj/item/reagent_containers/food/snacks/egg)
	output = /datum/reagent/consumable/soup/stew/egg

/datum/stew_recipe/garlick_soup
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/garlick/rogue)
	output = /datum/reagent/consumable/soup/stew/garlick_soup

/datum/stew_recipe/cucumber_soup
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/cucumber)
	output = /datum/reagent/consumable/soup/stew/cucumber_soup

/datum/stew_recipe/eggplant_soup
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/eggplant)
	output = /datum/reagent/consumable/soup/stew/eggplant_soup

/datum/stew_recipe/carrot_stew
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/carrot)
	output = /datum/reagent/consumable/soup/stew/carrot_stew

/datum/stew_recipe/nutty_stew
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/nut)
	output = /datum/reagent/consumable/soup/stew/nutty_stew

/datum/stew_recipe/tomato_soup
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/tomato)
	output = /datum/reagent/consumable/soup/stew/tomato_soup

/datum/stew_recipe/plum_soup
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/plum)
	output = /datum/reagent/consumable/soup/stew/plum_soup

/datum/stew_recipe/tangerine_marmalade
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/tangerine)
	output = /datum/reagent/consumable/soup/stew/tangerine_marmalade

/datum/stew_recipe/squash_soup
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/fruit/pumpkin_sliced, /obj/item/reagent_containers/food/snacks/rogue/preserved/pumpkin_mashed)
	output = /datum/reagent/consumable/soup/stew/squash_soup

// DRINKS
/datum/stew_recipe/rose_tea
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/rosa_petals_dried)
	output = /datum/reagent/water/rosewater
	cooktime = STEW_COOKING_TIME / 4 // Ultra fast

/datum/stew_recipe/rose_tea_spiced
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/rosa_petals_spiced)
	output = /datum/reagent/water/rosewater_spiced
	cooktime = STEW_COOKING_TIME / 3

/datum/stew_recipe/coffee
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/coffeebeansroasted)
	output = /datum/reagent/consumable/caffeine/coffee
	cooktime = STEW_COOKING_TIME / 4

/datum/stew_recipe/coffee_spiced
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/coffeebeans_spiced)
	output = /datum/reagent/consumable/caffeine/coffee_spiced
	cooktime = STEW_COOKING_TIME / 3

/datum/stew_recipe/tea
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/tealeaves_ground)
	output = /datum/reagent/consumable/caffeine/tea
	cooktime = STEW_COOKING_TIME / 4

/datum/stew_recipe/tea_spiced
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/tealeaves_spiced)
	output = /datum/reagent/consumable/caffeine/tea_spiced
	cooktime = STEW_COOKING_TIME / 3

/datum/stew_recipe/chocolate_spiced
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/chocolate_spiced)
	output = /datum/reagent/consumable/spiced_chocolate
	cooktime = STEW_COOKING_TIME //longer than the other drinks

/datum/stew_recipe/chocolate
	inputs = list(/obj/item/reagent_containers/food/snacks/chocolate/slice, /obj/item/reagent_containers/food/snacks/chocolate)
	output = /datum/reagent/consumable/chocolate
	cooktime = STEW_COOKING_TIME / 2

/datum/stew_recipe/poppy_milk
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/poppy)
	output = /datum/reagent/consumable/poppy_milk
	cooktime = STEW_COOKING_TIME //longer than the other drinks

#undef STEW_COOKING_TIME
