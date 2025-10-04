extends Label
class_name WeekLabel

func _ready() -> void:
	on_week_changed(GameState.total_money)
	SignalBus.week_changed.connect(on_week_changed)
	
func on_week_changed(new_amount: int) -> void:
	text = "Week " + str(new_amount)
