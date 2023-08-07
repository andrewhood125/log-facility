# LogFacility

Welcome to your new gem! In this directory, you'll find the files
you need to be able to package up your Ruby library into a gem. Put
your Ruby code in the file `lib/log_facility`. To experiment with
that code, run `bin/console` for an interactive prompt.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add log_facility

If bundler is not being used to manage dependencies, install the
gem by executing:

    $ gem install log_facility

## Usage


```ruby
logger = LogFacility::Logger.new('log/development.log', :truncate)
logger.debug('Pass a single string')
logger.debug('or', [:any, :combination], of: 'objects', 'that define #to_s')
```

```
// log/development.log
2023-08-06 18:42:18 -0700 DEBUG Pass a single string
2023-08-06 18:42:25 -0700 DEBUG or any combination {:of=>"objects"} that define #to_s
```
        

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag
for the version, push git commits and the created tag, and push the
`.gem` file to [rubygems.org].

## Contributing

Bug reports and pull requests are welcome on [GitHub].

## License

The gem is available as open source under the terms of the [MIT License].

[GitHub]: https://github.com/andrewhood125/log_facility
[rubygems.org]: https://rubygems.org
[MIT License]: https://opensource.org/licenses/MIT
