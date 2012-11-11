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

#    @artikel = []
#    @artikel << Artikel.new("+5 Geschicklichkeits-Weste", 10, 20)
#    @artikel << Artikel.new("Alter Gouda", 2, 0)
#    @artikel << Artikel.new("Mangustenelixir", 5, 7)
#    @artikel << Artikel.new("Fedoras", 0, 80)
#    @artikel << Artikel.new("Backstage-Pässe für ein Ruby Perry Konzert", 15, 20)

describe GoldeneGans do
  
  it "should decrease VerkaufenIn value by one per day" do
  	artikel = []
  	artikel << Artikel.new("Mangustenelixir", 5, 7)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.artikel[0].verkaufenIn.must_equal 4
  end

  it "should decrease qualitaet value by one per day" do
  	artikel = []
  	artikel << Artikel.new("Mangustenelixir", 5, 7)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 6
  end

  it "should decrease qualitaet value by two per day, after VerkaufenIn is due" do
  	artikel = []
  	artikel << Artikel.new("Mangustenelixir", 1, 6)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.aktualisiere_qualitaet
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 1
  end

  it "should not decrease qualitaet below zero" do
  	artikel = []
  	artikel << Artikel.new("Mangustenelixir", 1, 6)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.aktualisiere_qualitaet
    subject.aktualisiere_qualitaet
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 0
  end

  it "should increase qualitaet value by one per day, if artikel is Alter Gouda" do
  	artikel = []
  	artikel << Artikel.new("Alter Gouda", 5, 7)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 8
  end

  it "should not increase qualitaet above 50" do
  	artikel = []
  	artikel << Artikel.new("Alter Gouda", 5, 49)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 50
  end

  it "should not change qualitaet for Fedoras" do
  	artikel = []
  	artikel << Artikel.new("Fedoras", 5, 7)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 7
  end

  it "should not change verkaufenIn for Fedoras" do
  	artikel = []
  	artikel << Artikel.new("Fedoras", 5, 7)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.artikel[0].verkaufenIn.must_equal 5
  end

  it "should increase qualitaet value by one per day, if artikel is Backstage-Pässe für ein Ruby Perry Konzert" do
  	artikel = []
  	artikel << Artikel.new("Backstage-Pässe für ein Ruby Perry Konzert", 15, 7)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 8
  end

  it "should increase qualitaet value by two in the last 10 days, if artikel is Backstage-Pässe für ein Ruby Perry Konzert" do
  	artikel = []
  	artikel << Artikel.new("Backstage-Pässe für ein Ruby Perry Konzert", 10, 7)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 9
  end

  it "should increase qualitaet value by three in the last 5 days, if artikel is Backstage-Pässe für ein Ruby Perry Konzert" do
  	artikel = []
  	artikel << Artikel.new("Backstage-Pässe für ein Ruby Perry Konzert", 5, 7)
  	subject = GoldeneGans.new(artikel)
    subject.aktualisiere_qualitaet
    subject.artikel[0].qualitaet.must_equal 10
  end
end
