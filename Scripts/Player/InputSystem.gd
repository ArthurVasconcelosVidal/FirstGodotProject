
extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playerManager = get_parent()
var stickValue = Vector2.ZERO
var sitckMagnitude = 0.0

signal SouthButton_Pressed()
signal SouthButton_Released()

# Called when the node enters the scene tree for the first time.
func _input(event):
	StickBehaviour()
	ButtonConfig()
	
func StickBehaviour():
	var stick = Vector2.ZERO
	var stickStrenght = Vector2.ZERO
	
	if Input.is_action_pressed("stick_Up"):
		stick.y += 1
		stickStrenght.y = Input.get_action_strength("stick_Up")
	if Input.is_action_pressed("stick_Down"):
		stick.y -= 1
		stickStrenght.y = Input.get_action_strength("stick_Down")
	if Input.is_action_pressed("stick_Right"):
		stick.x += 1
		stickStrenght.x = Input.get_action_strength("stick_Right")
	if Input.is_action_pressed("stick_Left"):
		stick.x -= 1
		stickStrenght.x = Input.get_action_strength("stick_Left")
	
	if (stick == Vector2.ZERO):
		stickValue = Vector2.ZERO
		sitckMagnitude = 0
		return
	
	stickStrenght = stickStrenght.clamped(1)
	sitckMagnitude = stickStrenght.length()
	stickValue = stick.normalized()

func ButtonConfig():
	if Input.is_action_just_pressed("southButton"):
		emit_signal("SouthButton_Pressed")
	elif Input.is_action_just_released("southButton"):
		emit_signal("SouthButton_Released")
