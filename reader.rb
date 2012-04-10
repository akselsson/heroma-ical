require 'pdf-reader'
require 'pry'

reader = PDF::Reader.new("AAk.pdf")

receiver = Class.new do
  def show_text(arg)
    puts arg
  end
end.new

puts reader.pdf_version
puts reader.info
puts reader.metadata
puts reader.page_count
reader.pages.each do |page|
  #puts page.text
  page.walk receiver
end


