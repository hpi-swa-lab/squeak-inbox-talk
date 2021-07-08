testing
includesParticipationOf: aPerson

	^ self messages anySatisfy: [:message | message wasAuthoredBy: aPerson]