# Changelog

## Early Access

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
