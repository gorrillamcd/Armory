#Armory

An online learning and student management system specifically tailored for Bible Colleges.
While this was originally intended for use in a Bible college, anyone can feel free to use this software for any use. 

***********************
This is currently under active development and is not ready to be used in Production! If you would like to know when it will be ready, signup for the mailing list at [ccbcmexico.com](http://www.ccbcmexico.com/content/index.php?option=com_content&view=article&id=37&Itemid=32&lang=en)
***********************

##How to Help

There's a lot that needs to be done to make this application happen. If you'd like to contribute, fork the repo and make a pull request with your changes. There's a [non-definitive TODO list](#todo) at the end of this readme.

###Contributing Code

Contributing code is **easy**:

* Fork the repository
* Make the change you want to incorporate
* Make a pull request
* It will then be incorporated or not

Also, if you find a bug, but don't know/don't have time to make the change yourself, post an issue on the issues page.

**Do you want to try out the application**, but don't have a development environment setup? Check the wiki for a tutorial of how to setup the dev environment (even for windows newbies!).

###What needs doing?

While the TODO list is a good place to start, there's a few other things that should be mentioned:

1.  I'm just beginning in web development and learning Rails. Go easy on me but please don't hesitate to offer criticisms.
2.  Refactoring! I know there are many aspects of the code that could be improved, so this would be a major help.
3.  Testing: Every pull request should also include the appropriate tests. Tests for existing features will be written soon.

###Notes about the code itself

Just some quick notes about working with the code:

* Right now, I'm sticking with the gems I have unless there's a really good reason to switch. That means RSpec for testing, Paperclip for uploads, etc.
* `Thin` is the server I plan on using for development and production. If you don't know, just do `gem install thin`, clone this repo and cd into the directory, then run `thin start`, it's that easy!
* The main roadmap for version 1 is fairly set in stone. It will be functional and secure, but might not have all the bells and whistles(autocomplete, multiple question-types, translation, etc) it could have, that's what version 2 is for.
* This is free to be used by anyone but cannot be sold (will get a proper license up soon). That said, I will not add functionality for other scriptures(book of mormon, apocrapha, etc) or religions. If you'd like, fork the repository and you can add them yourself.

#TODO
[todo]: #

* Write Tests for current and any further features (will use rspec/capybara)
* Create Exam views and logic along with Questions and Answers
* Finish user CRUD interface for admins to manage users
* Code User Interface (already designed and looking sweet!; templates will probably come in v3.0)
* Refactor and general code-cleanup