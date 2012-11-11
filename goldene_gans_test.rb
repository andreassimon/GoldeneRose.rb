# encoding: utf-8

require './goldene_gans.rb'
require './artikel.rb'
require 'minitest/autorun'
begin
  require 'minitest/reporters'
  MiniTest::Reporters.use!
rescue LoadError
  puts "minitest/reporters is not installed.\nYou can do so by executing \`gem install minitest-reporters\`\n\n"
end

describe GoldeneGans do

  subject do
    GoldeneGans.new
  end

  it "should do something" do
    subject.aktualisiere_qualitaet
  end

end
