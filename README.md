# <img src='https://cloud.githubusercontent.com/assets/544541/4461515/092962a4-48bb-11e4-8e4c-88bee6e5a321.jpg' width=50> Engineering Code Challenge

## Installation & Useage

* `cd` into the directory and run `bundle install`

* Run `ruby print_sorted_students.rb` to view the desired output.

## Summary of Approach

Guiding principles:

* Favor explicitness over DRY-ness/cleverness/brevity.

* Follow [Sandi Metz's
  rules](https://robots.thoughtbot.com/sandi-metz-rules-for-developers) to the
best of my ability.


Approach:

* [Discovery
  Testing](https://github.com/testdouble/contributing-tests/wiki/Discovery-Testing), test-first approach. Top-down, use doubles to stub out
  functionality that will come from the next layer below, one high-level integration test
  (`student_viewer_cli_spec` in this case) to make sure all pieces work
together because of the free use of doubles in specs.

* Start with the `StudentViewerCLI` class and spec to imagine an interface for
  the program, and work down from there.

* Keep things as modular as possible - for example, make it esay to plug in a
  different parser for CSV files in the future.


Details:

* I've been exploring Discovery Testing lately and I'm a huge fan. The top-down
  approach has consistently led to me producing less code and cleaner code. You
intuitively find the places where its best to delegate and break out another
class, and in writing the tests first and using doubles, you can also feel out
bad design because it is a pain to setup a test for.

* After starting with the `StudentViewerCli` spec and class I worked my way
  down. 

  * The `StudentImporter` is a factory that uses dependency injection to take any type of
parser object that responds to rows and returns an array of hashes. 

  * The `TXTParser` class uses the strategy pattern to choose which line parser
    class to instantiate (comma, dollar, pipe) - each of those classes is very
simple, responds to a `#parse` method and returns a hash of the fields.

  * The importer returns a `Students` collection, which is a simple class that
    uses the Proxy pattern, forwarding most of its functionality to its wrapped Array. There is a little
bit of customization for `#merge` and `#<<` that makes sure to return self (the
Students object) rather than array, so things behave properly.

  * The importer also creates Student objects from each hash. `Student` is a
    simple class that filters out any keys not specifically allowed as
properties of a `Student` object and does the work of printing itself as a
properly formatted string as well as converting city abbreviations to their full
names. The abbreviation-to-full-name city bit of code felt out of place here,
but I didn't see an obviously better way to do it and, given the small scope of
the project and time constraints, it seemed to me it was all right to leave it
as is.

