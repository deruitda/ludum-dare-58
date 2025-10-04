extends Node
class_name CapacityManager

func create_vacant_capacity_item():
	var capacity = Capacity.new()
	add_child(capacity)
