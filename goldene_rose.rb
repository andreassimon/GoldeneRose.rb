# encoding: utf-8

require './artikel.rb'

class GoldeneRose

  @artikel = []

  def initialize
    @artikel = []
    @artikel << Artikel.new("+5 Geschicklichkeits-Weste", 10, 20)
    @artikel << Artikel.new("Cambozola", 2, 0)
    @artikel << Artikel.new("Mangustenelixir", 5, 7)
    @artikel << Artikel.new("Sulfur, Hand von Ragnaros", 0, 80)
    @artikel << Artikel.new("Backstage-Pässe für ein TAFKAL80ETC Konzert", 15, 20)
  end

  def aktualisiere_qualitaet

    for i in 0..(@artikel.size-1)
      if (@artikel[i].name != "Cambozola" && @artikel[i].name != "Backstage-Pässe für ein TAFKAL80ETC Konzert")
        if (@artikel[i].qualitaet > 0)
          if (@artikel[i].name != "Sulfur, Hand von Ragnaros")
            @artikel[i].qualitaet = @artikel[i].qualitaet - 1
          end
        end
      else
        if (@artikel[i].qualitaet < 50)
          @artikel[i].qualitaet = @artikel[i].qualitaet + 1
          if (@artikel[i].name == "Backstage-Pässe für ein TAFKAL80ETC Konzert")
            if (@artikel[i].haltbarkeitsdauer < 11)
              if (@artikel[i].qualitaet < 50)
                @artikel[i].qualitaet = @artikel[i].qualitaet + 1
              end
            end
            if (@artikel[i].haltbarkeitsdauer < 6)
              if (@artikel[i].qualitaet < 50)
                @artikel[i].qualitaet = @artikel[i].qualitaet + 1
              end
            end
          end
        end
      end
      if (@artikel[i].name != "Sulfur, Hand von Ragnaros")
        @artikel[i].haltbarkeitsdauer = @artikel[i].haltbarkeitsdauer - 1;
      end
      if (@artikel[i].haltbarkeitsdauer < 0)
        if (@artikel[i].name != "Cambozola")
          if (@artikel[i].name != "Backstage-Pässe für ein TAFKAL80ETC Konzert")
            if (@artikel[i].qualitaet > 0)
              if (@artikel[i].name != "Sulfur, Hand von Ragnaros")
                @artikel[i].qualitaet = @artikel[i].qualitaet - 1
              end
            end
          else
            @artikel[i].qualitaet = @artikel[i].qualitaet - @artikel[i].qualitaet
          end
        else
          if (@artikel[i].qualitaet < 50)
            @artikel[i].qualitaet = @artikel[i].qualitaet + 1
          end
        end
      end
    end
  end

end
