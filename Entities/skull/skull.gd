extends AnimatedSprite2D

@onready var cooldown:Timer = $speaking_cooldown
var is_currently_speaking:bool = false
var next_text_to_say:Array[String] = []

func _ready() -> void:
	PlayerSignal.connect("random_walking",_random_walking)
	PlayerSignal.connect("select_piece",_took_piece)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _speak(message:String)->void:
	if is_currently_speaking:
		_queue_for_speak(message)
	else:
		_activate(message)
		_show_message(message)

func _queue_for_speak(message:String)->void:
	next_text_to_say.append(message)
	if len(next_text_to_say) > 4:
		next_text_to_say.erase(0)
	
func _show_message(message:String)->void:
	$Label.text = message

func _on_speaking_cooldown_timeout() -> void:
	is_currently_speaking = _check_queue()
	
func _check_queue()->bool:
	if len(next_text_to_say) != 0:
		_show_message(next_text_to_say[0])
		next_text_to_say.erase(0)
		if len(next_text_to_say) == 0:
			return false
	else:
		$Label.text = ""
	return true

func _random_walking()->void:
	_speak("Do not worry about the weirdness of the task \n perhaps you should focus on getting the job done ")

func _took_piece(piece:Piece)->void:
	_speak("Oh you took "+piece.name)
	
func _activate(message:String)->void:
	cooldown.start(len(message)/10)
	is_currently_speaking = true
