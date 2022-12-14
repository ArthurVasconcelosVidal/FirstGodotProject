extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var movementSpeed = 5
var rotationSpeed = 3

onready var playerManager = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	MovementBehaviour()


func MovementBehaviour():
	var finalDir = ObjectRelatedDirection(playerManager.inputNode.stickValue, playerManager.cameraNode) 
	playerManager.debugDrawNode.draw_line_3d(playerManager.translation, finalDir.normalized() * 50, Color(1, 1, 0))
	print(finalDir.normalized())

func ObjectRelatedDirection(var inputDirection, var objectTransform):
	var forwardDirection = ProjectOnPlane(-playerManager.cameraNode.get_global_transform().basis.z, playerManager.get_transform().basis.y)
	var rightDirection = ProjectOnPlane(playerManager.cameraNode.get_global_transform().basis.x, playerManager.get_transform().basis.y)
	var finalDirection = forwardDirection * inputDirection.y + rightDirection * inputDirection.x
	return finalDirection


func ProjectOnPlane(var point, var planeNormal):
	var normPlane = Plane(planeNormal,0)
	var projectedPoint = normPlane.project(point)
	return projectedPoint  

func _on_InputSystem_SouthButton_Pressed():
	print("Q Pressed")


func _on_InputSystem_SouthButton_Released():
	print("Q Releassed")
