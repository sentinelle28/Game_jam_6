extends AudioStreamPlayer


func _play():
	play(0)
	

func _on_finished() -> void:
	_play()
