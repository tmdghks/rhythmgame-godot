extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var count = 0

	while count < 3:
		print("카운트: ", count)
		count += 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
