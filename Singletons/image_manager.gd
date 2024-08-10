extends Node

const FRAME_IMAGES: Array = [
	
	preload("res://assets/frames/blue_frame.png"),
	preload("res://assets/frames/red_frame.png"),
	preload("res://assets/frames/yellow_frame.png"),
	preload("res://assets/frames/green_frame.png"),
	
]

var _item_images: Array = []

func _ready():
	load_item_images()
	pass
	
func add_files_to_list(fn: String, path: String) -> void:
	var full_path = path + "/" + fn
	
	var image_info_dictionaries = {
		"item_name": fn.rstrip(".png"),
		"item_texture": load(full_path)
	}
	
	_item_images.append(image_info_dictionaries)
	pass
func load_item_images() -> void:
	
	var path = "res://assets/glitch"
	var dir = DirAccess.open(path)
	
	if(!dir): 
		print("ERROR: ", path) 
		return
	
	var file_names = dir.get_files()
	
	for fn in file_names:
		if(".import" not in fn): 
			add_files_to_list(fn, path)
	pass
	
func get_random_item_image() -> Dictionary:
	return _item_images.pick_random()
	pass
	
func get_image(index: int) -> Dictionary:
	return _item_images[index]
	pass
	
func get_random_frame_image() -> CompressedTexture2D:
	return FRAME_IMAGES.pick_random()
	pass
	
func shuffle_images() -> void:
	_item_images.shuffle() 
	pass
