extends TextureRect
@onready var objective_button: TextureRect = $ObjectiveButton
@onready var how_to: TextureRect = $HowTo
@onready var x_button: TextureButton = $"X-Button"

func _on_play_pressed() -> void:
	visible = false
	x_button.disabled = true

func _on_x_button_pressed() -> void:
	x_button.visible = false
	how_to.visible = false
	objective_button.visible = false
	x_button.disabled = true


func _on_objective_pressed() -> void:
	x_button.visible = true
	objective_button.visible = true
	x_button.disabled = false


func _on_how_to_pressed() -> void:
	x_button.visible = true
	how_to.visible = true
	x_button.disabled = false
