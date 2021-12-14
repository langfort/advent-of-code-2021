extends Reference


var data: Array = []
var result: int = 0


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
	print("Day 7 Part 1 result: %d" % result)


func _process_input() -> void:
	var max_position: int = data.max()
	var min_position: int = data.min()
	result = INF
	for i in range(min_position, max_position):
		var sum: int = 0
		for position in data:
			sum += abs(i - position)
		if sum < result:
			result = sum
