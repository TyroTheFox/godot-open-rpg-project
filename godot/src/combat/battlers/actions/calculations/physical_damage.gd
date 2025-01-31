extends Node

func execute(action, targets, actor, skill):
	if actor.party_member and not targets:
		return false

	# Use skill on all targets
	actor.stats.mana -= skill.mana_cost
	randomize()
	if randf() < skill.success_chance:
		var hit = Hit.new(actor.stats.strength, skill.base_damage)
		for target in targets:
			target.take_damage(hit)
	else:
		skill.emit_signal("missed", "Miss!")
		pass

	yield(actor.get_tree().create_timer(1.0), "timeout")

	yield(action.return_to_start_position(), "completed")
	return true
