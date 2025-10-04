extends Node

class_name Worker

@export var total_capacity: int = 1
@export var experience: int = 0
@export var worker_name: String = ""
@export var worker_type: WorkerTypeResource

func gain_experience(amount: int) -> void:
	experience = experience + amount
	
