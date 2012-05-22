require "motion-redgreen/version"
require "motion-redgreen/config"

Motion::Project::App.setup do |app|
  app.redgreen_style = :focused
  app.development do
    app.files << File.expand_path(File.dirname(__FILE__) + '/motion-redgreen/ansiterm.rb')
    app.files << File.expand_path(File.dirname(__FILE__) + '/motion-redgreen/string.rb')
  end
end

