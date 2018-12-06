class Etiqueta
	include Comparable

	attr_reader :nombre, :valor_energetico, :grasas, :grasas_saturadas, :hidratos_carbono, :azucares, :proteinas, :sal

        def initialize(nombre, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal)
                @nombre = nombre
                @grasas = grasas
                @grasas_saturadas = grasas_saturadas
                @hidratos_carbono = hidratos_carbono
                @azucares = azucares
                @proteinas = proteinas
                @sal = sal
		@valor_energetico = get_valor_energetico_Kcal()
        end

	def <=>(other)
           @valor_energetico <=> other.valor_energetico
         end

	def to_s
		"Nombre\tGrasas\tGrasas Saturadas\tHidratos de Carbono\tAzucares\tProteinas\tSales\n#{@nombre}\t#{@grasas}\t#{@grasas_saturadas}\t#{@hidratos_carbono}\t#{@azucares}\t#{@proteinas}\t#{@sal}"
	end

	def get_valor_energetico_KJ
    	    ((@grasas * 37) + (@hidratos_carbono * 17) + (@proteinas * 17) + (@sal * 25)).round(1)
    	end

	def get_valor_energetico_Kcal
    	    ((@grasas * 9) + (@hidratos_carbono * 4) + (@proteinas * 4) + (@sal * 6)).round(1)
    	end

	def get_IR
    	    (get_valor_energetico_KJ / 8400).round(2)
    	end
end
