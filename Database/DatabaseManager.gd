extends Node

const ingredients: Dictionary = {}
const potions: Dictionary = {}
const recipes: Dictionary = {}
const ingredient_scene: PackedScene = preload("res://Database/Ingredient.tscn")

func _ready():
	init_ingredients()
	init_recipes()
	
	var i = 0
	for ingredient in ingredients.values():
		if not ingredient:
			continue
		add_child(ingredient)
		ingredient.position = Vector2(i * 16, 100)
		print(ingredient.get_real_name(DatabaseConstants.NameType.NORMAL), " ", ingredient.texture.region)
		i += 1

func init_ingredients():
	var file = File.new()
	file.open("res://Database/Witchstuff - Ingredients.csv", file.READ)
	var index = 0
	while !file.eof_reached():
		var csv = file.get_csv_line()
		if csv[0] == "Actual Ingredients":
			continue
		if csv[0] == "END":
			break
		if csv.size() >= 5:
			var ingredient_instance: Ingredient = ingredient_scene.instance()
			ingredients[csv[0]] = ingredient_instance
			ingredient_instance.initialize(index, csv[1], csv[2], csv[3])
		index += 1
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

