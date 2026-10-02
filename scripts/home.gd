extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		print("YOU FOUND HOME!")
		
		var win_panel = get_tree().current_scene.get_node("UI/WinPanel")
		get_tree().current_scene.get_node("CompleteSound").play()
		win_panel.visible = true
