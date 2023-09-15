# frozen_string_literal: true

if !system('gem list bundler')
  system 'gem install bundler && bundle install'
else
  system 'bundle install'
end

if !system('pip show youtube-dl')
  system "pip install youtube-dl && \
  sudo -H pip install --upgrade youtube-dl"
else
  system 'sudo -H pip install --upgrade youtube-dl'
end
