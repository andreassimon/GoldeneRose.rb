# encoding: utf-8

require './goldene_gans.rb'
require './artikel.rb'
require 'minitest/autorun'

describe GoldeneGans do
  
  subject do
    GoldeneGans.new
  end

  it "should do something" do
    subject.aktualisiere_qualitaet
  end

end
