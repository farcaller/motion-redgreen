# Motion::Redgreen

Based on the https://github.com/mdks/rm-redgreen.

## Configuration

Add to your Gemfile and run `bundle install`:

```ruby
gem 'motion-redgreen'
```

Optionally, specify the output style in your Rakefile:

```ruby
Motion::Project::App.setup do |app|
  # ...
  app.redgreen_style = :full # default: :focused, also can use :progress
end
```

The available styles are `:focused`, `:full`, and `:progress`.

Example of the `:progress` output style:

![progress](https://cloud.githubusercontent.com/assets/1479215/5492859/065cab86-869a-11e4-8a75-c0c35ce332e0.png)

