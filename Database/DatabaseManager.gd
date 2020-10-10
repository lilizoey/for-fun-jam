class_name DatabaseManager

extends Node

const ingredients: Dictionary = {}
const potions: Dictionary = {}
const recipes: Dictionary = {}

func _ready():
	init_ingredients()
	init_recipes()
	
	for recipe in recipes.values():
		if not recipe:
			continue
		print(recipe.name, ": ", recipe.ingredient1, ", ", recipe.ingredient2, ", ", recipe.ingredient3)

func init_ingredients():
	var file = File.new()
	file.open("res://Database/Witchstuff - Ingredients.csv", file.READ)
	while !file.eof_reached():
		var csv = file.get_csv_line()
		if csv[0] == "Actual Ingredients":
			continue
		if csv[0] == "END":
			break
		if csv.size() >= 5:
			ingredients[csv[0]] = Ingredient.new(csv[0],csv[1],csv[2])
	file.close()

func init_recipes():
	var file = File.new()
	file.open("res://Database/Witchstuff - Recipes.csv", file.READ)
	while !file.eof_reached():
		var csv = file.get_csv_line()
		if csv[0] == "Name":
			continue
		if csv[0] == "END":
			break
		if csv.size() >= 5:
			recipes[csv[0]] = Recipe.new(csv[0],ingredients.get(csv[2]),ingredients.get(csv[3]),ingredients.get(csv[4]), Potion.new())
	file.close()

