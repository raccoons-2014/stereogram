Stereogram
==========

[![Circle CI](https://circleci.com/gh/raccoons-2014/stereogram.svg?style=svg)](https://circleci.com/gh/raccoons-2014/stereogram)

Raccoons - Phase 3 Final Project
--------------------------------

###Mission Statement
[Stereogram] is a webapp for sharing the best part of an audio recording to your friends/followers.

###Working Agreement
- **Off Days:** 12/24, 12/25, 12/31, 1/1.
- **Daily Standups**: 15-30 minutes; beginning and end of the day.
- **Communicate:** Do meaningful work, research new technologies or ideas, but always keep the group informed about what you are doing on [Slack], [Trello], or at least during standups.

###Git Workflow
All merges are to be done on [Github] by other members of the group.

1. Pull remote changes on development
2. Checkout a new feature branch off of development
- Keep features short and focused
3. Make changes locally, committing early and often
- Rebase whenever changes are pushed to development
4. Push feature branches to Github and put in a pull request to have changes merged remotely.
5. Tag appropriate reviewer (see below) who will then merge your changes in
6. Follow up with reviewer to be sure that everyone knows that new changes have been merged and their features are behind
7. Major changes that pass review should then be merged into master

###Reviewers
Tag reviewers whenever putting in pull request and be sure to merge into development, not master.

####Reviewers Decided Alphabetically
- Alex reviews Chris's code
- Chris reviews Liam's Code
- Liam reviews Pat's code
- Pat reviews Zahid's code
- Zahid reviews Alex's code

##MVP
- Webapp
- Handle an event to do snippet
- Soundcloud Widget
- Send it
- OAuth account
- Stream a song from Soundcloud on the app
- UX massive focus.

###User Story
>**As a user, I want to...**

>  - Go to Stereogram and see a great landing page
>  - View a site without needing to log in
>  - Make an account via Facebook
>  - Create snippets from Soundcloud tracks

##App Features
- Responsive landing page visually appealing enough to draw users into the site
- Small 'about' icon to inform new users on the nature of the app
- Oauth set up using [Devise] that allows users to login via their Facebook accounts
- A single page landing on a user's feed with snippets from followed users playable in a central player
- Ability to follow other users
- Custom icons and player with single-page interface
- Allows users to sign in via their [Soundcloud] accounts and pull in their tracks to share with other users
- No tracks are stored in the Stereogram database only locations and timestamps for speed and lower overhead
- Snippet creation: A 15-second clip of audio showcasing a user's favorite part of a song
- Autoshare: snippets are automatically shared to the user's Facebook feed
- Guest view of snippets

###Known Issues (1/23/15)
- Player artwork animation is off-center in some browsers
- Recently removed unfollowing for demo purposes and will soon reimplement

###Future Plans
- Add additional social networks to share snippets to
- Mobile app
- User uploading of tracks directly to Amazon s3 server

[Stereogram]: http://stere-o-gram.herokuapp.com/
[Slack]: https://slack.com/
[Trello]:https://trello.com/
[Github]: https://github.com/raccoons-2014/stereogram
[Devise]: https://github.com/plataformatec/devise
[Soundcloud]: https://soundcloud.com/
