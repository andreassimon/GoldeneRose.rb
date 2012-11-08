# encoding: utf-8

require './goldene_rose.rb'

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!


describe GoldeneRose do

  subject do
    GoldeneRose.new
  end

  it "sollte irgendetwas tun" do
    subject.aktualisiere_qualitaet
  end

end
