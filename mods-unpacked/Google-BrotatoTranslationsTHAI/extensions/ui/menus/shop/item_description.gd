extends "res://ui/menus/shop/item_description.gd"

var _thai_font_data: DynamicFontData = null
var _font_22: DynamicFont = null
var _font_26: DynamicFont = null

func _ready() -> void:
	_init_fonts()
	_apply_all_fonts()

func _init_fonts() -> void:
	if _thai_font_data == null:
		_thai_font_data = load("res://mods-unpacked/Google-BrotatoTranslationsTHAI/resources/fonts/raw/Anybody-Medium.ttf")
		if _thai_font_data != null:
			_font_22 = DynamicFont.new()
			_font_22.font_data = _thai_font_data
			_font_22.add_fallback(_thai_font_data)
			_font_22.size = 22
			_font_22.outline_color = Color(0, 0, 0, 1)

			_font_26 = DynamicFont.new()
			_font_26.font_data = _thai_font_data
			_font_26.add_fallback(_thai_font_data)
			_font_26.size = 26
			_font_26.outline_size = 1
			_font_26.outline_color = Color(0, 0, 0, 1)

func _apply_all_fonts() -> void:
	_init_fonts()
	if _font_22 == null:
		return

	if _category != null:
		_category.add_font_override("font", _font_22)

	if _name != null:
		_name.add_font_override("font", _font_26)

func set_item(item_data: ItemParentData, player_index: int, item_count: = 1) -> void:
	_apply_all_fonts()
	.set_item(item_data, player_index, item_count)
	_apply_all_fonts()
