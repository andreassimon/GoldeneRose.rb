# encoding: utf-8

class Artikel

  attr_accessor :name, :verkaufenIn, :qualitaet

  def initialize (name, verkaufenIn, qualitaet)
    @name = name
    @verkaufenIn = verkaufenIn
    @qualitaet = qualitaet
  end

end
