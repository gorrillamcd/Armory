#Armory

An online learning and student management system specifically tailored for Bible Colleges.
While this was originally intended for use in a Bible college, anyone can feel free to use this software for any use. 

***********************
This is currently under active development and is not ready to be used in Production! If you would like to know when it will be ready, signup for the mailing list at [ccbcmexico.com](http://www.ccbcmexico.com/content/index.php?option=com_content&view=article&id=37&Itemid=32&lang=en)
***********************

##How to Help

There's a lot that needs to be done to make this application happen. If you'd like to contribute, fork the repo and make a pull request with your changes. There's a [non-definitive TODO list](armory#todo) at the end of this readme.

###Contributing Code

Contributing code is **easy**:

* Fork the repository
* Make the change you want to incorporate
* Make a pull request
* It will then be incorporated or not

Also, if you find a bug, but don't know/don't have time to make the change yourself, post an issue on the issues page.

**Do you want to try out the application**, but don't have a development environment setup? Check the wiki for a tutorial of how to setup the dev environment (even for windows newbies!).

************************
Note: I do not track the font files with github due to licensing. In the stylesheets, I have included the links for downloading the files. They are all free to download.
************************

###What needs doing?

While the TODO list is a good place to start, there's a few other things that should be mentioned:

1.  I'm just beginning in web development and learning Rails. Go easy on me but please don't hesitate to offer criticisms.
2.  Refactoring! I know there are many aspects of the code that could be improved, so this would be a major help.
3.  Testing: Every pull request should also include the appropriate tests. Tests for existing features will be written soon.

###Notes about the code itself

Just some quick notes about working with the code:

* Right now, I'm sticking with the gems I have unless there's a really good reason to switch. That means RSpec for testing, Paperclip for uploads, etc.
* `Thin` is the server I plan on using for development and production. When you `bundle install` after cloning the repo, you should be able to do `rails s` to launch thin now instead of the default Webrick server.
* The main roadmap for version 1 is fairly set in stone. It will be functional and secure, but might not have all the bells and whistles(autocomplete, multiple question-types, translation, etc) it could have, that's what version 2 is for.
* Version 1 will be very specific to ccbcmexico.com's needs. Versions afterwards will slowly become more generalized and customizable.
* This is free to be used by anyone but cannot be sold (MIT License). That said, I will not add functionality for other scriptures(book of mormon, apocrapha, etc) or religions. You are able to fork the repository and add them if you like.

#TODO

* Write Tests for current and any further features (will use rspec/capybara)
* Create Exam views and logic along with Questions and Answers (the views/controller logic for creating exams and showing them are there, but not polished. take_exam action for a student to take an exam, is not started yet)
* Get grading-funcionality working
* Finish user CRUD interface for admins/staff to manage users
* Complete student registration process and include payment functionality
* Update lesson views and incorporate with exam views
* Reports-funcionality for various roles (students can get transcripts, admins get student activity reports, etc. No comprehensive list of what reports are needed yet.)
* Refactor and general code-cleanup before version 1 (after aforementioned todo items)