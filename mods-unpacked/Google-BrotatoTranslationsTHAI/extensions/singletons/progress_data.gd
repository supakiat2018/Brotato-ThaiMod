extends "res://singletons/progress_data.gd"

func _init() -> void:
	if not "th" in languages:
		languages.push_back("th")

func init_data() -> void:
	.init_data()
	if not "th" in languages:
		languages.push_back("th")
