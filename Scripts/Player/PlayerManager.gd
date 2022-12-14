extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var inputNode = get_node("InputSystem")
onready var movementNode = get_node("MovementBehaviour")
onready var meshNode = get_node("MeshNode")
onready var cameraNode = get_node("Camera")
onready var debugDrawNode = get_node("DrawDebugNode") 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
