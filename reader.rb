require 'pdf-reader'
require 'pry'

reader = PDF::Reader.new("AAk.pdf")

puts reader.pdf_version
puts reader.info
puts reader.metadata
puts reader.page_count
reader.pages.each do |page|
  puts page.text
end
