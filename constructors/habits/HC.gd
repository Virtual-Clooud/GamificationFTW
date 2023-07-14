extends Control
onready var H = preload("res://views/habits/H.tscn")
export var HDATA : Dictionary = {
	"nome": "AMOGKOK", "time": {"H": 30, "M": 20}, "done": false}
var H_path = "res://data/H/"
var file_count = 0
func Tinput(input_string: String) -> bool:
		var pattern = "\\d{2,}"  # Expressão regular para verificar pelo menos dois dígitos consecutivos

		var regex = RegEx.new()
		regex.compile(pattern)

		return regex.search(input_string) != null
# Criar novo recurso do tipo HR e setar tudo
func getFileCountInFolder(folder_path: String) -> int:
		var directory = Directory.new()
		if directory.open(folder_path) == OK:
				directory.list_dir_begin()
				var file_name = directory.get_next()
				while file_name != "":
						if !directory.current_is_dir():
								file_count += 1
						file_name = directory.get_next()
				directory.list_dir_end()
		return file_count
func _on_Button_pressed():
	file_count = 0
	getFileCountInFolder(H_path)
	var NHR = HR.new()
	var save_path = H_path + "H" + str(file_count+ 1) + ".tres"
	if Tinput($ColorRect/Label2/LineEdit.get_text()) and Tinput($ColorRect/Label2/LineEdit2.get_text()):
		NHR.nome = $ColorRect/Label/LineEdit.get_text()
		NHR.time = {"H": $ColorRect/Label2/LineEdit.get_text(), "M": $ColorRect/Label2/LineEdit2.get_text()}
		NHR.done = false
		NHR.path = save_path
		var Hi = H.instance()
		# Criar novo recurso que é Hn(número do arquivo, H1,H2,H3)
		ResourceSaver.save(save_path,NHR)
