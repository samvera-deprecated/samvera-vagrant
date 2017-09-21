#!/bin/sh

DEMO_TASK="
task :demo do
  with_server :development do
    IO.popen('rails server -b 0.0.0.0') do |io|
      begin
        io.each do |line|
          puts line
        end
      rescue Interrupt
        puts 'Stopping server'
      end
    end
  end
end"

DEFAULT_ADMIN_SET_TASK="
task :default_admin_set do
  with_server :development do
    Rake::Task['hyrax:default_admin_set:create'].invoke
    exit
  end
end
"

echo "Creating Hyrax demo in ${HOME}/hyrax-demo"
cd
rails new hyrax-demo --skip-spring
cd hyrax-demo
echo "gem 'hyrax', github: 'samvera/hyrax'" >> Gemfile
bundle install --quiet
bundle exec rails generate hyrax:install -f -q
bundle exec rails db:migrate
bundle exec rails hyrax:workflow:load
echo "$DEFAULT_ADMIN_SET_TASK" >> Rakefile
bundle exec rails default_admin_set
bundle exec rails generate hyrax:work Image -q
bundle exec rails generate hyrax:work Book -q
echo "$DEMO_TASK" >> Rakefile

echo "Creating Hyku demo in ${HOME}/hyku-demo"
cd
git clone https://github.com/samvera-labs/hyku.git hyku-demo
cd hyku-demo
sed -i -e 's/enabled: false/enabled: true/' config/settings.yml
bundle install --quiet
bundle exec rake db:create
bundle exec rake db:migrate
echo "$DEMO_TASK" >> Rakefile
