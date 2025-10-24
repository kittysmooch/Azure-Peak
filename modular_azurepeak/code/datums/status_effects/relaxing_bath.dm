/*Code for relaxing bath, which is a soft, "active roleplay" alternative to sleeping. 
Removes the tired moodlet, gives a triumph, gives dream points without opportunity of
dreaming. Go to sleep to learn skills.alist
Also gives campfire healing tickrate. 
*/

/mob/carbon/living/human/proc/relaxing_bath(source_type)
	var/bathing_spot = src.loc
