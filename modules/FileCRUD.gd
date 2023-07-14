extends Resource

class_name FILECRUD


func count_files_in_folder(folder_path: String) -> int:
		var file_count = 0
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
