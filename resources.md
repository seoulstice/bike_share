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

Known bugs/errors:
* NoMethodError at /stations/24 undefined method `first' for nil:NilClass
  * This is a known error the seems to pop up if there is a trip/station mismatch on the data. Since the fixture is small there are some stations without trips.
  