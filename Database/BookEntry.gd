class_name BookEntry

var recipe: Recipe
var naming: int
var description: String

func _init(recipe: Recipe, naming: int, description: String):
	self.recipe = recipe
	self.naming = naming
	self.description = description

func get_description() -> String:
	return description.format({
		"ing1": recipe.ingredient1.get_name(naming),
		"ing2": recipe.ingredient2.get_name(naming),
		"ing3": recipe.ingredient3.get_name(naming)
	})

"""
This sdlgkhaslfkj {ing1} and {ing2}, you need these to do what you want with {ing3}.
"""
