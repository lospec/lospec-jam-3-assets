extends AnimatedSprite2D

@export var next_scene: PackedScene

@export var wait_before_animation: = 1.0
@export var wait_after_animation: = 1.0

@onready var timer: = $Timer as Timer

func _ready() -> void:
	assert(next_scene, "The splash screen is freed after running. Set the next scene to be set as" +
		"the currently running scene!")
	
	timer.start(wait_before_animation)
	await timer.timeout
	
	play("default")
	await animation_finished
	
	timer.start(wait_after_animation)
	await timer.timeout
	
	get_tree().change_scene_to_packed(next_scene)
