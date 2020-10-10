class_name Ingredient

var name: String
var witch_name: String
var scientific_name: String

func _init(name: String, witch_name: String, scientific_name: String):
	self.name            = name
	self.witch_name      = witch_name
	self.scientific_name = scientific_name

func get_name(naming: int) -> String:
	match naming:
		DatabaseConstants.NameType.NORMAL:
			return name
		DatabaseConstants.NameType.SCIENCE:
			return scientific_name
		DatabaseConstants.NameType.WITCH:
			return witch_name
		_:
			return name
