# Weather Handler
This gem was developed to help you to check weather conditions (current temperature, feels like temperature, weather description, humidity and pressure) for your city or town.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weather_handler'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install weather_handler

## Usage
Go to https://openweathermap.org/api and sign up or log in to get your API key. Add `OPEN_WEATHER_API_KEY` key to your `.env` file (look at `.env.example` file) with value which you will receive to your mail box after registration. 

After installation you new need to create instance of `WeatherHandler::Weather` class and pass any city in string format which you want to check weather for.

For example: `weather = WeatherHandler::Weather.new('london')`. Now you have new instance of WeatherHandler::Weather which you can use to find out such information as:

* current temperature (just call `weather.current_temperature('celsium')` and pass celsium, kelvin or fahrenheit argument dimension as string. Default attribute is `celsium`. So for this case you can use just as: `weather.current_temperature` and you will receive `celsium` value.
* feels like temperature (just call `weather.feels_like_temperature('fahrenheit')` and pass celsium, kelvin or fahrenheit argument dimension as string. Default attribute is `celsium`. So for this case you can use just as: `weather.feels_like_temperature` and you will receive `celsium` value.
* weather description (just call `weather.weather_description`)
* humidity (just call `weather.humidity`)
* pressure (just call `weather.pressure`)

And use it in your code. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/weather_handler. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/weather_handler/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WeatherHandler project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/weather_handler/blob/master/CODE_OF_CONDUCT.md).
