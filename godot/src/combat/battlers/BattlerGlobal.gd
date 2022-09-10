extends Node

const skill_calculations_list: Dictionary = {
	"normal_attack": preload("res://src/combat/battlers/actions/calculations/physical_damage.gd"),
	"backstab": preload("res://src/combat/battlers/skills/calculations/backstab.gd")
}

const action_data_list: Dictionary = {
	"Lolislash": preload("res://src/combat/battlers/skills/Lollislash.tres"),
	"Bilboshot": preload("res://src/combat/battlers/skills/Slash.tres"),
	"Backstab": preload("res://src/combat/battlers/skills/Backstab.tres")
}

var skill_instances: Dictionary = {}

func _ready():
	var keys = skill_calculations_list.keys()
	for i in keys:
		var value = skill_calculations_list[i]
		skill_instances[i] = value.new()

func get_battle_action(name: String):
	if skill_instances.has(name):
		return skill_instances.get(name)
	return null

func get_action_data(name: String):
	if action_data_list.has(name):
		return action_data_list.get(name)
	return null
