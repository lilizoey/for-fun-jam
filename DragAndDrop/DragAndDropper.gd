class_name DragAndDropper

extends Node

const GHOST = preload("Ghost/Ghost.tscn")

var ghost: Sprite
var currentIngredient: Ingredient setget setIngredient

func setIngredient(ingredient: Ingredient):
	if ingredient == null:
		currentIngredient = ingredient
		if ghost != null:
			ghost.queue_free()
		return
	if ghost == null:
		ghost = GHOST.instance()
		add_child(ghost)
	
	ghost.texture = ingredient.texture
	currentIngredient = ingredient
