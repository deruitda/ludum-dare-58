extends Node2D
class_name DeskButton

@export var button: Button
@export var open_scene: PackedScene

@export var sprite: Sprite2D
@export var highlighted_sprite: Sprite2D

signal button_pressed(packed_scene: PackedScene)

func _ready() -> void:
	button.button_down.connect(_on_button_down)
	button.button_up.connect(_on_button_up)
	button.mouse_entered.connect(_on_mouse_entered)
	button.mouse_exited.connect(_on_mouse_exited)
	
func set_highlighted() -> void:
	sprite.visible = false
	highlighted_sprite.visible = true
	
func set_not_highlighted() -> void:
	sprite.visible = true
	highlighted_sprite.visible = false

func _on_mouse_entered() -> void:
	set_highlighted()


func _on_mouse_exited() -> void:
	set_not_highlighted()

func _on_button_up() -> void:
	set_highlighted()
	button_pressed.emit(open_scene)


func _on_button_down() -> void:
	set_not_highlighted()
