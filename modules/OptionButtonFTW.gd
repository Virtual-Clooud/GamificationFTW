extends OptionButton
class_name OptionButtonFTW

export var folder : String
export var resource_selected : String
func _ready():
	resource_selected = "Null"

func add_items():
	add_item("--------------", -1)
	var directory = Directory.new()
	if directory.open(folder) == OK:
			directory.list_dir_begin()
			var file_name = directory.get_next()
			while file_name != "":
					if !directory.current_is_dir():
							var resource =  ResourceLoader.load(folder + file_name)
							add_item(resource.nome)
							print(resource.nome)
					file_name = directory.get_next()
			directory.list_dir_end()
	add_item("Null")


func set_selected(n):
	var directory = Directory.new()
	if directory.open("res://data/T/") == OK:
			directory.list_dir_begin()
			var file_name = directory.get_next()
			while file_name != "":
					if !directory.current_is_dir():
							var resource =  ResourceLoader.load("res://data/T/" + file_name)
							if resource.nome == get_item_text(n):
								resource_selected = "res://data/T/" + file_name
					file_name = directory.get_next()
			directory.list_dir_end()
