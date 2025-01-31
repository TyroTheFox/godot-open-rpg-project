extends Resource

class_name Skill

signal missed(text)

export var name: String = "Skill"
export var description: String = ""
export var icon: Texture = load("res://icon.png")
export(String) var action_type: String = "normal_attack"

export var mana_cost: int
export var base_damage: int
export (float, 0.0, 1.0) var success_chance: float
