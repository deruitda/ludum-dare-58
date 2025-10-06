extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var isPlaying: bool = false
var isDisabled: bool = false

func _ready() -> void:
	SignalBus.offers_closed.connect(place_offers)
	SignalBus.offers_all_closed.connect(disable_button)
	SignalBus.week_changed.connect(reset_button)

func reset_button() -> void:
	isDisabled = false
	area_2d.visible = true
	play("default")
func disable_button() -> void:
	isDisabled = true

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
		if !isDisabled:
			area_2d.visible = true
		else:
			area_2d.visible = false
			play("disabled")
		
	isPlaying = false
