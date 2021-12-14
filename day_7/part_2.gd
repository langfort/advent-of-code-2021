extends Reference


var data: Array = []
var result: int = 0
var point_map: Dictionary = {}


func _ready() -> void:
	pass


func start() -> void:
	_load_input()
	_process_input()
	_output_result()


func _load_input() -> void:
	var file: File = File.new()
	file.open("res://day_7/input", File.READ)
	var line_data: PoolStringArray = file.get_line().split(",")
	for number in line_data:
		data.push_back(number.to_int())


func _output_result() -> void:
	print("Day 7 Part 2 result: %d" % result)


func _process_input() -> void:
	var max_position: int = data.max()
	var min_position: int = data.min()
	result = INF

	# Create map of steps to other horizontal lines from position.
	for position in data:
		var max_steps: int = max(position - min_position, max_position - position)
		var point: Vector2 = Vector2(position, 0)
		point_map[point] = 0
		for i in range(1, max_steps + 1):
			point = Vector2(position, i)
			point_map[point] = point_map[Vector2(position, i-1)] + i

	# Tally lowest horizontal line.
	for i in range(min_position, max_position + 1):
		var sum: int = 0
		for position in data:
			var steps: int = abs(i - position)
			var point: Vector2 = Vector2(position, steps)
			sum += point_map[point]
		if sum < result:
			result = sum
