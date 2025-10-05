extends Node2D
class_name DeskButton

@export var button: Button
@export var animated_sprite_2d: AnimatedSprite2D

signal button_pressed()

func _ready() -> void:
	button.button_down.connect(_on_button_down)
	button.button_up.connect(_on_button_up)
	button.mouse_entered.connect(_on_mouse_entered)
	button.mouse_exited.connect(_on_mouse_exited)
	
func set_highlighted() -> void:
	animated_sprite_2d.play("highlighted")
	
func set_not_highlighted() -> void:
	animated_sprite_2d.play("default")

func _on_mouse_entered() -> void:
	set_highlighted()


func _on_mouse_exited() -> void:
	set_not_highlighted()

func _on_button_up() -> void:
	set_highlighted()
	button_pressed.emit()


func _on_button_down() -> void:
	set_not_highlighted()
