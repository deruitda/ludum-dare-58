extends VBoxContainer
class_name FinalReport

@export var total_respect_label: StatLabel
@export var total_money_label: StatLabel
@export var total_weeks_label: StatLabel

func _ready() -> void:
	SignalBus.game_over.connect(_on_game_over)
	
func _on_game_over():
	total_respect_label.set_value(GameState.total_respect)
	total_money_label.set_value(GameState.total_money)
	total_weeks_label.set_value(GameManager.get_current_week())
