extends Area2D

@export var inventory:Inventory
@export var build_zone:ZoneToBuild

var selected_piece:Piece
var can_build:bool = false

func _ready() -> void:
	build_zone.connect("mouse_entered",_enter_build_zone)
	build_zone.connect("mouse_exited",_exit_build_zone)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	_take_piece(delta)


func _on_body_entered(body: Node2D) -> void:
	if body is Piece:
		selected_piece = body

func _on_body_exited(body: Node2D) -> void:
	if body == selected_piece:
		selected_piece = null

func _take_piece(delta:float)->void:
	if selected_piece!= null:
		if Input.is_action_pressed("pick_up"):
			
			selected_piece.global_position.x = lerp(selected_piece.global_position.x,global_position.x,delta)
			selected_piece.global_position.y = lerp(selected_piece.global_position.y,global_position.y,delta)
		elif Input.is_action_just_released("pick_up"):
			if not can_build or selected_piece.colliding():
				inventory._add_child(selected_piece)
				selected_piece = null
			else:
				selected_piece.global_position = global_position
				build_zone._add_child(selected_piece)
				selected_piece = null

func _enter_build_zone()->void:
	can_build = true
	
func _exit_build_zone()->void:
	can_build = false
