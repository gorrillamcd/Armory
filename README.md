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

* Fork it
* Create your feature branch (`git checkout -b my-new-feature`)
* Make changes and ensure they pass the testing suite
* Commit your changes (`git commit -am 'Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request

Also, if you find a bug, but don't know how or don't have time to make the change yourself, [post an issue](https://github.com/gorrillamcd/Armory/issues).

**Do you want to try out the application**, but don't have a development environment setup? [Check out the wiki for a tutorial of how to setup the dev environment (even for windows newbies!).](https://github.com/gorrillamcd/Armory/wiki/Setting-up-the-Dev-Environment)

************************
Note: I do not track the font files with github due to licensing. In the stylesheets, I have included the links for downloading the files. They are all free to download. I will probably switch to Google or Adobe webfonts in future versions to avoid this problem.
************************

###What needs doing?

While the TODO list is a good place to start, there's a few other things that should be mentioned:

1.  Constructive criticism is very much so appreciated. I'm a self-taught developer since early 2011, so I am still a bit of a noob.
2.  Testing: Every pull request should also include the appropriate tests. Tests for existing features will be written soon.
3.  Refactoring! I know there are many aspects of the code that could be improved, so this would be a major help.

###Notes about the code itself

Just some quick notes about working with the code:

* The main roadmap for version 1 is fairly set in stone. It will be functional and secure, but might not have all the bells and whistles(autocomplete, multiple question-types, translation, transactional emails, etc) it could have, that's what version 2 is for.
* Version 1 will be very specific to ccbcmexico.com's needs. Versions afterwards will slowly become more generalized and customizable.
* This is free to be used by anyone (MIT License). That said, I will not add functionality for other scriptures(book of mormon, apocrapha, etc) or religions. You are able to fork the repository and add them if you like.

#TODO

### Version 1 Roadmap

* Improve views throughout armory to be more consistent
* Finish user CRUD interface for admins/staff to manage users
* Add-in Paypal functionality (Stripe will remain available)
* Reports for students (such as grade reports and transcripts)
* Refactor and general code-cleanup before version 2 (after aforementioned todo items)

### After Version 1

* Write Tests for current and future features (will use rspec/capybara)
* Improve Capistrano Deploy recipes to be more organized and comprehensive
* Add in transactional emails (Payment notifications, grade reports, etc)( [Mandrill](http://mandrill.com/) will be a good service to use for this)
* Revamp Dashboard view styling
* Add application configuration ability (example, can shut off payment-parts if not needed, Configurable attributes like app-name, url, etc)
* Remove references to CCBC Mexico and instead use a configurable application name (see above)