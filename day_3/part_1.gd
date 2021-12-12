extends Reference


var data: Array = []
var gamma_rate: Array = []
var epsilon_rate: Array = []
var counters: Array = []
var result: int = 0


func _ready() -> void:
	pass


func start() -> void:
	_load_input()
	_process_input()
	_output_result()


func _load_input() -> void:
	var file: File = File.new()
	file.open("res://day_3/input", File.READ)
	var line: String = file.get_line()
	while line != "":
		data.push_back(line)
		line = file.get_line()


func _output_result() -> void:
	print("Day 3 Part 1 result: %d" % result)


func _process_input() -> void:
	# Initialize arrays
	for value in data[0]:
		counters.push_back(0)
		gamma_rate.push_back(0)
		epsilon_rate.push_back(0)
	for value in data:
		for i in range(value.length()):
			counters[i] += value[i].to_int()
	var mid_point: int = (data.size() + 1) / 2
	for i in range(counters.size()):
		if counters[i] > mid_point:
			gamma_rate[i] = 1
			epsilon_rate[i] = 0
		else:
			gamma_rate[i] = 0
			epsilon_rate[i] = 1
	result = _binary_to_decimal(gamma_rate) * _binary_to_decimal(epsilon_rate)


func _binary_to_decimal(binary: Array) -> int:
	binary.invert()
	var decimal_value: int = binary[0]
	for i in range(1, binary.size()):
		decimal_value += binary[i] * pow(2, i)
	return decimal_value
