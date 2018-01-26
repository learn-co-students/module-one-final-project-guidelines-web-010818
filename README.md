# NEED A BREAK? - A meditation and stretching app

Are you ever feeling stressed out and just need a moment to take a break? This app can help! Simply decide if you would like some meditation time or stretching time.

If you chose mediation, the app will ask you how long you would like to meditate. It then instructs your breathing with a CLI ASCII animation.

If you chose workout, you are given the option to choose from different muscles to stretch and then various stretches relating to that muscle. The app will build a short workout based on your selections. The sequence will run, easing you into a more relaxed state.

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

This is a command line application (CLI). It provides the following functions:
* Users create a user name to save their favorite stretches
* Users are offered a choice between meditation or workout
* Meditation displays an animated ASCII scrolling animation to breathe along to
* Lets the user build a short workout by choosing stretches that relate to the muscle of their choice
* Allows the user to select their favorite stretch from their workout
* The most favorite stretch is counted and saved to each stretch. Whenever anyone is selecting stretches they will be able to see how many people liked them in the past.

## Execution

The CLI is built around a database using the Sinatra ActiveRecord gem. The database contains 5 tables:
* favorites
   * A join table between User and Stretches
* muscle_groups
   * A list of muscles to choose from
* Stretch_Muscle_Groups
   * A join table between Stretches and Muscle Groups
* Stretches
   * A list of stretches, pictures, instructions, and a favorites count.
* Users
  * A list of users

The program is run through a Cli class (not using ActiveRecord) that contains the front-end code. All the code that interacts between classes/tables is stored within the models.

## Contributing
1. Fork it (
git@github.com:feihafferkamp/module-one-final-project-guidelines-web-010818.git
)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
