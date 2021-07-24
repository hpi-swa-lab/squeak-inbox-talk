background workers
backgroundWorkerPriorityFor: aSymbol
	"Give a higher priority to the #contents generation so that the preview will be displayed before all filters have completed."

	^ (super backgroundWorkerPriorityFor: aSymbol) + (aSymbol = #contents ifTrue: [1] ifFalse: [0])