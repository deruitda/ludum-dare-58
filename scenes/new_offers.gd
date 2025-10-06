extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var isPlaying: bool = false

func _ready() -> void:
	SignalBus.offers_closed.connect(place_offers)

func place_offers() -> void:
	if !isPlaying:
		audio_stream_player_2d.play(0)
		play("me_give")

func _on_area_2d_mouse_entered() -> void:
	play("highlight")


func _on_area_2d_mouse_exited() -> void:
	if !isPlaying:
		play("default")


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && !isPlaying:
		isPlaying = true
		area_2d.visible = false
		audio_stream_player_2d.play(0)
		play("me_take")
		

func _on_animation_finished() -> void:
	if animation == "me_take":
		SignalBus.offers_button_press_done.emit()
		
	if animation == "me_give":
		area_2d.visible = true
		
	isPlaying = false
