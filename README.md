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
  app.redgreen_style = :full # default: :focused
end
```

The available styles are *:focused* and *:full*.
