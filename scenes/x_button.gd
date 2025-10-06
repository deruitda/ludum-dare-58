extends TextureButton

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		pressed.emit()
