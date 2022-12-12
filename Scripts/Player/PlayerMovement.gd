extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var testao = 2 
onready var playerManager = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(playerManager.inputNode.stickValue)
	#print(playerManager.inputNode.sitckMagnitude)
	pass

func _on_InputSystem_SouthButton_Pressed():
	print("Q Pressed")


func _on_InputSystem_SouthButton_Released():
	print("Q Releassed")
