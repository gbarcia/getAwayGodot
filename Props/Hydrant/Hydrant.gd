extends Spatial

var has_finished_spwaning = false



func _on_Timer_timeout() -> void:
	queue_free()


func _on_Area_body_entered(body: Node) -> void:
	$CarPusher/AnimationPlayer.play("CarPush")


func _on_FireHydrant__sleeping_state_changed() -> void:
	if not $"FireHydrant ".sleeping and has_finished_spwaning:
		$Particles.emitting = true
		$Timer.start()
	else:
		has_finished_spwaning = true
