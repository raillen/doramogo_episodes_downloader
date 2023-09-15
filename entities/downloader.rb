# frozen_string_literal: true

DIR = File.join(__dir__, '../downloads')
VIDEO_PROVIDERS = {
  'google_drive': 'https://drive.google.com/file/d/',
  'rumble': 'https://rumble.com/embed/'
}.freeze

def download(links)
  valid_links = analyze_links(links)
  valid_links.each do |link|
    YoutubeDL.download(link, format: 'mp4', output: "#{DIR}/%(title)s.%(ext)s")
             .on_progress { |state:, line:| puts "Progress: #{state.progress}%" }
             .on_error { |state:, line:| puts "Error: #{state.error}%" }
             .on_complete { |state:, line:| puts "Progress: #{state.destination}%" }
             .call
  end
end

def analyze_links(links)
  valid_links = []
  links.each do |link|
    valid_links << link if link.to_s.start_with?(VIDEO_PROVIDERS[:google_drive]) ||
                           link.to_s.start_with?(VIDEO_PROVIDERS[:rumble])
  end
  valid_links
end
