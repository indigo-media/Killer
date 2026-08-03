@tool
extends Node

func _ready() -> void:
	if Engine.is_editor_hint():
		var settings := EditorInterface.get_editor_settings()
		settings.set_setting("interface/theme/base_color", Color.GHOST_WHITE)
		settings.set_setting("interface/theme/accent_color", Color.WHITE)
		settings.set_setting("interface/theme/contrast", 0)
		settings.set_setting("interface/editor/localization/editor_language", "ru")
		settings.set_setting("interface/accessibility/accessibility_support", 1)
