class_name Recipe

var name: String
var ingredient1: Ingredient
var ingredient2: Ingredient
var ingredient3: Ingredient
var result: Potion

func _init(name: String, ingredient1: Ingredient, ingredient2: Ingredient, ingredient3: Ingredient, result: Potion):
	self.name = name
	self.ingredient1 = ingredient1
	self.ingredient2 = ingredient2
	self.ingredient3 = ingredient3
	self.result = result

