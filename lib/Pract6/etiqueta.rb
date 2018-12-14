
# @author Francisco Javier Mendoza Álvarez
class Etiqueta
	include Comparable

	attr_reader :nombre, :valor_energetico, :grasas, :grasas_saturadas, :hidratos_carbono, :azucares, :proteinas, :sal

	# metodo de inicializacion del objeto

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

	# Método para el uso del modulo Comparable

	def <=>(other)
           @valor_energetico <=> other.valor_energetico
         end

	# Convierte el Objeto en String
	#
	# == Returns:
	# Un String que representa al objeto
	
	def to_s
		"Nombre\tGrasas\tGrasas Saturadas\tHidratos de Carbono\tAzucares\tProteinas\tSales\n#{@nombre}\t#{@grasas}\t#{@grasas_saturadas}\t#{@hidratos_carbono}\t#{@azucares}\t#{@proteinas}\t#{@sal}"
	end

	# Devuelve el valor energetico en Kilojulios
	#
	# == Returns:
        # Valor energetico en KJ con precision de 2 decimales

	def get_valor_energetico_KJ
    	    ((@grasas * 37) + (@hidratos_carbono * 17) + (@proteinas * 17) + (@sal * 25)).round(1)
    	end


	# Devuelve el valor energetico en Kilocalorias
        #
        # == Returns:
        # Valor energetico en Kcal con precision de 2 decimales


	def get_valor_energetico_Kcal
    	    ((@grasas * 9) + (@hidratos_carbono * 4) + (@proteinas * 4) + (@sal * 6)).round(1)
    	end

	# Devuelve el porcentaje de ingesta recomendada del alimento
        #
        # == Returns:
        # Porcentaje de IR con precision de 2 decimales

	def get_IR
    	    (get_valor_energetico_KJ / 8400).round(2)
    	end	
end
