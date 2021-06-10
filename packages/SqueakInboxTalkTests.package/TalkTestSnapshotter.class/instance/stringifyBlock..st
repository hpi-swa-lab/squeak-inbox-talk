private
stringifyBlock: aBlock

	^ '[:object | {1}]' format: {InspectorField generateExpressionFrom: aBlock argumentNames: #('object')}