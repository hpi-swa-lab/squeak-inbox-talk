*SqueakInboxTalkExtras-Semantics-Core
semanticTitle

	^ 'Subject: {1}\From: {2}\Date: {3}' withCRs format: {self subject. self author asString. self date}