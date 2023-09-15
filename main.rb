# frozen_string_literal: true

require_relative 'utils/install_requirements'
require_relative 'utils/load_gems'
require_relative 'entities/read_list'
require_relative 'entities/downloader'

MENU = <<-MENU
  To download a drama series from Doramongo.com, simply copy the link of the desired drama series and paste it within quotation marks in the terminal.
  Example: https://doramogo.com/dorama/a-business-proposal/
MENU

print "#{MENU}\n\nLink: "
url = []
url << gets.chomp

episodes_prefix = '//a[starts-with(@href, "https://doramogo.com/episodio")]'
episodes_list = read_list(url, episodes_prefix).uniq!

download_list = read_list(episodes_list, '//iframe', 'src')

download(download_list)
