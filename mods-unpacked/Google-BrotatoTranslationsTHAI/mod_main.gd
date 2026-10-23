extends Node

const MOD_DIR = "Google-BrotatoTranslationsTHAI/"
const LOG_NAME = "BrotatoTranslationsTHAI"

var _p_progress_data = preload("res://singletons/progress_data.gd")
var _p_language_button = preload("res://ui/menus/pages/language_button.gd")
var _p_item_description = preload("res://ui/menus/shop/item_description.gd")
var _p_entity_description = preload("res://ui/menus/shop/entity_description.gd")

var dir = ""
var ext_dir = ""
var trans_dir = ""

func _init():
	ModLoaderLog.info("Init", LOG_NAME)
	dir = ModLoaderMod.get_unpacked_dir() + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"

	# 1. Replace all fonts dynamically in memory with our Thai Font
	replace_fonts_preload()

	# 2. Install Extensions
	ModLoaderMod.install_script_extension(ext_dir + "singletons/progress_data.gd")
	ModLoaderMod.install_script_extension(ext_dir + "ui/menus/pages/language_button.gd")
	ModLoaderMod.install_script_extension(ext_dir + "ui/menus/shop/item_description.gd")
	ModLoaderMod.install_script_extension(ext_dir + "ui/menus/shop/entity_description.gd")

	# 3. Add Translations
	ModLoaderMod.add_translation(trans_dir + "translations.th.translation")
	ModLoaderMod.add_translation(trans_dir + "translations_dlc_1.th.translation")

func _ready() -> void:
	if ProgressData != null and not "th" in ProgressData.languages:
		ProgressData.languages.push_back("th")
	replace_fonts_preload()
	ModLoaderLog.info("Ready - BrotatoTranslationsTHAI active!", LOG_NAME)

func replace_fonts_preload() -> void:
	var font_resources = [
		preload("res://resources/fonts/actual/base/font_22.tres"),
		preload("res://resources/fonts/actual/base/font_26.tres"),
		preload("res://resources/fonts/actual/base/font_26_outline.tres"),
		preload("res://resources/fonts/actual/base/font_26_outline_thick.tres"),
		preload("res://resources/fonts/actual/base/font_32_outline.tres"),
		preload("res://resources/fonts/actual/base/font_35_outline.tres"),
		preload("res://resources/fonts/actual/base/font_40_outline.tres"),
		preload("res://resources/fonts/actual/base/font_40_outline_thick.tres"),
		preload("res://resources/fonts/actual/base/font_60_outline.tres"),
		preload("res://resources/fonts/actual/base/font_100_outline.tres"),
		preload("res://resources/fonts/actual/base/font_button.tres"),
		preload("res://resources/fonts/actual/base/font_menus.tres"),
		preload("res://resources/fonts/actual/base/font_smallest_text.tres"),
		preload("res://resources/fonts/actual/base/font_very_smallest_text.tres"),
	]

	var font_path = "res://mods-unpacked/" + MOD_DIR + "resources/fonts/raw/Anybody-Medium.ttf"
	var replacement_font = load(font_path)

	if replacement_font != null:
		for font_res in font_resources:
			if font_res != null:
				font_res.font_data = replacement_font
				font_res.add_fallback(replacement_font)
				ModLoaderLog.info("Replaced font: " + font_res.resource_path, LOG_NAME)
	else:
		ModLoaderLog.error("Failed to load Thai font at: " + font_path, LOG_NAME)
