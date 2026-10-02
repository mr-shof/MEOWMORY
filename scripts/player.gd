extends CharacterBody2D

const CELL_SIZE = 96

var can_move := false
var failed := false

var cat_normal = preload("res://assets/Cat1.png")
var cat_walk = preload("res://assets/Cat2.png")
var cat_fish = preload("res://assets/Cat4.png")
var cat_fail = preload("res://assets/Cat5.png")

func _ready():
	$Sprite2D.texture = cat_normal
	
func set_normal_sprite():
	$Sprite2D.texture = cat_walk
	
func set_fish_sprite():
	$Sprite2D.texture = cat_fish

func _process(delta):
	if not can_move:
		return

	if failed:
		return
	if Input.is_action_just_pressed("move_up"):
		move(Vector2(0, -CELL_SIZE))

	if Input.is_action_just_pressed("move_down"):
		move(Vector2(0, CELL_SIZE))

	if Input.is_action_just_pressed("move_left"):
		move(Vector2(-CELL_SIZE, 0))

	if Input.is_action_just_pressed("move_right"):
		move(Vector2(CELL_SIZE, 0))


func move(direction):
	if test_move(transform, direction):
		fail_game()
		return

	position += direction
	get_tree().current_scene.get_node("MoveSound").play()
	
func fail_game():
	failed = true
	can_move = false
	
	get_tree().current_scene.get_node("BonkSound").play()
	$Sprite2D.texture = cat_fail
	
	await get_tree().create_timer(0.15).timeout
	
	get_tree().current_scene.get_node("FailSound").play()
	
	print("FAILED! YOU HIT THE WALL!")
	
	var fail_panel = get_tree().current_scene.get_node("UI/FailPanel")
	fail_panel.visible = true
