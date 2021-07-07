extends Node2D

onready var chest1 = get_node("chest")
onready var chest2 = get_node("chest2")

func _ready():
	chest1.items = ["Kilic", "Kalkan", "Demir Bot"]
	chest2.items = ["Havuc", "Tavuk", "Altin", "Elma"]
