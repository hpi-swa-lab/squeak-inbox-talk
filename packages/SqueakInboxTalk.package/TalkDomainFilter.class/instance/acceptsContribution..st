filtering
acceptsContribution: aContribution

	^ self items includes: (self getItemFor: aContribution)