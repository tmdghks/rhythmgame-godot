extends Node


func say_hello():
	print("안녕하세요!")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	say_hello() # 함수 호출



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
