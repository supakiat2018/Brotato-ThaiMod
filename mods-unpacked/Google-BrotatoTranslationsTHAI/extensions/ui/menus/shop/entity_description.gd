extends "res://ui/menus/shop/entity_description.gd"

var _thai_font_data: DynamicFontData = null
var _font_25: DynamicFont = null
var _font_35: DynamicFont = null
var _font_60: DynamicFont = null

func _ready() -> void:
	_init_fonts()
	_apply_all_fonts()

func _init_fonts() -> void:
	if _thai_font_data == null:
		_thai_font_data = load("res://mods-unpacked/Google-BrotatoTranslationsTHAI/resources/fonts/raw/Anybody-Medium.ttf")
		if _thai_font_data != null:
			_font_25 = DynamicFont.new()
			_font_25.font_data = _thai_font_data
			_font_25.add_fallback(_thai_font_data)
			_font_25.size = 25
			_font_25.extra_spacing_top = 1
			_font_25.extra_spacing_bottom = 1
			_font_25.outline_color = Color(0, 0, 0, 1)

			_font_35 = DynamicFont.new()
			_font_35.font_data = _thai_font_data
			_font_35.add_fallback(_thai_font_data)
			_font_35.size = 35
			_font_35.outline_color = Color(0, 0, 0, 1)

			_font_60 = DynamicFont.new()
			_font_60.font_data = _thai_font_data
			_font_60.add_fallback(_thai_font_data)
			_font_60.size = 60
			_font_60.outline_size = 2
			_font_60.outline_color = Color(0, 0, 0, 1)

func _apply_all_fonts() -> void:
	_init_fonts()
	if _font_25 == null:
		return

	if _behaviourDesc != null:
		_behaviourDesc.add_font_override("font", _font_25)
	if _behaviourDesc_scrolled != null:
		_behaviourDesc_scrolled.add_font_override("font", _font_25)
	if _subtitle != null:
		_subtitle.add_font_override("font", _font_35)
	if _name != null:
		_name.add_font_override("font", _font_60)

func set_item(item_data: ItemEntity, player_index: int, item_count: = 1) -> void:
	_apply_all_fonts()
	.set_item(item_data, player_index, item_count)
	_apply_all_fonts()
	if _behaviourDesc != null and item_data != null:
		_behaviourDesc.text = tr(item_data.behaviour_description)
	if _behaviourDesc_scrolled != null and item_data != null:
		_behaviourDesc_scrolled.text = tr(item_data.behaviour_description)
