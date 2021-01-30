extends RigidBody

var has_finishing_spawing = false

func _on_Timer_timeout() -> void:
	queue_free()
	
	



func _on_Cone__body_entered(body: Node) -> void:
	if not $AudioStreamPlayer3D.playing:
		$AudioStreamPlayer3D.play()


func _on_Cone__sleeping_state_changed() -> void:
	if not sleeping and has_finishing_spawing:
		$Timer.start()
	else:
		has_finishing_spawing = true
