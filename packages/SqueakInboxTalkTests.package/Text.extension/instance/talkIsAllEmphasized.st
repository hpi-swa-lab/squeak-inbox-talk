*SqueakInboxTalkTests-Acceptance-testing
talkIsAllEmphasized

	^ self runs allSatisfy: [:attrs | attrs anySatisfy: [:attr | attr emphasisCode > 0]]