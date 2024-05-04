# Squeak Inbox Talk

[![Tests](https://github.com/hpi-swa-lab/squeak-inbox-talk/actions/workflows/tests.yml/badge.svg)](https://github.com/hpi-swa-lab/squeak-inbox-talk/actions/workflows/tests.yml)
[![Coverage Status](https://coveralls.io/repos/github/hpi-swa-lab/squeak-inbox-talk/badge.svg?branch=main)](https://coveralls.io/github/hpi-swa-lab/squeak-inbox-talk)
[![Open flags](https://shields.io/endpoint?url=https://gist.githubusercontent.com/LinqLover/36dd3c4a155eed5aa7e874415cd60eea/raw/flags%2523refs%2523heads%2523main.json)](https://github.com/hpi-swa-lab/squeak-inbox-talk/search?type=code&l=Smalltalk&q=%22flag%3A+%22)
[![Release](https://github.com/hpi-swa-lab/squeak-inbox-talk/actions/workflows/release.yml/badge.svg)](https://github.com/hpi-swa-lab/squeak-inbox-talk/releases)

> Bringing squeak-dev into your image

A project originally conducted in the course of the Live Programming Seminar 2021 @ HPI.
Many thanks to [Marcel Taeumel](https://github.com/marceltaeumel) for his diligent mentoring and advice!

![Squeak Inbox Talk](./assets/SqueakInboxTalk.png)

## Installation

Squeak Inbox Talk runs on Squeak 6.0 and newer versions.
We follow the trunk-based development style of Squeak and strive to deliver full support for the latest Squeak Trunk.
New features are only supported by the Trunk version of Squeak Inbox Talk.
Older versions and releases of Squeak will only receive urgent fixes.

### Automatic Installation (recommended)

To install and start Squeak Inbox Talk, go to the main docking bar and choose <kbd>Tools</kbd> > <kbd>Squeak Inbox Talk</kbd>.

### Manual Installation

1. Get a [Squeak](https://squeak.org) image (Squeak 6.0 or newer)

2. Install the latest system updates.

3. Open a workspace and evaluate the following:

   - **Squeak Trunk:**

     ```smalltalk
     Metacello new
     	baseline: 'SqueakInboxTalk';
     	repository: 'github://hpi-swa-lab/squeak-inbox-talk:main';
     	load.
     ```

   - **Squeak 6.0:**

     ```smalltalk
     Metacello new
     	baseline: 'SqueakInboxTalk';
     	repository: 'github://hpi-swa-lab/squeak-inbox-talk:squeak60';
     	load.
     ```

Alternatively, you can download the one-click image from the [latest release](https://github.com/hpi-swa-lab/squeak-inbox-talk/releases) and run it with zero installation effort.

For detailed information on how to use the tool - in case this should not be straightforward -, see the [usage documentation](./USAGE.md).

If you want to learn more about how the Squeak development process looks like, how Squeak Inbox Talk integrates with the other tooling for trunk development in the Squeak, and how you can make your own contributions, you may also want to check out these resources:

- **Squeak/Smalltalk - The Squeak Development Process:** <https://squeak.org/development_process>
- **Contributing to Squeak:** In the image (Squeak 6.1Alpha and newer), open the help menu in the docking bar and click on "Contributing to Squeak".

## Why?

Many Squeakers have experienced the following troubles in the past:

1. Tedious navigation on the list: Where has this patch gone? Can someone remember where we were discussing this funky thing recently?
2. High entry barrier for new contributors: You need to sign up on the mailing list to follow discussions.
3. Hard review process: Notifications and discussions appear in your email client, but if you want to check out some code, you will switch to your image, of course.

Squeak Inbox Talk attempts to solve all these issues by merging all relevant artifacts in Squeak, including emails and [Monticello](https://wiki.squeak.org/squeak/1287) contributions, allowing developers to explore them interactively.
It comes with a free-text search and several powerful filters for aspects such as packages, review state of a contribution, and your personal involvement.
These filters should make it easier to survey certain domains, gain a better understanding of the connection between inbox versions, or keep track of your own proposals.

## How does it work?

Basically, Squeak Inbox Talk is implemented by reusing and assembling together the following existing solutions: [Squeak History](https://github.com/hpi-swa/squeak-history), a project originally developed by Marcel (mt) that scrapes and processes all mailing list conversations from the [mailman archives](https://lists.squeakfoundation.org/archives/); the `SMTPClient` in Squeak for sending messages; and the Monticello infrastructure, which remains the heart of our development workflow. Optionally, further components such as [`IMAPClient`](https://github.com/hpi-swa-teaching/IMAPClient) might follow later. On top of this, Squeak Inbox Talk adds a convenient layer for exploring and filtering conversations and contributions.

## Semantics Plugin (experimental)

This repository includes an optional plugin that enhances the browsing experience by contributing features such as semantic search, similar conversations, and AI-generated summaries of conversations to Squeak Inbox Talk.
The plugin uses the [SemanticText](https://github.com/LinqLover/squeak-chatgpt) package and OpenAI's APIs for text embedding and generation.
You can enable the plugin by turning on the "Semantic search in Squeak Inbox Talk" option in the preferences.
This feature is currently in a very early stage.
Feedback and ideas welcome!

## Implementational notes

- This project is proud to use [smalltalkCI](https://github.com/hpi-swa/smalltalkCI) and the [create-image GitHub action](https://github.com/marketplace/actions/create-image).
- [`UPSTREAM.md`](./UPSTREAM.md) contains a list of contributions that were made to upstream dependencies of this repository in the context of this project.

## Further reading

- [Official announcement thread on the squeak-dev mailing list](http://forum.world.st/ANN-Squeak-Inbox-Talk-bringing-squeak-dev-into-your-image-td5130575.html) ([mirror on lists.squeakfoundation.org](http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-July/216008.html))
- [Official announcement of HyperKitty release on squeak-dev](https://lists.squeakfoundation.org/archives/list/squeak-dev@lists.squeakfoundation.org/thread/KTIGYGMSC2IK45HIFMKY44WZVPE4BKEU/)
- [Christoph Thiede and Patrick Rein. *Squeak by Example. 6.0 Edition.* Lulu, 2023. ISBN 978-1-4476-2948-1.](https://www.lulu.com/shop/patrick-rein-and-christoph-thiede/squeak-by-example-60/paperback/product-8vr2j2.html)
