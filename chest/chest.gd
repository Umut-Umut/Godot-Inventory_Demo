extends StaticBody2D

onready var inventory = get_node("/root/Inventory")
onready var asset = get_node("asset")

var items = []
var player_items = []


func _physics_process(_delta):
	pass


func open():
	inventory.check_show(items, player_items)
