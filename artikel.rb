# encoding: utf-8

class Artikel

  attr_accessor :name, :haltbarkeitsdauer, :qualitaet

  def initialize (name, haltbarkeitsdauer, qualitaet)
    @name = name
    @haltbarkeitsdauer = haltbarkeitsdauer
    @qualitaet = qualitaet
  end

end
