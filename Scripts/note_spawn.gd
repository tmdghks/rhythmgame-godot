extends Node2D

@export var note_scene: PackedScene
@export var target_position: Vector2 = Vector2(-100, 540)
var spawn_interval = 1.0
var spawn_timer = 0.0
var notes = []  # 생성된 노트들을 저장하는 배열
var judgment_line  # JudgmentLine 노드 참조를 위한 변수
var judgment_distance: float = 200.0  # 노트가 판정선과 가까운지 확인하는 거리 기준
var good_distance: float = 100.0
var note_speed: float = 400.0  # 노트가 목표 지점으로 이동하는 속도
var was_space_pressed = false # 스페이스가 전에 눌렸는지 확인

func _ready():
	# JudgmentLine 노드를 참조하여 변수에 저장	
	judgment_line = $Static_Sprites/JudgeLine	  # 정확한 경로로 수정
	print(judgment_line)  # 올바른 노드가 참조되는지 확인

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_note()
		spawn_timer = spawn_interval

	# 스페이스바가 처음 눌렸을 때만 판정 수행
	if Input.is_key_pressed(KEY_SPACE):
		if not was_space_pressed:
			check_note_judgment()
			was_space_pressed = true  # 스페이스바가 눌렸음을 기록
	else:
		was_space_pressed = false  # 스페이스바가 떼어진 상태로 초기화

func spawn_note():
	if note_scene:
		var note_instance = note_scene.instantiate()
		note_instance.position = Vector2(2000, 540)  # 노트의 초기 위치 설정
		add_child(note_instance)
		notes.append(note_instance)  # 생성된 노트를 배열에 추가

func check_note_judgment():
	if notes.size() == 0:
		return  # notes 배열이 비어 있으면 함수 종료

	var closest_note = null
	var closest_distance = 100  # 가장 멀리 간 노트를 찾기 위해 초기값을 음수로 설정

	# 모든 노트를 검사하여 판정선과 가장 멀리 간 노트를 찾음
	for note in notes:
		if note == null:
			print("Note is null.")
			continue

		# Note is not null, proceed with distance calculation
		var distance = judgment_line.position.x - note.position.x
		if distance >= -judgment_distance and distance <= judgment_distance:
			if distance <= closest_distance:
				closest_distance = distance
				closest_note = note

	# 가장 가까운 노트에 대해 판정을 수행
	if closest_note:
		closest_note.queue_free()
		if abs(closest_distance) <= good_distance:
			note_judged(closest_note, "success")
		else:
			note_judged(closest_note, "failed")
	else:
		print("Not yet")

func note_judged(note, status):
	# 판정 성공 처리 (노트 제거 및 점수 증가)
	note.queue_free()
	notes.erase(note)
	if status == "failed":
		maintain_score()
	elif status == "success":
		increase_score()
	else:
		print("impossible")

func increase_score():
	# 점수 증가 처리
	print("Note judged! Score increased.")

func maintain_score():
	# 점수 그대로
	print("Note judged! Score maintained.")
