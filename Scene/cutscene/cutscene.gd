extends Node2D



func _on_cutscene_make_animation_finished(anim_name: StringName) -> void:
	SceneTransition._change_scene("res://Scene/GameplayScene/gameplay_scene.tscn")
