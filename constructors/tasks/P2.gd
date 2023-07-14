extends OptionButtonFTW
# Exibir as variáveis "nome" dos arquivos dentro da pasta "res://Resources/T/"

func _on_P2_item_selected(index):
	# reverse_engineer do item selecionado: index - text - caminho
	if get_item_text(index) == "Null":
		resource_selected = "Null"
	else:
		set_selected(index)

func _on_P2_button_up():
	for x in range(0, get_item_count()):
		remove_item(get_item_index(x))
	add_items()
	print("poko")
