extends Reference


var data: Array = []
var position: int = 0
var depth: int = 0
var result: int = 0


func _ready() -> void:
	pass


func start() -> void:
	_load_input()
	_process_input()
	_output_result()


func _load_input() -> void:
	var file: File = File.new()
	file.open("res://day_2_dive/input", File.READ)
	var line: String = file.get_line()
	while line != "":
		var content: PoolStringArray = line.split(" ", false)
		data.push_back({
			"command": content[0],
			"distance": content[1].to_int(),
		})
		line = file.get_line()


func _output_result() -> void:
	print("Dive! part 1 result: %d" % result)


func _process_input() -> void:
	for i in range(data.size()):
		match data[i].command:
			"forward":
				position += data[i].distance
			"down":
				depth += data[i].distance
			"up":
				depth -= data[i].distance
	result = position * depth
