extends Reference


var data: Array = []
var counter: int = 0


func _ready() -> void:
	pass


func start() -> void:
	_load_input()
	_process_input()
	_output_result()


func _load_input() -> void:
	var file: File = File.new()
	file.open("res://day_1/input", File.READ)
	var content: PoolStringArray = file.get_as_text().split("\n", false)
	for string in content:
		data.push_back(string.to_int())


func _output_result() -> void:
	print("Day 1 Part 2 result: %d" % counter)


func _process_input() -> void:
	var sum_1: int = data[0] + data[1] + data[2]
	var sum_2: int = data[1] + data[2] + data[3]
	for i in range(3, data.size()-1):
		if sum_2 > sum_1:
			counter += 1
		sum_1 = sum_2
		sum_2 = data[i-1] + data[i] + data[i+1]
	if sum_2 > sum_1:
		counter += 1
