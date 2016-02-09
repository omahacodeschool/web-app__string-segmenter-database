# Toy - Web

## String Segmenter Database

The goal of this assignment is to practice storing some information in a database.

### Getting Started

#### Installation

First, fork this repository, if you haven't already.

Then clone your fork on to your local development machine:

```zsh
cd ~/Code
git clone url_for_your_copy_of_this_assignment
```

(Note: You'll need to replace `url_for_your_copy_of_this_assignment` with the actual SSH URL for your repository, which looks something like `git@github.com:sumeetjain/web-toy__some-assignment.git`.)

That will create a folder named for the assignment in **~/Code**, and it will download the files from the repository into that folder.

Next, `cd` into that newly created folder, and run the setup script:

```zsh
cd the-newly-created-folder
bin/setup
```

(Note: You'll need to replace `the-newly-created-folder` with the actual name of the folder for your assignment.)

You won't need to run the setup script for this assignment again.

If the setup script does not return any failures or errors, you're ready to work on the assignment. Open the project folder in your code editor, and begin.

### Assignment Details

The following stories should work:

#### Segmenting Strings

- The homepage shows a form with a single text field.
- Typing some text into that field and submitting the form takes the user to a new page, where the segmented version of their text is displayed.

#### Admin View

- The homepage should show a link to an "Admin" page.
- Clicking that link should take the user to a new page, where they can see a list of all of the times people have used the String Segmenter on this website.
  - The list can be formatting any way; but for each use of the String Segmenter that is listed, do provide the text that was submitted in the form as well as the resulting segmented version.
  - Example: `"blueturtledisc" ... "blue", "turtle", "disc`

##### Bonus

Say someone types into the form some text that has already been segmented. Check for that, and--if it is the case--grab the segmented version from the database and use that to show the result. Essentially, bypass the actual String Segmenting algorithm if the result is already stored in the database.