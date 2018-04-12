# Overtime App

## Key Requirements : Company needs documentation that salaried ##employees did or did not get overtime each week

## Models

*  X Post -> date:date rationale:text
*  X User -> Devise
*  X AdminUser - STI


## Features:
* Approval Workflow
* X Block non admin and guest: users
* X Administrate admin dashboard
* SMS Sending -> link to approval or overtime input
* Administrate to managers for approval
* Needs to be documented if employer did not log overtime

## UI:
*  X Boostrap -> Formatting
*  Icons from font awesome
*  X Update the styles for forms


## Refactor TODOS:
* Add full name method for users
* Refactor user Association integration with rspec
* Refactor posts/_form for admin  wth status
* Fix post_spec.rb: 81
