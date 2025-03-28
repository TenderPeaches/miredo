# Changelog

## Early Access

## v1.2.0

* Design overhaul
* Add Back-to-top button to home page, songs list
* Add color legend to chord helpers, instrument view
* Fix color scheme on instrument view when highlighting specific chords
* Add links to Ruby on Rails, developper portfolio in the footer

## v1.1.1

* Add total play count in the feedback when a song is played by heart
* Add link to Statistics in the header
* Add Calendars

## v1.1.0.0

* Stripe implementation: Busking subscription plan, which grant access to the Setlists and New Song features
* Add capo-relative pitches setting, which make it easier to reconcile the chords being played with the visual helpers, especially for beginners
* Add chord highlighting feature to chords helper
* Add link to chord composition reference from the chord helper
* Admin: added Artists, Artist Links form
* Progressions may now exist without being linked to a template
* Progression templates can now be deleted even if associated with existing progressions, in such cases the progressions are not linked to any template
* When logged in, song showcases appear even if empty, in which case they appear with a text indicating the requirement for songs to appear in the given showcase
* Add link to browse songs from the home page showcase when user is logged out
* Fix a bug where the "New Song" header link is being shown to logged out users and users without access to the feature
* Fix a bug where the "Contact Us" email would throw an error and not send anything
* Fix a bug where the artist links prompt would show up even if no links have been defined for said artist

## v1.0.3.2

* Header links remain visible or hidden throughout the user's navigation
* Paywall setlists
* Add a "Why Sign up?" notice to the registration page
* Add links to artists webpages
* Add optional username to user creation and update forms
* Adjust header tab links display
* Adjust header, footer links display
* Adjust footer to remain visible no matter scroll position
* Fix an error when creating progressions
* Fix chords display when 5+ beats of the same chord
* Fix a bug where user settings weren't set on user creation
* Fix a display bug when filtering songs
* Fix a bug where sorting filtered results would not work

## v1.0.3.1

* UI changes to the header's design, links and links throughout the site
* Fix bug where songs played by heart statistics were wrong

## v1.0.3

### New Features

* Add "Setlists" feature, allowing users to string songs together into setlists
* Add "Created at/last added" song filter
* Add "Statistics" feature, showing some statistics relevant to the user's usage of the website
* Add color-code legend for song plays

### Adjustments

* Remove "Favorite?" column header
* "Practice Random" link now always appears on the front page, regardless of whether the user is logged in or not
* Add links from the progressions sequencer to each progression's form
* Add "Clear Filters" option
* Add Favicon

### Bug Fixes

* Empty or single-letter song searches now redirect to the songs page, as they generate too many results without being particularly useful
* Fix a bug where progression templates could not be deleted
* Fix a bug where updating progression templates would not visually update the template's tag until the page was refreshed
* Fix a bug where the current sort might not show when reloading the "Browse Songs" page

## v1.0.2.3

* Cosmetic update
* Add a Discord prompt to the inquiries view
* Add added second chords (add2, shortened to 2)
* Add visual indicators to field label with a tooltip
* Improved visual feedback of menu buttons
* Replaced pagination links with buttons

## v1.0.2.2

* Remove "play" options from songs list if user is not logged in
* Add key & scale selection options for progression templates
* Conceal progression, progression template key & scale selection behind a details element
* Remove unnecessary server output from progression chord interpreter
* Hide irrelevant information from the song list when shown to a user that is not logged in, thereby also improving its layout in such circumstances
* Improve song list data alignment
* Fix a bug where the song's last play for a user might not return the correct song play, leading to incoherencies when assessing whether a song is forgotten
* Fix a bug where new songs would skip unused IDs

## v1.0.2.1

* Fix a bug where the password reset email would not get sent
* Fix a bug where all songs would show up in the list when logged in, rather than just the songs that should be visible to the authenticated user
* Removed potentially unsafe feedback from the password reset form
* Add and fix visual feedback to the password reset form
* Add Contributor status to users
* Fix a bug where trying to sort by capo while not logged in would cause an error

## v1.0.2

* Fix a bug where trying to send a password reset email would throw an error
* Add Contributor user status
* Visual update for public release

## v1.0.1.5

* Fix a bug where a new user's username would always be set to blank, triggering a "not null" constraint violation error
* Remove the username field from the registration form, as it will only be necessary once users are able to contribute their own songs
* Remove the default sort by artist name and song name, as it was clashing with the custom sorts, until a harmonious solution is found
* Fix sorting, should now keep track of filter and sort options when using pagination or reloading the page
* Enforce single-column songs sort
* Center fretboard labels
* Set page title to song name when viewing it
* Reduce header element size
* Fix bug where previous/next songs would lead to an error if song IDs aren't in sequence
* Redirect to songs list if song with invalid ID accessed
* Readjusted song ID sequence
* Apply default sort order to the songs list

Editor:

* Fix a display bug with the progression cyphers

## v1.0.1.4

* Add the `username` field to the user registration form
* Fix a bug when updating a song's info if it had its key or scale set to nil
* Fix a bug when showing a song if it had its key or scale set to nil

## v1.0.1.3

* Fix a bug where shifting a song's key in the viewer didn't change the keys displayed through the lyrics
* Fix a bug where viewing a song would print an extra duration marker for every single chord
* Default reps number to 1 if invalid

## v1.0.1.2

* Fix a bug that prevented progressions from being deleted
* Fix a bug where the song form always set the capo to 0 on page load, regardless of the song's actual capo recommendation
* Fix a bug that prevented editing progressions when the song's ID is not in sequence with the rest
* Fix a bug where the song progression templates shifter would redirect to the progressions' screen, rather than the progression templates' screen  
* Standardize regular beat markers, from medium dashes to regular dashes
* Fix a bug where progression chord cyphers would never display more than 1 duration marker, even when required to

## v1.0.1.1

* Add the "Freeze Chords" setting when updating songs, to indicate that song key changes shouldn't change the displayed chords
* Fix a bug where the pagination widget wouldn't update when changing pages

## v1.0.1

* Fix a bug that prevented updating progression templates
* Fix a bug that displays the one too many duration notches in progression template forms
* Fix a crash when showing a song whose key has not been set

## v1.0.0.4

* Upgrade to Rails 7.1.5
* Fix vulnerabilities
* Fix a bug that prevented changing instrument view more than once
* Fix a bug when trying to recognize chords for new progression templates
* Fix a bug where anyone could see the button to edit songs on any song list

## v1.0.0.3

* Fix a crash when creating progression templates, moving progressions, playing and sorting songs

## v1.0.0.2

* Fix a crash when creating progressions, progression templates
* Standardize order of instrument lists, songs lists, chords lists, keys lists, scales lists

## v1.0.0.1

* Fix a bug where user settings were not being created correctly
* Fix a bug where unset user settings could cause a crash
* Fix labels, typos

## v1.0.0 - 2024/09/02

**Launch!**

* Deploy on [main website](https://miredo.ca)

## Staging

## v0.5.x

* Migrate to PSQL
* Deploy with Heroku

## v0.4.x

* Implement online features:
  * Users, authentication, registration
  * Mailing
  * References, hints, feedback

## Development

## v0.3.x

* Set up a Ruby on Rails localhost project with an SQLite DB as `Miredo`

## v0.2.x

* Use a newline-separate txt file "db" and a python script to display chords according to predefined patterns

## v0.1.x

* Use an excel spreadsheet and Ultimate-guitar tabs
