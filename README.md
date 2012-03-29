#Armory

An online learning and student management system specifically tailored for Bible Colleges.
While this is was originally intended for use in a Bible college, anyone can feel free to use this software for any use.

***********************
This is currently under active development and is not ready to be used in Production! If you would like to know when it will be ready, signup for the mailing list at: http://www.ccbcmexico.com/content/index.php?option=com_content&view=article&id=37&Itemid=32&lang=en
***********************

##How to Help

There's a lot that needs to be done to make this application happen. If you'd like to contribute, for the repo and make a pull request with your changes. There's a non-definitive TODO list at the end of this readme.

###Contributing Code

Contributing code is easy:
* Fork the repository
* Make the change you want to incorporate
* Make a pull request
* It will then be incorporated or not

Also, if you find a bug, but don't know/don't have time to make the change yourself, post an issue on the issues page.

###What needs doing?

While the TODO list is a good place to start, there's a few other things that should be mentioned:
1. I'm just beginning in web development and learning Rails. Go easy on me please but don't hesitate to offer criticisms.
2. Refactoring! I know there are many aspects of the code that could be improved, so this would be a major help.
3. Testing: Every pull request should also include the appropriate tests. Tests for existing features will be written in the coming weeks.

###Notes about the code itself

Just some quick notes about working with the code:
* Right now, I'm sticking with the gems I have unless there's a really good reason to switch. That means RSpec+cucumber for testing, Paperclip for uploads, etc.
* Thin is the server I plan on using for development and production. If you don't know, just do `gem install thin`, clone the repo and cd into the directory, then run `thin start`, it's that easy!
* The main roadmap for version 1 is fairly set in stone. It will be functional and secure, but might not have all the bells and whistles(autocomplete, multiple question-types, etc) it could have, that's what version 2 is for.
* This is free to be used by anyone but cannot be sold (will get a proper license up soon). That said, I will not add functionality for other scriptures(book of mormon, apocrapha, etc) or religions. If you'd like, feel free to fork the repository and you can add them to that.

#TODO

* Write Tests for current and any further features (will use rspec and cucumber)
* Finish filling in views for Courses and Lessons
* Create Exam views and logic along with Questions and Answers
* Add user authentication
* Add user authorization with roles: student, teacher, staff, admin