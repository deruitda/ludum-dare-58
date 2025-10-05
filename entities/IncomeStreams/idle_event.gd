extends Node
class_name IdleEvent

@export var idle_event_name: String = ""
@export var chance_of_failure: float = .5
@export var idle_description: String = ""

@onready var has_attempted_success_this_week = false

func _ready() -> void:
	SignalBus.week_changed.connect(_on_week_changed)

func attempt() -> void:
	has_attempted_success_this_week = true

func _on_week_changed() -> void:
	has_attempted_success_this_week = false
