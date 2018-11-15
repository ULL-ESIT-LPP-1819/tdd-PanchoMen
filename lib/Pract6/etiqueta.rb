class Etiqueta
	attr_reader :nombre, :valor_energetico, :grasas, :grasas_saturadas, :hidratos_carbono, :azucares, :proteinas, :sal

        def initialize(nombre, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal)
                @nombre = nombre
		@valor_energetico = 0.0
                @grasas = grasas
                @grasas_saturadas = grasas_saturadas
                @hidratos_carbono = hidratos_carbono
                @azucares = azucares
                @proteinas = proteinas
                @sal = sal
        end

	def to_s
		"Nombre\tGrasas\tGrasas Saturadas\tHidratos de Carbono\tAzucares\tProteinas\tSales\n#{@nombre}\t#{@grasas}\t#{@grasas_saturadas}\t#{@hidratos_carbono}\t#{@azucares}\t#{@proteinas}\t#{@sal}"
	end
end
