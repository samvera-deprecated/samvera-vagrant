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

echo "Creating CurationConcerns demo in /home/vagrant/curation-concerns-demo"
cd
rails new curation-concerns-demo --skip-spring
cd curation-concerns-demo
echo "gem 'curation_concerns', '1.5.0'" >> Gemfile
bundle install --quiet
rails generate curation_concerns:install -f -q
rails generate curation_concerns:work Book -q
rake db:migrate
echo "$DEMO_TASK" >> Rakefile

echo "Creating Sufia demo in /home/vagrant/sufia-demo"
cd
rails new sufia-demo --skip-spring
cd sufia-demo
echo "gem 'sufia', github: 'projecthydra/sufia', branch: :master" >> Gemfile
echo "gem 'flipflop', github: 'jcoyne/flipflop', branch: :hydra" >> Gemfile
bundle install --quiet
rails generate sufia:install -f -q
rails generate sufia:work Work -q
rake db:migrate
echo "$DEMO_TASK" >> Rakefile
