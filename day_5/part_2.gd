extends Reference


var line_map: Dictionary = {}
var result: int = 0
var lines: Array = []


func _ready() -> void:
	pass


func start() -> void:
	_load_input()
	_process_input()
	_output_result()


func _load_input() -> void:
	var file: File = File.new()
	file.open("res://day_5/input", File.READ)
	while file.get_position() < file.get_len():
		var line_data: PoolStringArray = file.get_line().split(" ")
		var line: Array = []
		# Get start point
		var point_data: PoolStringArray = line_data[0].split(",")
		line.push_back(Vector2(point_data[0].to_int(), point_data[1].to_int()))
		# Get end point. Skip over arrow (->) in input at line_data[1].
		point_data = line_data[2].split(",")
		line.push_back(Vector2(point_data[0].to_int(), point_data[1].to_int()))
		lines.push_back(line)


func _output_result() -> void:
	print("Day 5 Part 2 result: %d" % result)


func _process_input() -> void:
	for line in lines:
		var start: Vector2 = Vector2(line[0].x, line[0].y)
		var end: Vector2 = Vector2(line[1].x, line[1].y)
		var point: Vector2 = start
		# Snap direction to values of 1 or 0.
		var direction = (end - start).normalized().snapped(Vector2.ONE)
		while point != end:
			_mark_map(point)
			point += direction
		# Mark final point.
		_mark_map(point)

	for value in line_map.values():
		if value >= 2:
			result += 1


func _mark_map(point: Vector2) -> void:
	if not line_map.has(point):
		line_map[point] = 0
	line_map[point] += 1
