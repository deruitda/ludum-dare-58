extends Control
class_name IncomeDataRow

signal on_detail_button_press(income_stream: IncomeStream)
@onready var income_stream: IncomeStream
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var description_label: Label = $IncomeDataRow/DescriptionLabel
@onready var status_texture: TextureRect = $IncomeDataRow/StatusTexture
const CHECKMARK = preload("uid://cilctlpeg2wh6")
const EXCLAIMATION_POINT = preload("uid://cac1f0t3syfxs")

func _ready() -> void:
	SignalBus.week_changed.connect(refresh)
	SignalBus.money_changed.connect(refresh)
	
func set_income_stream(new_income_stream: IncomeStream) -> void:
	income_stream = new_income_stream
	refresh()

func refresh():
	if income_stream == null:
		return
	description_label.text = income_stream.income_stream_name
	if income_stream.is_idle():
		status_texture.texture = EXCLAIMATION_POINT
		status_texture.tooltip_text = "This income stream has been interrupted and you must resolve it. Hit the arrow to dig into the details."
	else:
		status_texture.texture = CHECKMARK
		status_texture.tooltip_text = "This income stream is making money!!!"
		
	#progress_bar.value = (income_stream.active_weeks_transpired / income_stream.duration_in_weeks) * 100

func _on_details_button_button_up() -> void:
	on_detail_button_press.emit(income_stream)
	pass # Replace with function body.
