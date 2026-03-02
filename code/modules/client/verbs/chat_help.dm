/client/verb/chat_help()
	set name = "Chat Help"
	set category = "OOC"
	set desc = "View a guide to chat features and formatting."

	var/dat = {"
		<b>Speech Modes (Prefix):</b><br>
		no prefix - Normal speech, heard within 7 tiles.<br>
		<b>#</b> - Whisper. Quiet speech, only heard within 1 tile. Others can see you whispering.<br>
		<b>%</b> - Singing. Wraps your message in musical notes.<br>
		<br>
		<b>Custom Emotes:</b><br>
		<b>Me</b> - Custom emote (verb panel or type <b>*your action here</b>). Up to 2048 characters. Starts with your character's name <br>
		<b>Me (big)</b> - Same as Me but allows up to 4096 characters and multi-line input. Found in the IC verb tab. You can make a custom keybind. <br>
		<b>Subtle</b> - Type <b>@your action here</b>. Can be used for both Me and Me (Big) Only seen by nearby targets you select.<br>
		<br>
		<b>Text Formatting:</b><br>
		<b>+text+</b> makes text <b>bold</b>.<br>
		<b>|text|</b> makes text <i>italic</i>.<br>
		<b>_text_</b> makes text <u>underlined</u>.<br>
		<b>$n</b> - Places your character's name where you want it in an emote instead of at the start. e.g. <i>With a thud, $n falls over.</i><br>
		<br>
		<b>Tips:</b><br>
		- The Subtle emote (<b>@</b>) lets you pick who sees it and from what range.<br>
		- Emotes are also available in the <b>Emotes</b> and <b>Noises</b> verb tabs.
	"}

	var/datum/browser/popup = new(usr, "chathelp", "Chat Help", 500, 900)
	popup.set_content(dat)
	popup.open(use_onclose = FALSE)
