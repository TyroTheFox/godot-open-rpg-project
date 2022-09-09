extends Node

const skill_calculations_list = {
	"normal_attack": preload("res://src/combat/battlers/actions/SkillAction.tscn"),
	"backstab": preload("res://src/combat/battlers/actions/Backstab.tscn")
}

func get_battle_action(name: String):
	if skill_calculations_list.has(name):
		return skill_calculations_list.get(name)
	return null
