This app is a showcase of what we think is a bug in activerecord.

To reproduce, just clone the app, run bundle install and rake db:migrate, then fire up a rails console and type:

    Address.by_street("foo: bar").include_addressable
    # => []
    # Nothing happens, this is expected, as we didn't even created any record yet

    Address.by_street("foo. bar").include_addressable
    # => ActiveRecord::EagerLoadPolymorphicError: Can not eagerly load the polymorphic association :addressable
    # BOOM!

What is happening? Apparently, rails is trying to extract table names from the raw query (`SELECT "addresses".* FROM "addresses" WHERE "addresses"."street" = 'foo. bar'`), in order to perform a slq JOIN if neccessary. And basically every word followed by a dot is a table_name, so in this example, rails thinks "foo" is a table name, when it clearly is not.

So, what do you think? A bug, or a misuse of the framework?
