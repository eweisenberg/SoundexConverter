extends Control

@onready var output: Label = $VBoxContainer/Output

func _on_input_text_changed(new_text: String):
	if new_text.length() < 2:
		output.text = ""
		return
	
	var outputStr: String = new_text[0].to_upper()
	var input: String = new_text.to_lower()
	
	for char in "fpv":
		input = input.replace(char, "b")
	for char in "gjkqsxz":
		input = input.replace(char, "c")
	input = input.replace("t", "d")
	input = input.replace("n", "m")
	for char in "eiou":
		input = input.replace(char, "a")
	for char in "wy":
		input = input.replace(char, "h")
	
	input = input[0] + input.substr(1).replace("h", "")
	
	for i in range(input.length() - 2, -1, -1):
		if input[i] == input[i + 1]:
			input = input.erase(i + 1)
	
	for i in range(input.length() - 3, -1, -1):
		if input[i] == input[i + 2] and input[i + 1] == "h":
			input = input.erase(i + 2)
	
	input = input.substr(1)
	var letterValues := {
		"a": "",
		"h": "",
		"b": "1",
		"c": "2",
		"d": "3",
		"l": "4",
		"m": "5",
		"r": "6"
	}
	for letter in letterValues:
		input = input.replace(letter, letterValues[letter])
	
	outputStr += input
	if outputStr.length() > 4:
		outputStr = outputStr.substr(0, 4)
	while outputStr.length() < 4:
		outputStr += "0"
	output.text = outputStr
