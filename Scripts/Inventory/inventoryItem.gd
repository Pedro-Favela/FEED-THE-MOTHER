extends Button

var weight:float = 0
var item_name:String = "placeholder"
var item_image:Texture2D = Texture2D.new()
var item_weight:float = 0
var item_value:PackedScene = PackedScene.new()
var item_qntt:int = 1:
	set(new_value):
		item_qntt = new_value
		qntt_label.text = str(item_qntt)+"x "

@onready var qntt_label = $HBoxContainer/PanelContainer/HBoxContainer/Item_qntt
@onready var weight_label = $HBoxContainer/PanelContainer3/Label3
@onready var name_label = $HBoxContainer/PanelContainer/HBoxContainer/Label
@onready var icon_textureRect = $HBoxContainer/PanelContainer/HBoxContainer/TextureRect
@onready var player_current_item = get_tree().get_first_node_in_group("Player").get_node("CurrentItem")
@onready var player_inventory = player_current_item.Inventory_menu

func _ready():
	name_label.text = item_name
	weight_label.text = str(item_weight)
	icon_textureRect.texture = item_image

func _on_btn_up_pressed():
	if get_index() > 0:
		get_parent().move_child(self, get_index() - 1)

func _on_btn_down_pressed():
	if get_index() < get_parent().get_child_count() - 1:
		get_parent().move_child(self, get_index() + 1)


func _on_pressed():
	player_current_item.current_item_reference = self
	player_inventory.visible = false
