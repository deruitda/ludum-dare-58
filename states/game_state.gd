extends Node

@onready var total_money: int = 10000
@onready var total_respect: int = 0
@onready var current_week: int = 1

@onready var candidate_manager: CandidateManager
@onready var worker_manager: WorkerManager

func spend_money(amount: int) -> void:
	total_money = total_money - amount
	
func collect_money(amount: int) -> void:
	total_money = total_money + amount

func gain_respect(amount: int) -> void:
	total_respect = total_respect + amount
	
func lose_respect(amount: int) -> void:
	total_respect = total_respect - amount
