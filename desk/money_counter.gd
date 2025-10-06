extends AnimatedSprite2D
class_name MoneyCounter

@export var money_label: Label
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	on_money_changed()
	SignalBus.money_changed.connect(on_money_changed)
	
func on_money_changed() -> void:
	money_label.text = "$" + str(GameState.total_money)


func _on_animation_changed() -> void:
	if animation == "count":
		money_label.visible = false
		audio_stream_player_2d.play()


func _on_animation_finished() -> void:
	if animation == "count":
		money_label.visible = true
