handling
initializeCorpus

	self resumeEvaluating:
		[self inbox initializeSemanticCorpus; assureSemanticCorpus].