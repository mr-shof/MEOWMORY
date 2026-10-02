extends Node2D

var countdown := 5

func _ready():
	$UI/CountdownLabel.text = str(countdown)
	$CountdownTimer.start()

func _on_countdown_timer_timeout():
	countdown -= 1
	
	if countdown > 0:
		$UI/CountdownLabel.text = str(countdown)
	else:
		$UI/CountdownLabel.text = "GO!"
		$Map.visible = false
		$CountdownTimer.stop()
		
		$Player.can_move = true
		$Player.set_normal_sprite()
		
		await get_tree().create_timer(0.5).timeout
		$UI/CountdownLabel.visible = false
		
func restart_game():
	get_tree().reload_current_scene()

func _on_retry_button_pressed():
	get_tree().current_scene.get_node("ClickSound").play()
	await get_tree().create_timer(0.25).timeout
	restart_game()

func _on_next_button_pressed() -> void:
	get_tree().current_scene.get_node("ClickSound").play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://Level4.tscn")
