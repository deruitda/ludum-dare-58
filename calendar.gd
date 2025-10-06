extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var is_playing: bool = false
@onready var label: Label = $Label

func _process(delta: float) -> void:
	var week = GameState.current_week
	label.text = "Week " + str(week)

func _on_area_2d_mouse_entered() -> void:
	if !is_playing:
		play("highlighted")


func _on_area_2d_mouse_exited() -> void:
	if !is_playing:
		play("default")
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		is_playing = true
		area_2d.visible = false
		audio_stream_player_2d.play(0)
		GameManager.progress_to_next_week()
		play("flip")

func _on_animation_finished() -> void:
	if animation == "flip":
		area_2d.visible = true
		
	is_playing = false
