# ActiveRemote::Bulk

Extracted from ActiveRemote

Implements methods for bulk creation, updating, and deletion of records

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_remote-bulk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_remote-bulk

## Usage

```ruby
class Tag < ::ActiveRemote::Base
end

Tag.create_all(:name => "foo")
Tag.update_all(:guid => "1234", :name => "bar")
Tag.destroy_all(:guid => "1234")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Adam Hutchison/active_remote-bulk.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

