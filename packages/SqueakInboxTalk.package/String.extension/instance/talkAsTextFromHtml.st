*SqueakInboxTalk-UI-converting
talkAsTextFromHtml
	"Answer a Text by interpreting the receiver as HTML. Don't ignore newlines."

	self flag: #moveUpstream.
	"maybe?"
	^ (HtmlReadWriter on: self readStream)
		breakLines: false;
		nextText