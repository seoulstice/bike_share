This is going to be for good resources on key parts of the project:

Solutions:
Group by week/month/year: https://stackoverflow.com/questions/902974/grouping-by-week-month-etc-activerecord

Group by and count: https://stackoverflow.com/questions/31879150/group-by-and-count-using-activerecord

Associations: http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html

Maximum in group by query: https://stackoverflow.com/questions/6468316/maximum-in-group-by-active-record-query

Maximum in group by counter_cache:
  * ctrl-f (find): counter_cache http://guides.rubyonrails.org/association_basics.html
  * https://stackoverflow.com/questions/9739451/how-to-get-highest-count-of-associated-model-rails

Counter-Culture gem:
  * https://github.com/magnusvk/counter_culture

Create Primary Key that isn't id:
 * https://stackoverflow.com/questions/6402189/specify-custom-primary-key-in-migration

Reset primary key count on stations (see solution in seed):
  * https://stackoverflow.com/questions/28723505/rails-reset-all-postgres-sequences

Active record, multiple where conditions:
  * https://stackoverflow.com/questions/22267411/rails-where-multiple-values-one-not-nil

Embed ruby in javascript:
  * https://stackoverflow.com/questions/3597064/how-to-embed-ruby-in-javascript-rails-html-erb-file
  * https://stackoverflow.com/questions/22937676/how-do-i-call-a-javascript-function-from-an-html-erb
  * https://stackoverflow.com/questions/28870567/rails-4-passing-variables-to-javascript
  * https://www.quora.com/How-do-I-pass-a-Ruby-variable-to-JavaScript

Basic SQL Query Structure:
  * http://www.mycms.ca/index.cfm/page/sqlqueries.html

Known bugs/errors:
* NoMethodError at /stations/24 undefined method `first' for nil:NilClass
  * This is a known error the seems to pop up if there is a trip/station mismatch on the data. Since the fixture is small there are some stations without trips.

- ActiveRecord::RecordNotFound - Couldn't find Trip with 'id'=chartkick.js: error(see image in errors folder) shown in shotgun when submitting a new Trip using the new Trip form.  The error is only visible in Terminal, otherwise normal behavior.  The user is redirected to the new Trip's show page and can then edit or delete the Trip from the database.  Verified that the Trip also got saved in the Database by checking in Tux(see image in errors folder)

Lots of trips in our fixture have 1 ride.. ;-/
1) Trip Class methods .least_ridden_bike
     Failure/Error: expect(Trip.least_ridden_bike).to eq(543)
    
       expected: 543
            got: {11=>1, 144=>1, 262=>1, 683=>1, 161=>1, 576=>1, 654=>1, 151=>1, 653=>1, 649=>1, 530=>1, 600=>1, 493=>...7, 448=>7, 626=>7, 562=>7, 615=>7, 416=>7, 632=>8, 318=>8, 319=>9, 409=>9, 598=>9, 395=>11, 538=>14}
