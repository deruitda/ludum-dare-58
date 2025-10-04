extends Node2D
@export var candidate_manager: CandidateManager

func _ready() -> void:
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
	candidate_manager.generate_worker()
func _on_button_button_up() -> void:
	
	pass # Replace with function body.
