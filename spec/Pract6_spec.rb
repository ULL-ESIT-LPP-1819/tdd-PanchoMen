require './lib/Pract6/etiqueta.rb'
require './lib/Pract6/lista.rb'
require './lib/Pract6/individuo.rb'
require './lib/Pract6/valoracionnutricional.rb'
require './lib/Pract6/paciente.rb'


RSpec.describe Etiqueta do

	before :each do
					 #   Nombre,grasas,grasas_saturadas,hidratos_carbono,azucares,proteinas,sal
		@etiqueta1 = Etiqueta.new("Galletas", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@etiqueta2 = Etiqueta.new("Chocolate", 30.9,10.6,57.5,56.3,6.3,0.107)
		@etiqueta3 = @etiqueta2
  		@etiqueta4 = Etiqueta.new("Leche", 60,15,50,56.3,7,0.3)
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

	describe "Pruebas de Comparable" do
		it "Operador <" do
			expect(@etiqueta1 < @etiqueta2).to eq(true)
			expect(@etiqueta2 < @etiqueta1).to eq(false)
		end

		it "Operador >" do
			expect(@etiqueta2 > @etiqueta1).to eq(true)
                        expect(@etiqueta1 > @etiqueta2).to eq(false)
                end

		it "Operador ==" do
			expect(@etiqueta2 == @etiqueta3).to eq(true)
			expect(@etiqueta1 > @etiqueta2).to eq(false)
                end

		it "Operador <=" do
			expect(@etiqueta1 <= @etiqueta2).to eq(true)
                        expect(@etiqueta2 <= @etiqueta1).to eq(false)
			expect(@etiqueta2 <= @etiqueta3).to eq(true)
                end

		it "Operador >=" do
			expect(@etiqueta2 >= @etiqueta1).to eq(true)
                        expect(@etiqueta1 >= @etiqueta2).to eq(false)
			expect(@etiqueta2 >= @etiqueta3).to eq(true)
                end

		it "Operador between?" do
			expect(@etiqueta2.between?(@etiqueta1,@etiqueta4)).to eq(true)
			expect(@etiqueta1.between?(@etiqueta2,@etiqueta4)).to eq(false)
                end  
	end

end

RSpec.describe Lista do
	describe "# Pruebas de la clase Lista #" do
		 before :each do
                	@lista = Lista.new()
                                          #   Nombre,grasas,grasas_saturadas,hidratos_carbono,azucares,proteinas,sal
                	@etiqueta1 = Etiqueta.new("Chocolate", 30.9,10.6,57.5,56.3,6.3,0.107)
               		@etiqueta2 = Etiqueta.new("Galletas", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)
        	        @etiqueta3 = Etiqueta.new("Leche", 60,15,50,56.3,7,0.3)
	        end

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

        describe "# Pruebas para la clase Individuo #" do
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
		@valoracion1 = ValoracionNutricional.new(@persona1) #Bajo peso
		@persona2 = Individuo.new("Manuel", 63, 1.80, 60, 1, [0.70, 0.71], [0.80, 0.75])
                @valoracion2 = ValoracionNutricional.new(@persona2) #Adecuado
		@persona3 = Individuo.new("Jose", 100, 1.63, 16, 1, [0.70, 0.71], [0.80, 0.75])
                @valoracion3 = ValoracionNutricional.new(@persona3) #Obesidad grado 2
		@valoracion4 = @valoracion3
	end

	describe "# Pruebas para la clase ValoraciónNutricional #" do
		it "Prueba para el IMC" do 
			expect(@valoracion1.cal_imc).to eq(15.43)
		end

		it "Prueba para el porcentaje de grasa" do
                        expect(@valoracion1.cal_porcentaje_grasa).to eq(9.22)
                end

		it "Prueba para el RCC" do
			expect(@valoracion1.cal_rcc).to eq(0.91)
		end

		it "Prueba to_s" do
			@valoracion1.calcular()
                        expect(@valoracion1.to_s).to eq("IMC: 15.43\nPorcentaje de grasa: 9.22\nRCC: 0.91")
		end
	end

	describe "Pruebas de Comparable" do
                it "Operador <" do
                        expect(@valoracion1 < @valoracion2).to eq(true)
                        expect(@valoracion2 < @valoracion1).to eq(false)
                end

                it "Operador >" do
                        expect(@valoracion2 > @valoracion1).to eq(true)
                        expect(@valoracion1 > @valoracion2).to eq(false)
                end

                it "Operador ==" do
                        expect(@valoracion4 == @valoracion3).to eq(true)
                        expect(@valoracion1 > @valoracion2).to eq(false)
                end

                it "Operador <=" do
                        expect(@valoracion1 <= @valoracion2).to eq(true)
                        expect(@valoracion2 <= @valoracion1).to eq(false)
                        expect(@valoracion4 <= @valoracion3).to eq(true)
                end

                it "Operador >=" do
                        expect(@valoracion2 >= @valoracion1).to eq(true)
                        expect(@valoracion1 >= @valoracion2).to eq(false)
                        expect(@valoracion4 >= @valoracion3).to eq(true)
                end

                it "Operador between?" do
                        expect(@valoracion2.between?(@valoracion1,@valoracion4)).to eq(true)
                        expect(@valoracion1.between?(@valoracion2,@valoracion4)).to eq(false)
                end
        end


end

RSpec.describe Paciente do
	describe "# Pruebas para la clase Paciente #" do
		before :all do
                	@paciente1 = Paciente.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75])
        	end

		it "Prueba herencia" do
			expect(@paciente1.is_a?Individuo).to eq(true)
		end

		it "Prueba de la clase del objeto" do
                        expect(@paciente1.instance_of?Paciente).to eq(true)
                end

		it "Prueba de tipo de objeto" do
                        expect(@paciente1.is_a?Paciente).to eq(true)
                end

		it "Prueba de Jerarquía" do
			expect(@paciente1).to be_a_kind_of(BasicObject)
			expect(@paciente1).to be_a_kind_of(Object)
			expect(@paciente1).to be_a_kind_of(Individuo)
			expect(@paciente1).to be_a_kind_of(Paciente)
		end

		it "Comprobar que existe un nombre" do
                        expect(@paciente1.nombre).to eq("Pepe")
                end

		it "Prueba para el IMC" do
                        expect(@paciente1.imc).to eq(15.43)
                end

		it "Prueba para el porcentaje de grasa" do
                        expect(@paciente1.porcentaje_grasa).to eq(9.22)
                end

		it "Prueba para el RCC" do
                        expect(@paciente1.rcc).to eq(0.91)
                end

		it "Prueba to_s" do
			expect(@paciente1.to_s).to eq("\tPepe\npeso: 50\ntalla: 1.8\nedad: 30\nsexo: hombre\nmedia circunferencia de cintura: 0.705\nmedia circunferencia de cadera: 0.775\n\tValoracion Nutricional:\nIMC: 15.43\nPorcentaje de grasa: 9.22\nRCC: 0.91")
		end
	end

	describe "# Pruebas de la Practica 10 #" do
		before :all do
                        @paciente1 = Paciente.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75])
                end

		it "Prueba para el calculo del peso teorico ideal" do
			expect(@paciente1.respond_to?('peso_teorico_ideal')).to eq(true)
			expect(@paciente1.peso_teorico_ideal).to eq(72.5)
		end
	end
