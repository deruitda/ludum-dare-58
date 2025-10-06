extends Control
class_name CapacityLabel

@export var capacity_value: CapacityValue

@onready var current_capacity_label: StatLabel = $CurrentCapacityLabel
@onready var current_capacity_label_component: LabelComponent = $CurrentCapacityLabel/CurrentCapacityLabelComponent

@onready var total_capacity_needed_label: StatLabel = $TotalCapacityNeededLabel
@onready var total_capacity_label_component: LabelComponent = $TotalCapacityNeededLabel/TotalCapacityLabelComponent

func set_capacity_value(capacity_value: CapacityValue) -> void:
	current_capacity_label_component.neutral_threshold = capacity_value.total_val
	
	current_capacity_label.set_value(capacity_value.current_val)
	total_capacity_needed_label.set_value(capacity_value.total_val)
