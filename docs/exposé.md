# Squeak Inbox Talk – Exposé

A tool to empower volunteers to contribute to code changes and related discussions for the development of Squeak, freeing them from the need of leaving it to do so, and making overall collaboration as live and fluent as possible.

## Applicability

- Mailing list (must be supported by `squeak-history`, i.e., hosted using `pipermail`)
- Monticello repository (group)

## Non-functional requirements

- **Maintain the UI responsive** whenever performing expensive background operations such as receiving or sending contributions.
- **Design a Smalltalk-stylish dialog structure** that does not enforce singleton windows but comprises many small windows to facilitate multitasking and free arrangement of contents.
- **Emphasize liveness of the entire UI,** i.e., try to avoid displaying outdated information.
- **Avoid customer retention** by avoiding flooding the public data sources with proprietary (meta) information.
  Don't force users to make a binary decision between Squeak Inbox Talk and traditional communication interfaces.
  However, opt-in solutions would be possible.
- Technical: **Reduce dependencies.**
  The tool should be loadable with a minimal footstep into a Trunk image.

## Use Cases

### Bootstrapping

The tool should present itself to newcomers in a familiar and clear way.

- **Initially unless dismissed, display a short introductory welcome message.**
  It should teach the user about the general philosophy of the tool and provide some simple usage introduction.
  This information shall also be accessible at a later point (e.g., via a menu).

  Maybe extract some contents into a `HelpTopic`.

- **Initially unless dismissed, present a simple configuration dialog.**
  The dialog should ask the user for permission before loading all data from the mailing lists.
  Furthermore, the user should be able to save login credentials for SMTP/IMAP access.
  For reconfiguration, this dialog shall also be accessible at a later point (e.g., via a menu).

  For convenience, it would be very helpful if `squeak-history` could be extended to download a relevant slice of the data (e.g., newest *n* months) only.

- **On the first contribution of the user, present a credentials configuration dialog again** unless the user is already authenticated.

### Browse contributions and conversations

The tool shall allow the user to browse all current and past contributions and related conversations.

- **Get an overview** of all contributions and conversations.
  They should be enriched with useful meta information such as the *general state* of a contribution (e.g., "pending review", "accepted", "treated"; use positive vocabulary) and *individual associations* (relationship, e.g., "thread owner", "mentioned", "replied"; counter of unread messages).

- **Use filters** for all items.
  Provide a few meaningful numbers (e.g., number of open contributions).
  Possible filters include all meta information from above but also:

  * Content (messages/source code)
  * Contributors
  * Date/time
  * Domain (e.g., by repository or package)
  * Code ownership (e.g., derived from former/related timestamps)
  * Type (i.e., changeset/repository version/others)
  * Intent (e.g., bugfix, new feature)

### Create a contribution

The tool should make it possible to initiate a new conversation.

- **Upload a Monticello version.**
- **Upload a changeset.**
- **Write a message** without attached patches.

Even though existing interfaces exist to create a Monticello version or a changeset, the tool should provide a more convenient entry point to them, e.g., by showing direct links at a central place in the main window.
Additionally, the tool could support the user to identify glitches in a patch before sending it, e.g., by reusing the slip search of the `ChangeSorter` or checking the version description/preamble of a patch for real content.
It would even be possible to display advanced analysis results such as SWALint statistics or failing tests at this place.

### Participate in a conversation

The tool shall provide basic features to participate in ongoing conversations similar to the features of an email client.

- **Read all messages of a conversation,** each of them decorated with central metadata such as date/time, author, and subject.

  Don't require the user to select every individual reply to read it, i.e., support continuous scrolling.

  Use text styling to emphasize primary/secondary parts of a message, e.g., use gray color/italic for citations or apply syntax highlighting to code sections.
  Insert links to mentioned objects such as other conversations or code objects (e.g., classes or selectors).
  Maybe also show other conversations or code objects that refer to the current conversation/contribution.

  Support the user to write useful messages, e.g., remind of missing attachments or note very short messages.

- **Reply to a conversation** by writing a message with plain text or text with simple formatting.
  Make it possible to embed related contents into the reply, such as citations of parts from previous messages, code snippets, or references to other conversational or source code objects.

### Review or revise a contribution (advanced)

To benefit from the integration into the wonderful live Squeak system, the tool should provide more convenient and interactive ways to review submitted code patches and revise them on-demand.
For this, a separate *code view* should be integrated.

- **Browse proposed patches together with any annotated discussion threads.**

  Every submitted patch such as a repository version or a changeset should be openable in a conventional code browser.
  The code browser should either display the proposed eventual version of the code or the diffs only.

  Attached to the relevant lines or definitions, any associated discussion threads should be shown.
  These threads have to be parsed from excerpts of the conversation that mention or reference a piece of code.
  It should be possible to jump from a discussion thread to the relevant place in the conversation or vice versa.

- **Compile a review/reply from the code view.**

  While browsing the code, the user should be able to respond to an existing discussion thread or to create new threads by selecting a code range or definition.

  At the time of writing an answer to a thread comment, the reply text in the draft window of the reply message to the entire conversation should be updated (see use case "Reply to a conversation").
  Threads are represented by citing a relevant code range or existing threads in the new reply.
  Analogously, at the time of editing the draft of a reply to the conversation, all discussion threads in the code view should be updated.

## Wireframes

![image](https://user-images.githubusercontent.com/38782922/117220815-48d7b680-ae08-11eb-8445-60b06614ba35.png)
![image](https://user-images.githubusercontent.com/38782922/117220826-51c88800-ae08-11eb-9eeb-92ea4b0a94ef.png)
![image](https://user-images.githubusercontent.com/38782922/117220836-555c0f00-ae08-11eb-8dc1-8daa5e56f4e9.png)
![image](https://user-images.githubusercontent.com/38782922/117220849-58ef9600-ae08-11eb-8c68-f1af2ed009ac.png)

## References

Existing solutions and their limitations include:

- [squeak-history](https://github.com/hpi-swa/squeak-history) for parsing `pipermail` archives
  * no microscaling at the moment (requires to download entire >200MB archives)
  * encoding problems
  * identification of separated messages sometimes imperfect
- [IMAPClient](https://github.com/hpi-swa-teaching/IMAPClient) for individual metadata such as unread (optional!)
  * suppports SSL
  * monolithic structure (Core depends on UI)
  * connection and encoding errors, see [bug issues](https://github.com/hpi-swa-teaching/IMAPClient/issues?q=is%3Aissue+is%3Aopen+label%3Abug)
- `SMTPClient` for sending messages:
  * suppports STARTTLS, SSL currently broken
  * formatted text can be sent manually using html-typed MIME document
