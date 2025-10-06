extends Node2D
class_name DeskButton

@export var button: Button
@export var animated_sprite_2d: AnimatedSprite2D
var is_playing = false
signal button_pressed()

func _ready() -> void:
	button.button_down.connect(_on_button_down)
	button.button_up.connect(_on_button_up)
	button.mouse_entered.connect(_on_mouse_entered)
	button.mouse_exited.connect(_on_mouse_exited)
	SignalBus.binder_lowered.connect(place_binder)
	
func place_binder() -> void:
	is_playing = true
	visible = true
	animated_sprite_2d.play("give")
	
func set_highlighted() -> void:
	animated_sprite_2d.play("highlighted")
	
func set_not_highlighted() -> void:
	animated_sprite_2d.play("default")

func _on_mouse_entered() -> void:
	if !is_playing:
		set_highlighted()


func _on_mouse_exited() -> void:
	if !is_playing:
		set_not_highlighted()

func _on_button_up() -> void:
	is_playing = true
	animated_sprite_2d.play("take")


func _on_button_down() -> void:
	set_not_highlighted()


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "take":
		button_pressed.emit()
		visible = false
		is_playing = false
		
	if animated_sprite_2d.animation == "give":
		is_playing = false
		
	
