extends Node2D

@export var note_scene: PackedScene  # Note.tscn 파일을 인스펙터에서 할당할 수 있도록 설정
var spawn_interval = 1.0  # 노트 생성 간격 (초 단위)
var spawn_timer = 0.0  # 타이머 변수

func _process(delta):
	# 매 프레임마다 타이머를 줄이고, 0 이하가 되면 노트를 생성
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_note()
		spawn_timer = spawn_interval  # 타이머 초기화

func spawn_note():
	# note_scene이 설정되어 있으면 노트를 인스턴스화하고 메인 씬에 추가
	if note_scene:
		var note_instance = note_scene.instantiate()
		note_instance.position = Vector2(100, 100)  # 노트가 나타날 위치
		add_child(note_instance)
