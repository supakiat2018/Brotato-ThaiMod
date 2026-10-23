extends "res://ui/menus/pages/language_button.gd"

func _ready() -> void:
	if ProgressData != null and not "th" in ProgressData.languages:
		ProgressData.languages.push_back("th")

	clear()
	for language in ProgressData.languages:
		var lang_key = Utils.get_lang_key(language)
		add_item(tr(lang_key))

	if ProgressData != null and ProgressData.settings != null:
		for idx in range(ProgressData.languages.size()):
			if ProgressData.languages[idx] == ProgressData.settings.language:
				select(idx)
				break
