extends CanvasLayer

onready var itemlist1 = get_node("chest_inv/ItemList")
onready var itemlist2 = get_node("chest_inv/ItemList2")
onready var player_itemlist = get_node("player_inv/ItemList")

var is_show_inv = false
var is_show_player_inv = false
var inv1 = []
var inv2 = []

func _ready():
	pass


func _input(event):
	if event.is_action_pressed("ui_key_e") and is_show_inv:
		change_state()


func change_state():
	get_tree().paused = !get_tree().paused
	$chest_inv.visible = !$chest_inv.visible



func check_show(item_list, player_items):
	if is_show_inv == false:
		show_inv(item_list, player_items)
		is_show_inv = true
		change_state()
	else: is_show_inv = false



func show_inv(item_list, player_items):
	inv1 = item_list
	inv2 = player_items
	itemlist1.clear()
	itemlist2.clear()
	for i in item_list: # iki dongudede i degiskeni kullanilabilir
		itemlist1.add_item(i)
	for ii in player_items:
		itemlist2.add_item(ii)


func show_player_inv(player_items):
	if is_show_player_inv == false:
		$player_inv.visible = true
		
		player_itemlist.clear()
		for i in player_items: # iki dongudede i degiskeni kullanilabilir
			player_itemlist.add_item(i)
		is_show_player_inv = true
	else:
		$player_inv.visible = false
		is_show_player_inv = false


func _on_ItemList_item_activated(index):
	var selected_item = itemlist1.get_item_text(index)
	inv1.remove(index)
	inv2.append(selected_item)
	show_inv(inv1, inv2)


func _on_ItemList2_item_activated(index):
	var selected_item = itemlist2.get_item_text(index)
	inv1.append(selected_item)
	inv2.remove(index)
	show_inv(inv1, inv2)
