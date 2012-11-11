# encoding: utf-8

require './artikel.rb'

class GoldeneGans

  @artikel = []

  def initialize
    @artikel = []
    @artikel << Artikel.new("+5 Geschicklichkeits-Weste", 10, 20)
    @artikel << Artikel.new("Alter Gouda", 2, 0)
    @artikel << Artikel.new("Mangustenelixir", 5, 7)
    @artikel << Artikel.new("Fedoras", 0, 80)
    @artikel << Artikel.new("Backstage-Pässe für ein Ruby Perry Konzert", 15, 20)
  end


  def aktualisiere_qualitaet

    for i in 0..(@artikel.size-1)
      if (@artikel[i].name != "Alter Gouda" && @artikel[i].name != "Backstage-Pässe für ein Ruby Perry Konzert")
        if (@artikel[i].qualitaet > 0)
          if (@artikel[i].name != "Fedoras")
            @artikel[i].qualitaet = @artikel[i].qualitaet - 1
          end
        end
      else
        if (@artikel[i].qualitaet < 50)
          @artikel[i].qualitaet = @artikel[i].qualitaet + 1
          if (@artikel[i].name == "Backstage-Pässe für ein Ruby Perry Konzert")
            if (@artikel[i].verkaufenIn < 11)
              if (@artikel[i].qualitaet < 50)
                @artikel[i].qualitaet = @artikel[i].qualitaet + 1
              end
            end
            if (@artikel[i].verkaufenIn < 6)
              if (@artikel[i].qualitaet < 50)
                @artikel[i].qualitaet = @artikel[i].qualitaet + 1
              end
            end
          end
        end
      end
      if (@artikel[i].name != "Fedoras")
        @artikel[i].verkaufenIn = @artikel[i].verkaufenIn - 1;
      end
      if (@artikel[i].verkaufenIn < 0)
        if (@artikel[i].name != "Alter Gouda")
          if (@artikel[i].name != "Backstage-Pässe für ein Ruby Perry Konzert")
            if (@artikel[i].qualitaet > 0)
              if (@artikel[i].name != "Fedoras")
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
