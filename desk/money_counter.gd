extends Sprite2D
class_name MoneyCounter

@export var money_label: Label

func _ready() -> void:
	on_money_changed(GameState.total_money)
	SignalBus.money_changed.connect(on_money_changed)
	
func on_money_changed(new_amount: int) -> void:
	money_label.text = "$" + str(new_amount)
