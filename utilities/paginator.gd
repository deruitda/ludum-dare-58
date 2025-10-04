extends Node
class_name Paginator

@onready var items: Array = []
@onready var current_index: int = 1

func set_items(new_items: Array) -> void:
	items = new_items

func get_current_item() -> Node:
	if len(items) - 1 < current_index:
		current_index = len(items) - 1
	return items.get(current_index) as Node

func paginate_right() -> void:
	var total_count = len(items)
	
	if current_index == total_count - 1:
		current_index = 0
	else:
		current_index = current_index + 1

func paginate_left() -> void:
	
	var total_count = len(items)
	if current_index == 0:
		current_index = total_count - 1
	else:
		current_index = current_index - 1
		
func has_items() -> bool:
	return len(items) > 0
