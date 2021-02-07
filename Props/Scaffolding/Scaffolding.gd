 extends Spatial

var has_finished_spwaning = false

func _on_Timer_timeout() -> void:
	queue_free()


func _on_ScaffoldPole_sleeping_state_changed() -> void:
	if not $ScaffoldPole.sleeping and has_finished_spwaning:
		$Timer.start()
	else:
		has_finished_spwaning = true
