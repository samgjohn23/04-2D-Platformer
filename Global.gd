extends Node

var score = 0
var lives = 3
var level = 1
var health = 100
var max_health = 100

var fade = null
var fade_speed = 0.015

var fade_in = false
var fade_out = ""

var death_zone = 1000

func increase_score(s):
	score += s
	
func decrease_health(h):
	health -= h 
	
func decrease_lives(l):
	lives -= l
	health = max_health
	if lives <= 0:
		get_tree().change_scene("res://Levels/Game_Over.tscn")

func _physics_process(_delta):
	if fade == null:
		fade = get_node_or_null("/root/Game/Camera/Fade")
	if fade_out != "":
		execute_fade_out(fade_out)
	if fade_in:
		execute_fade_in()
		

func start_fade_in():
	if fade != null:
		fade.visible = true
		fade.color.a = 1
		fade_in = true

func start_fade_out(target):
	if fade != null:
		fade.color.a = 0
		fade.visible = true
		fade_out = target

func execute_fade_in():
	if fade != null:
		fade.color.a -= fade_speed
		if fade.color.a <= 0:
			fade_in = false

func execute_fade_out(target):
	if fade != null:
		fade.color.a += fade_speed
		if fade.color.a >= 1:
			fade_out = ""
			


func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
		
func _on_Portal_entered(body):
	if body.name == "Player":
		if name == "Exit_to_2":
			Global.level = 2
			get_tree().change_scene("res://Levels/Level2.tscn")
		if name == "Exit_to_3":
			Global.level = 3
			get_tree().change_scene("res://Levels/Game_Over2.tscn")

	
