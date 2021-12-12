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
	print("Day 1 Part 1 result: %d" % counter)


func _process_input() -> void:
	for i in range(1, data.size()):
		if data[i] > data[i-1]:
			counter += 1
