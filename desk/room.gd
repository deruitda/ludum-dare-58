extends Node2D
class_name Room

@onready var binder: Binder = $Binder
@onready var week_label: Label = $WeekLabel
@onready var close_offers: TextureButton = $CloseOffers
@onready var money_counter: MoneyCounter = $Background/MoneyCounter
@export var disable_things: Control
@onready var camera_2d: Camera2D = $Camera2D
@onready var background: AnimatedSprite2D = $Background
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Background/AudioStreamPlayer2D
@onready var music: AudioStreamPlayer2D = $Music

const LUDUM_DARE_58_DEATH_MUSIC_ANA = preload("uid://7jd2st33r02j")


var pan_speed = 3
var pan_up = false
var pan_down = false
var camera_y_max = -319.0
var camera_y_min = 320.0
var is_panning = false
var is_game_over = false

func _ready() -> void:
	SignalBus.game_over.connect(begin_game_over)
	SignalBus.week_changed.connect(trigger_week_change)
	set_week_label()
	begin_game_over()

func _process(delta: float) -> void:
	
	if !is_game_over && !is_panning && Input.is_key_pressed(KEY_UP):
		pan_up = true
		is_panning = true
	elif !is_game_over && !is_panning && Input.is_key_pressed(KEY_DOWN):
		pan_down = true
		is_panning = true
	
	if pan_up:
		if camera_2d.position.y >= camera_y_max:
			camera_2d.position.y -= pan_speed
		else:
			pan_up = false
			is_panning = false
			camera_2d.position.y = camera_y_max
			if is_game_over:
				finish_game_over()
			
	if pan_down:
		if camera_2d.position.y <= camera_y_min:
			camera_2d.position.y += pan_speed
		else:
			pan_down = false
			is_panning = false
			camera_2d.position.y = camera_y_min

func begin_game_over() -> void:
	music.stop()
	disable_things.visible = true
	is_game_over = true
	begin_pan_up()

func begin_pan_up() -> void:
	if !is_panning:
		pan_up = true
		is_panning = true

func finish_game_over() -> void:
	background.play("game_over")

func set_week_label() -> void:
	if week_label:
		week_label.text = "Week " + str(GameState.current_week)

func _on_binder_button_button_pressed() -> void:
	binder.open_binder()
	pass # Replace with function body.
	
func trigger_week_change() -> void:
	disable_things.visible = true
	money_counter.play("count")
	
func end_week_change() -> void:
	disable_things.visible = false
	money_counter.play("default")


func _on_money_counter_animation_finished() -> void:
	if money_counter.animation == "count":
		end_week_change()


func _on_background_frame_changed() -> void:
	if background.animation != "game_over":
		return
		
	if background.frame == 32:
		audio_stream_player_2d.play(0)


func _on_background_animation_finished() -> void:
	if background.animation == "game_over":
		music.stream = LUDUM_DARE_58_DEATH_MUSIC_ANA
		music.play()
