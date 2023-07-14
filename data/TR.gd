extends Resource

class_name TR

export var path : String
export var nome : String
export var parent : String
export var child : String
export var date : Dictionary = {"D": 00, "M": 00, "A": 0000} # Data com hora
export var done : bool

# Getter e Setter para a variável 'path'
func get_path() -> String:
		return path

func set_path(new_path: String) -> void:
		path = new_path

# Getter e Setter para a variável 'nome'
func get_nome() -> String:
		return nome

func set_nome(new_nome: String) -> void:
		nome = new_nome

# Getter e Setter para a variável 'date'
func get_date() -> Dictionary:
		return date

func set_date(new_date: Dictionary) -> void:
		date = new_date

# Getter e Setter para a variável 'done'
func get_done() -> bool:
		return done

func set_done(new_done: bool) -> void:
		done = new_done


