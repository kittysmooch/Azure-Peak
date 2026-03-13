/datum/book_entry/miracle_compendium
	abstract_type = /datum/book_entry/miracle_compendium
	category = "All Gods"

/proc/cleric_tier_to_string(tier_val)
	switch(tier_val)
		if(-1)
			return "Orison"
		if(0)
			return "Tier 0"
		if(1)
			return "Tier 1"
		if(2)
			return "Tier 2"
		if(3)
			return "Tier 3"
		if(4)
			return "Tier 4"
	return "Unknown"

/proc/generate_patron_miracle_html(datum/patron/patron_instance)
	var/html = ""
	html += "<h2>[patron_instance.name]</h2>"
	html += "<p><b>Domain:</b> [patron_instance.domain]</p>"
	html += "<p><i>[patron_instance.desc]</i></p>"
	html += "<p><b>Worshippers:</b> [patron_instance.worshippers]</p>"

	if(!length(patron_instance.miracles))
		html += "<p>No miracles recorded for this patron.</p>"
		return html

	html += {"<table>
		<tr>
			<th>Miracle</th>
			<th>Tier</th>
			<th>Description</th>
		</tr>
	"}

	var/list/by_tier = list()
	for(var/miracle_path in patron_instance.miracles)
		var/tier = patron_instance.miracles[miracle_path]
		if(!by_tier["[tier]"])
			by_tier["[tier]"] = list()
		by_tier["[tier]"] += miracle_path

	var/list/tier_order = list("-1", "0", "1", "2", "3", "4")
	for(var/tier_key in tier_order)
		var/list/tier_spells = by_tier[tier_key]
		if(!length(tier_spells))
			continue
		var/tier_label = cleric_tier_to_string(text2num(tier_key))
		for(var/miracle_path in tier_spells)
			var/m_name = initial(miracle_path:name) || "Unknown"
			var/m_desc = initial(miracle_path:desc) || "No description."
			html += "<tr><td><b>[m_name]</b></td><td>[tier_label]</td><td>[m_desc]</td></tr>"

	html += "</table>"
	return html

/datum/book_entry/miracle_compendium/astrata
	name = "Astrata"
	category = "Divine"

/datum/book_entry/miracle_compendium/astrata/inner_book_html(mob/user)
	var/datum/patron/divine/astrata/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/necra
	name = "Necra"
	category = "Divine"

/datum/book_entry/miracle_compendium/necra/inner_book_html(mob/user)
	var/datum/patron/divine/necra/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/dendor
	name = "Dendor"
	category = "Divine"

/datum/book_entry/miracle_compendium/dendor/inner_book_html(mob/user)
	var/datum/patron/divine/dendor/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/abyssor
	name = "Abyssor"
	category = "Divine"

/datum/book_entry/miracle_compendium/abyssor/inner_book_html(mob/user)
	var/datum/patron/divine/abyssor/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/noc
	name = "Noc"
	category = "Divine"

/datum/book_entry/miracle_compendium/noc/inner_book_html(mob/user)
	var/datum/patron/divine/noc/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/eora
	name = "Eora"
	category = "Divine"

/datum/book_entry/miracle_compendium/eora/inner_book_html(mob/user)
	var/datum/patron/divine/eora/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/pestra
	name = "Pestra"
	category = "Divine"

/datum/book_entry/miracle_compendium/pestra/inner_book_html(mob/user)
	var/datum/patron/divine/pestra/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/ravox
	name = "Ravox"
	category = "Divine"

/datum/book_entry/miracle_compendium/ravox/inner_book_html(mob/user)
	var/datum/patron/divine/ravox/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/malum
	name = "Malum"
	category = "Divine"

/datum/book_entry/miracle_compendium/malum/inner_book_html(mob/user)
	var/datum/patron/divine/malum/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/xylix
	name = "Xylix"
	category = "Divine"

/datum/book_entry/miracle_compendium/xylix/inner_book_html(mob/user)
	var/datum/patron/divine/xylix/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/zizo
	name = "Zizo"
	category = "Inhumen"

/datum/book_entry/miracle_compendium/zizo/inner_book_html(mob/user)
	var/datum/patron/inhumen/zizo/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/graggar
	name = "Graggar"
	category = "Inhumen"

/datum/book_entry/miracle_compendium/graggar/inner_book_html(mob/user)
	var/datum/patron/inhumen/graggar/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/baotha
	name = "Baotha"
	category = "Inhumen"

/datum/book_entry/miracle_compendium/baotha/inner_book_html(mob/user)
	var/datum/patron/inhumen/baotha/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/matthios
	name = "Matthios"
	category = "Inhumen"

/datum/book_entry/miracle_compendium/matthios/inner_book_html(mob/user)
	var/datum/patron/inhumen/matthios/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/undivided
	name = "Undivided Pantheon"
	category = "Divine"

/datum/book_entry/miracle_compendium/undivided/inner_book_html(mob/user)
	var/datum/patron/divine/undivided/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html

/datum/book_entry/miracle_compendium/psydon
	name = "Psydon"
	category = "Psydon"

/datum/book_entry/miracle_compendium/psydon/inner_book_html(mob/user)
	var/datum/patron/old_god/P = new()
	var/html = "<div>[generate_patron_miracle_html(P)]</div>"
	qdel(P)
	return html
