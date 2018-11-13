class Etiqueta
	attr_reader :nombre, :valor_energetico, :grasas, :grasas_saturadas, :hidratos_carbono, :azucares, :proteinas, :sal

        def initialize(nombre, valor_energetico, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal)
                @nombre = nombre
                @grasas = grasas
                @valor_energetico = valor_energetico
                @grasas_saturadas = grasas_saturadas
                @hidratos_carbono = hidratos_carbono
                @azucares = azucares
                @proteinas = proteinas
                @sal = sal
        end
end
