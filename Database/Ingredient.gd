class_name Ingredient
extends Sprite

export var atlas_size: Vector2 = Vector2(128,128)
export var sprite_size: Vector2 = Vector2(16,16)
export var sprite_position: Vector2 = Vector2(0,0)
export var sprite_columns: int = 8


var region: Rect2

var ingredient_name: String
var witch_name: String
var scientific_name: String
var index: int

func initialize(index: int, ingredient_name: String, witch_name: String, scientific_name: String):
	self.index = index
	self.ingredient_name = ingredient_name
	self.witch_name      = witch_name
	self.scientific_name = scientific_name
	self.region = Rect2(
		(index % sprite_columns) * sprite_size.x,
		(int(index) / sprite_columns) * sprite_size.y,
		sprite_size.x,
		sprite_size.y
	)

func _ready():
	texture = AtlasTexture.new()
	texture.atlas = load("res://Database/ingredient_icons.png")
	texture.region = region

func get_real_name(naming: int) -> String:
	match naming:
		DatabaseConstants.NameType.NORMAL:
			return ingredient_name
		DatabaseConstants.NameType.SCIENCE:
			return scientific_name
		DatabaseConstants.NameType.WITCH:
			return witch_name
		_:
			return name
