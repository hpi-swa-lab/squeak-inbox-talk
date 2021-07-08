*SqueakInboxTalk-UI-accessing - items-Morphic-ct.1774-override
columnAtLocation: aPoint
	"Return the index of the column at the given point or 0 if outside"

	| pointInListMorphCoords |
	pointInListMorphCoords := (self scroller transformFrom: self) transform: aPoint.
	
	^ listMorphs findFirst: [:listMorph |
		pointInListMorphCoords x between: listMorph left and: listMorph right]