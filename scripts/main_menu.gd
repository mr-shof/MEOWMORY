extends Control

func _on_play_button_pressed() -> void:
	get_tree().current_scene.get_node("HappySound").play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://Level1.tscn")

func _on_how_to_play_button_pressed() -> void:
	$ClickSound.play()
	
	$HowToPlayPanel.visible = true

	$Title.visible = false
	$Subtitle.visible = false
	$PlayButton.visible = false
	$HowToPlayButton.visible = false
	$Cat.visible = false

func _on_back_button_pressed() -> void:
	$ClickSound.play()
	
	$HowToPlayPanel.visible = false

	$Title.visible = true
	$Subtitle.visible = true
	$PlayButton.visible = true
	$HowToPlayButton.visible = true
	$Cat.visible = true
