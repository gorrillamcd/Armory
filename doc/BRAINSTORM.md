I figure this is as good a place as any to include some brainstorming for features/improvements to Armory:

### Version 1

* All v1 issues on github
* Cleanup look of UI (it's kinda plain right now)
* Basic refactoring, just enough to make it read nice and be production-worthy

### Version 2

* Generate pdf Syllabus for courses from database (that'd be an awesome feature!)
* Include basic student/teacher communication tools. More to come in the future, but it's a start.

***********************************************************************************

## User Interface

This section is brainstorming specifically related to the User Interface. It's incredibly important since, up until this point in development, UI has been very adhoc and only as-needed, so I could focus more on backend logic.

******************************

### User Needs

*It's important to note that teachers, staff, and admins are administrative groups of users. Students are the only user group that can take classes and receive grades. That may change in the future, but for now, it is what it is.*

*Also, while in beta, all user groups will have access to providing feedback on the program itself.*

**Dashes indicate relative importance to help with information hierarchy: - just necessary, -- important, --- most important**

**Students:**

* Take courses ---
* Track their overall grade and grades for individual courses --
* Subscribe to courses -
* Take tests --
* Communicate with teacher (ask questions) -
* Track/Update personal/account information -
* Access Research materials easily --
* Watch lessons ---

**Teachers:**

* Communicate with students (receive and answer questions)
* Edit information on owned courses
* Communicate with staff
* Grade assignments *(future)*

**Staff:**

This one is easier to list by what questions need answering for a staff person:

* How many students? (access demographic information)
* What are the grades like?
* What classes do we have with active students? (and vice-versa as well as historic info)
* How do I contact a specific student?
* How do I add a course?
* How about lessons and quizzes?
* What students have/have not paid for courses?
* How do I manage/add/correct translations?
* How do I communicate with both students and teachers?
* How do I delete a rogue user?

**Admin:**

This is one of the easiest since it inherits everything from Staff with a few additions:

* Manage Staff, teachers, students, and other admins
* Correct existing grades (won't be added unless proven necessary)
* Most likely more, but this is a good start.