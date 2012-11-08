# encoding: utf-8

require './gilded_rose.rb'

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!


describe GildedRose do

  subject do
    GildedRose.new
  end

  it "should do something" do
    subject.update_quality
  end

end
