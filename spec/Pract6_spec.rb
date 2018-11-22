require './lib/Pract6/etiqueta.rb'
require './lib/Pract6/lista.rb'
require './lib/Pract6/individuo.rb'
require './lib/Pract6/valoracionnutricional.rb'

RSpec.describe Etiqueta do

	before :each do
					 #   Nombre,grasas,grasas_saturadas,hidratos_carbono,azucares,proteinas,sal
		@etiqueta1 = Etiqueta.new("Galletas", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@etiqueta2 = Etiqueta.new("Chocolate", 30.9,10.6,57.5,56.3,6.3,0.107)
  	end

	describe "# Pruebas de existencias de los atributos #" do
		it "Comprobar que existe un nombre de etiqueta" do
			expect(@etiqueta1.nombre).not_to be nil
		end

		it "Comprobar que existe la cantidad de grasas" do
                	expect(@etiqueta1.grasas).not_to be nil
        	end

		it "Comprobar que existe la cantidad de grasas saturadas" do
                	expect(@etiqueta1.grasas_saturadas).not_to be nil
        	end

		it "Comprobar que existe la cantidad de hidratos de carbono" do
                	expect(@etiqueta1.hidratos_carbono).not_to be nil
        	end

		it "Comprobar que existe la cantidad de azúcares" do
			expect(@etiqueta1.azucares).not_to be nil
        	end

		it "Comprobar que existe la cantidad de proteínas" do
			expect(@etiqueta1.proteinas).not_to be nil
        	end

		it "Comprobar que existe la cantidad de sal" do
			expect(@etiqueta1.sal).not_to be nil
        	end
	end

	describe "# Pruebas de existencia de los metodos para acceder a los atributos #" do
		it "Comprobar que un método para obtener el nombre" do
			expect(@etiqueta1.nombre).to eq("Galletas")
		end

		it "Comprobar que exite un método para obtener las grasas" do
			expect(@etiqueta1.grasas).to eq(0.0)
                end

		it "Comprobar que exite un método para obtener las grasas saturadas" do
			expect(@etiqueta1.grasas_saturadas).to eq(0.0)
                end

		it "Comprobar que exite un método para obtener los hidratos de carbono" do
                        expect(@etiqueta1.hidratos_carbono).to eq(0.0)
                end

		it "Comprobar que exite un método para obtener los azucares" do
                        expect(@etiqueta1.azucares).to eq(0.0)
                end

		it "Comprobar que exite un método para obtener las proteinas" do
                        expect(@etiqueta1.proteinas).to eq(0.0)
                end

		it "Comprobar que existe un método para obtener la sal" do
                        expect(@etiqueta1.sal).to eq(0.0)
                end
	end

	describe "# Prueba de salida por pantalla #" do
		it "Comprobar función to_s" do
			expect(@etiqueta1.to_s).to eq("Nombre\tGrasas\tGrasas Saturadas\tHidratos de Carbono\tAzucares\tProteinas\tSales\nGalletas\t0.0\t0.0\t0.0\t0.0\t0.0\t0.0")
		end
	end

	describe "# Pruebas de funciones de calculo #" do
		it "Existe un metodo para obtener el valor energetico en KJ" do
			expect(@etiqueta2.get_valor_energetico_KJ).to eq(2230.6)
		end

		it "Existe un metodo para obtener el valor energetico en Kcal" do
                        expect(@etiqueta2.get_valor_energetico_Kcal).to eq(533.9)
                end

		it "Existe un metodo para obtener el valor de IR por alimento para 100g" do
			expect(@etiqueta2.get_IR).to eq(0.27)
		end
	end
end

RSpec.describe Lista do
	before :each do
		@lista = Lista.new()
					  #   Nombre,grasas,grasas_saturadas,hidratos_carbono,azucares,proteinas,sal
		@etiqueta1 = Etiqueta.new("Chocolate", 30.9,10.6,57.5,56.3,6.3,0.107)
		@etiqueta2 = Etiqueta.new("Galletas", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)

	end
	
	describe "# Pruebas de la clase Lista #" do
		it "Prueba para el nodo next" do
    			expect(@lista.inicio.next).to eq(nil)
		end

		it "Prueba para el nodo prev" do
    			expect(@lista.final.prev).to eq(nil)
		end

		it "Prueba para el metodo que comprueba si la lista está vacía" do
    			expect(@lista.empty?).to eq(true)
			@lista.insert(@etiqueta1)
			expect(@lista.empty?).to eq(false)
  		end

		it "Prueba de insertar un elemento" do
    			@lista.insert(@etiqueta1)
    			expect(@lista.inicio.value).to eq(@etiqueta1)
    			expect(@lista.size).to eq(1)
    			expect(@lista.empty?).to eq(false)
  		end

		it "Extraer el primer elemento de la lista" do
    			@lista.insert(@etiqueta1)
			@lista.insert(@etiqueta2)
    			expect(@lista.shift).to eq(@etiqueta2)
    			expect(@lista.empty?).to eq(false)
  		end

		it "Extraer el ultimo elemento de la lista" do
                        @lista.insert(@etiqueta1)
			@lista.insert(@etiqueta2)
                        expect(@lista.pop).to eq(@etiqueta1)
                        expect(@lista.empty?).to eq(false)
                end
  	end
end

RSpec.describe Individuo do
        before :each do
                @persona1 = Individuo.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75])
        end

        describe "# Pruebas de existencias de los atributos #" do
		it "Comprobar que existe un nombre" do
			expect(@persona1.nombre).not_to be nil
		end

		it "Comprobar que existe el peso" do
			expect(@persona1.peso).not_to be nil
		end

		it "Comprobar que existe la talla" do
                        expect(@persona1.talla).not_to be nil
                end

		it "Comprobar que existe la edad" do
			expect(@persona1.edad).not_to be nil
		end

		it "Comprobar que existe la sexo" do
                        expect(@persona1.sexo).not_to be nil
                end

		it "Comprobar que existe la circunferencia de la cintura" do
                        expect(@persona1.cir_cintura).not_to be nil
                end

		it "Comprobar que existe la circunferencia de la cadera" do
                        expect(@persona1.cir_cadera).not_to be nil
                end

		it "Prueba to_s" do
			expect(@persona1.to_s).to eq("\tPepe\npeso: 50\ntalla: 1.8\nedad: 30\nsexo: hombre\nmedia circunferencia de cintura: 0.705\nmedia circunferencia de cadera: 0.775")
		end
        end

end


RSpec.describe ValoracionNutricional do
	before :each do
		@persona1 = Individuo.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75])
		@valoracion1 = ValoracionNutricional.new(@persona1)
	end

	describe "# Pruebas para la clase ValoraciónNutricional #" do

	end

end
