extends Resource

class_name HR

export var nome : String
export var time : Dictionary = {"H": 00, "M": 00} # Data com hora
export var done : bool
export var path : String
export var last_check :Dictionary = {"year": 0000, "month": 00, "day": 00,}
func get_nome() -> String:
		return nome

func set_nome(new_nome: String) -> void:
		nome = new_nome

func get_time() -> Dictionary:
		return (time["H"] + time["M"])
		
func get_time_as_int() -> int:
		return (int(time["H"] + time["M"]))
		
func set_time(new_time: Dictionary) -> void:
		time = new_time

func get_done() -> bool:
		return done

func set_done(new_done: bool) -> void:
		done = new_done

func get_path() -> String:
		return path

func set_path(new_path: String) -> void:
		path = new_path
