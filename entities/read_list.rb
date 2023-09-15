# frozen_string_literal: true

def read_list(list = [], filter = '', attrib = 'href')
  result = []

  list.each do |i|
    response = RestClient.get(i) if i.instance_of? String
    temp = Nokogiri::HTML(response).xpath(filter)
    temp.each { |x| result << x.attr(attrib) }
  end

  result
end
