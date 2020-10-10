class_name BookEntry

signal pressed_forward()
signal pressed_backward()

var recipe: Recipe
var naming: int
var description: String

func _init(recipe: Recipe, naming: int, description: String):
	self.recipe = recipe
	self.naming = naming
	self.description = description

func get_description() -> String:
	return description.format({
		"ing1": recipe.ingredient1.get_real_name(naming),
		"ing2": recipe.ingredient2.get_real_name(naming),
		"ing3": recipe.ingredient3.get_real_name(naming)
	})

func _on_Back_pressed():
	emit_signal("pressed_backward")

func _on_Forward_pressed():
	emit_signal("pressed_forward")
