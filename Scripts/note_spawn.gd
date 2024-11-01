extends Node2D

@export var note_scene: PackedScene
@export var target_position: Vector2 = Vector2(100, 540)  # 판정선 위치 설정
var spawn_interval = 1.0
var spawn_timer = 0.0

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_note()
		spawn_timer = spawn_interval

func spawn_note():
	if note_scene:
		var note_instance = note_scene.instantiate()
		note_instance.position = Vector2(2000, 540)  # 노트가 생성될 위치
		note_instance.target_position = target_position  # 목표 위치 설정
		add_child(note_instance)
