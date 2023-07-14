extends Button
export var TDATA : Dictionary = {
	"nome": "AMOGKOK", "date": {"D": 00, "M": 00, "Y": 00000}, 
	"done": false, "child": Resource, "parent": Resource}
var T_path = "res://data/T/"
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
	getFileCountInFolder(T_path)
	var NTR = TR.new()
	var save_path = T_path + "T" + str(file_count+ 1) + ".tres"
	
	NTR.nome = $"../nome".text
	NTR.date = {"D": $"../year".text, "M": $"../month".text, "A": $"../year".text}
	NTR.done = false
	NTR.path = save_path
	NTR.parent = $"../P2".resource_selected
	NTR.child = $"../P".resource_selected
	# Criar novo recurso que é Hn(número do arquivo, H1,H2,H3)
	ResourceSaver.save(save_path,NTR)
