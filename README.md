# NEED A BREAK? - A meditation and stretching app

Are you ever feeling stressed out and just need a moment to quiet your mind or move your body? This app can help! Simply decide if you would like to to meditate or stretch.

If you chose a break for your mind, decide how long you would like to meditate. The app will guide you through a short breathing exercise using a series of calming command line interface (CLI), ASCII animation.

If you chose a break for your body, decide which muscles you would like to target and pick from the relevant stretches. The app will compile a short workout based on your preferences, and guide you through a series of movements using written instructions and picture references. 

## Install Instructions

1. Clone repository from GitHub
2. Open terminal
3. Navigate to the repository directory
4. Enter ruby bin/run.rb to execute an instance of the application
    * If app does not run it is because the gem catpix is needed
    * How to install catpix:
       * brew unlink imagemagick
       * brew install imagemagick@6 && brew link imagemagick@6 --force
       * imagemagick@6 is keg-only, so you’ll need to force linking.

## Functionality

This is a CLI application. It provides the following functions:
* Users create a user name to save their favorite stretches
* Users are offered a choice between meditation or workout
* Meditation displays an animated ASCII scrolling animation to breathe along to
* Lets the user build a short workout by choosing stretches that relate to the muscle of their choice
* Allows the user to select their favorite stretch from their workout
* The most favorite stretch is counted and saved to each stretch. Whenever anyone is selecting stretches they will be able to see how many people liked them in the past.

## Execution

The CLI is built around a database using the Sinatra ActiveRecord gem. The database contains 5 tables:
* favorites - a joint table between Users and Stretches
* muscle_groups - a list of muscles groups
* stretch_muscle_groups - a joint table between Stretches and Muscle_Groups
* stretches - a list of stretches, pictures, instructions, and a favorites count.
* users - a list of users

The program is run through a CLI class (not using ActiveRecord) that contains the front-end code. All the code that interacts between classes/tables is stored within the models.

## Contributing
1. Fork it (git@github.com:feihafferkamp/module-one-final-project-guidelines-web-010818.git)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