end

RSpec.describe Lista do
	describe "Prueba de Lista de Pacientes" do
	
		before :all do
                	@lista = Lista.new()
                	@paciente1 = Paciente.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75]) #Bajo peso
                	@paciente2 = Paciente.new("Patricia", 80, 1.70, 19, 0, [0.70, 0.71], [0.80, 0.75]) #Sobrepeso
                	@paciente3 = Paciente.new("Manuel", 63, 1.80, 60, 1, [0.70, 0.71], [0.80, 0.75]) #Adecuado
                	@paciente4 = Paciente.new("Jose", 100, 1.63, 16, 1, [0.70, 0.71], [0.80, 0.75]) #Obesidad grado 2
                	@paciente5 = Paciente.new("Teresa", 60, 1.40, 44, 0, [0.70, 0.71], [0.80, 0.75]) #Obesidad grado 1 
                	@lista.insert(@paciente1)
                	@lista.insert(@paciente2)
               	 	@lista.insert(@paciente3)
                	@lista.insert(@paciente4)
        	        @lista.insert(@paciente5)
	        end
	
	
		it "Prueba de clasificación" do
			expect(@lista.shift.valoracion_nutricional.clas_imc).to eq("Obesidad grado 1")
			expect(@lista.shift.valoracion_nutricional.clas_imc).to eq("Obesidad grado 2")
			expect(@lista.shift.valoracion_nutricional.clas_imc).to eq("Adecuado")
			expect(@lista.shift.valoracion_nutricional.clas_imc).to eq("Sobrepeso")
			expect(@lista.shift.valoracion_nutricional.clas_imc).to eq("Bajo peso")
		end
	end

	describe "Pruebas para enumerar listas de etiquetas de informacion nutricional" do
                 before :all do
                        @lista = Lista.new()
                                          #   Nombre,grasas,grasas_saturadas,hidratos_carbono,azucares,proteinas,sal
                        @etiqueta1 = Etiqueta.new("Chocolate", 30.9,10.6,57.5,56.3,6.3,0.107)
                        @etiqueta2 = Etiqueta.new("Galletas", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)
                        @etiqueta3 = Etiqueta.new("Leche", 60,15,50,56.3,7,0.3)

                        @lista.insert(@etiqueta1)
                        @lista.insert(@etiqueta2)
                        @lista.insert(@etiqueta2)
                        @lista.insert(@etiqueta3)
                end

                it "La lista se puede recorrer" do
                        expect(@lista).to respond_to(:each)
                end

                it "comprobrando el metodo collect" do
                        expect(@lista.collect{|e| e.grasas >= 20.0}).to eq([true,false,false,true])
                end

                it "comprobando el metodo select" do
                        expect(@lista.select{|e| e.grasas <= 20.0}).to eq([@etiqueta2, @etiqueta2])
                end

                it "comprobando el metodo max" do
                        expect(@lista.max).to eq(@etiqueta3)
                end

                it "comprobando el metodo min" do
                        expect(@lista.min).to eq(@etiqueta2)
                end

                it "comprobando el metodo sort" do
                        expect(@lista.sort).to eq([@etiqueta2, @etiqueta2, @etiqueta1, @etiqueta3])
                end
        end


	describe "Pruebas para enumerar listas de valoraciones nutricionales de individuos" do
                 before :all do
                        @lista = Lista.new()

                        @persona1 = Individuo.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75])
                        @valoracion1 = ValoracionNutricional.new(@persona1) #Bajo peso
                        @persona2 = Individuo.new("Manuel", 63, 1.80, 60, 1, [0.70, 0.71], [0.80, 0.75])
                        @valoracion2 = ValoracionNutricional.new(@persona2) #Adecuado
                        @persona3 = Individuo.new("Jose", 100, 1.63, 16, 1, [0.70, 0.71], [0.80, 0.75])
                        @valoracion3 = ValoracionNutricional.new(@persona3) #Obesidad grado 2
                        @valoracion4 = @valoracion3

                        @lista.insert(@valoracion1)
                        @lista.insert(@valoracion2)
                        @lista.insert(@valoracion3)
                        @lista.insert(@valoracion4)
                end

                it "La lista se puede recorrer" do
                        expect(@lista).to respond_to(:each)
                end

                it "comprobrando el metodo collect" do
                        expect(@lista.collect{|v| v.imc >= 24.9}).to eq([true,true,false,false])
                end

                it "comprobando el metodo select" do
                        expect(@lista.select{|v| v.imc <= 24.9}).to eq([@valoracion2, @valoracion1])
                end

                it "comprobando el metodo max" do
                        expect(@lista.max).to eq(@valoracion3)
                end

                it "comprobando el metodo min" do
                        expect(@lista.min).to eq(@valoracion1)
                end

                it "comprobando el metodo sort" do
                        expect(@lista.sort).to eq([@valoracion1, @valoracion2, @valoracion3, @valoracion4])
                end
        end
end
