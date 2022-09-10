extends CombatAction

class_name SkillAction

var skill: Skill = null

func _ready() -> void:
	name = skill.name
	icon = skill.icon
	randomize()

func execute(targets):
	assert(initialized)
	var action_calculation = BattlerGlobal.get_battle_action(skill.action_type)
	if (action_calculation != null):
		return action_calculation.execute(self, targets, actor, skill)
	return false

func can_use() -> bool:
	return actor.stats.mana >= skill.mana_cost
