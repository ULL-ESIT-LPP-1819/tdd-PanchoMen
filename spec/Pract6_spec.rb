require './lib/Pract6/etiqueta.rb'
require './lib/Pract6/lista.rb'
require './lib/Pract6/individuo.rb'
require './lib/Pract6/valoracionnutricional.rb'
require './lib/Pract6/paciente.rb'
require './lib/Pract6/menu.rb' 
require './lib/Pract6/utils.rb'
require 'benchmark'
include Benchmark

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
                	@paciente1 = Paciente.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75], 0.27)
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

	describe "# Pruebas de la Practica 10: Paciente #" do
		before :all do
			@paciente1 = Paciente.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75], 0.27)
			@paciente2 = Paciente.new("Patricia", 80, 1.70, 19, 0, [0.70, 0.71], [0.80, 0.75], 0.12)
		end

		it "Prueba para el calculo del peso teorico ideal" do
			expect(@paciente1.respond_to?('peso_teorico_ideal')).to eq(true)
			expect(@paciente1.peso_teorico_ideal).to eq(72.5)
		end

		it "Prueba para el calculo del gasto energetico basal" do
			expect(@paciente1.respond_to?('gasto_energetico_basal')).to eq(true)
			expect(@paciente1.gasto_energetico_basal).to eq(1480)
			expect(@paciente2.gasto_energetico_basal).to eq(1606.5)
		end

		it "Prueba para el calculo del efecto termogeno de los alimentos" do
			expect(@paciente1.respond_to?('efecto_termogeno')).to eq(true)
			expect(@paciente1.efecto_termogeno).to eq(148)
		end

		it "Prueba para el calculo del gasto de actividad fisica" do
			expect(@paciente1.respond_to?('gasto_actividad_fisica')).to eq(true)
			expect(@paciente1.gasto_actividad_fisica(0.0)).to eq(0)
			expect(@paciente1.gasto_actividad_fisica(0.12)).to eq(177.6)
			expect(@paciente1.gasto_actividad_fisica(0.27)).to eq(399.6)
			expect(@paciente1.gasto_actividad_fisica(0.54)).to eq(799.2)
		end

		it "Prueba para el calculo del gasto energetico total" do
			expect(@paciente1.respond_to?('gasto_energetico_total')).to eq(true)
			expect(@paciente1.gasto_energetico_total).to eq(2027.6)
			expect(@paciente2.gasto_energetico_total).to eq(1959.93)
		end

	end
        describe "# Pruebas de la Practica 10: Menu Dietetico #" do
		 before :all do
                        @paciente1 = Paciente.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75], 0.27)
                        @paciente2 = Paciente.new("Patricia", 80, 1.70, 19, 0, [0.70, 0.71], [0.80, 0.75], 0.12)

			@chocolate = Etiqueta.new("Chocolate", 30.9,10.6,57.5,56.3,6.3,0.107)	#533.9 Kcal
			@galletas = Etiqueta.new("Galletas", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)	#350.5 Kcal
			@leche = Etiqueta.new("Leche", 60,15,50,56.3,7,0.3)			#769.8 kcal
                        @arroz = Etiqueta.new("Arroz", 60,15,50,56.3,7,0.3)			#769.8 kcal
                        @tomate = Etiqueta.new("Tomate", 60,15,50,56.3,7,0.3)			#769.8 kcal
			@pan = Etiqueta.new("Pan", 30.9,10.6,57.5,56.3,6.3,0.107)	    	#533.9 Kcal

			@menu1 = Lista.new()	#3193.8 kcal
			@menu2 = Lista.new()	#2188.1 kcal

                        @menu1.insert(@chocolate)
                        @menu1.insert(@galletas)
                        @menu1.insert(@leche)
                        @menu1.insert(@arroz)
                        @menu1.insert(@tomate)

			@menu2.insert(@chocolate)
                        @menu2.insert(@galletas)
                        @menu2.insert(@leche)
			@menu2.insert(@pan)
                end

		 it "Prueba para determinar si la alimentacion es suficiente" do #1824.84 - 2230.36
			expect(@paciente1.menu_dietectico?(@menu1)).to eq(false)
			expect(@paciente1.menu_dietectico?(@menu2)).to eq(true)
		end
	end
end

RSpec.describe Lista do
	describe "Prueba de Lista de Pacientes" do
	
		before :all do
                	@lista = Lista.new()
                	@paciente1 = Paciente.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75], 0.27) #Bajo peso
                	@paciente2 = Paciente.new("Patricia", 80, 1.70, 19, 0, [0.70, 0.71], [0.80, 0.75], 0.12) #Sobrepeso
                	@paciente3 = Paciente.new("Manuel", 63, 1.80, 60, 1, [0.70, 0.71], [0.80, 0.75], 0.54) #Adecuado
                	@paciente4 = Paciente.new("Jose", 100, 1.63, 16, 1, [0.70, 0.71], [0.80, 0.75], 0.0) #Obesidad grado 2
                	@paciente5 = Paciente.new("Teresa", 60, 1.40, 44, 0, [0.70, 0.71], [0.80, 0.75], 0.0) #Obesidad grado 1 
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

RSpec.describe Menu do
	describe "Pruebas para el ejercicio numero 1" do
		before :all do
			@chocolate = Etiqueta.new("Chocolate", 30.9,10.6,57.5,56.3,6.3,0.107)   #533.9 Kcal
                        @galletas = Etiqueta.new("Galletas", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)  #350.5 Kcal
                        @mermelada = Etiqueta.new("Mermelada", 30.9,10.6,57.5,56.3,6.3,0.107)   #533.9 Kcal
                        @donut = Etiqueta.new("Donut", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)        #350.5 Kcal
			@queso = Etiqueta.new("Queso", 30.9,10.6,57.5,56.3,6.3,0.107)	        #533.9 Kcal
                        @chorizo = Etiqueta.new("Chorizo", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)  	#350.5 Kcal
			@leche = Etiqueta.new("Leche", 60,15,50,56.3,7,0.3)                     #769.8 kcal
                        @arroz = Etiqueta.new("Arroz", 60,15,50,56.3,7,0.3)                     #769.8 kcal
                        @tomate = Etiqueta.new("Tomate", 60,15,50,56.3,7,0.3)                   #769.8 kcal
                        @pan = Etiqueta.new("Pan", 30.9,10.6,57.5,56.3,6.3,0.107)               #533.9 Kcal

			@menu1 = Menu.new()
			@menu1.add(@chocolate)
			@menu1.add(@galletas)
			@menu2 = Menu.new()
			@menu2.add(@galletas)
			@menu2.add(@mermelada)
			@menu3 = Menu.new()
			@menu3.add(@mermelada)
			@menu3.add(@chocolate)
			@menu4 = Menu.new()
			@menu4.add(@donut)
			@menu4.add(@queso)
			@menu5 = Menu.new()
			@menu5.add(@chorizo)
			@menu5.add(@leche)
			@menu6 = Menu.new()
			@menu6.add(@chorizo)
			@menu6.add(@donut)
			@menu7 = Menu.new()
			@menu7.add(@tomate)
			@menu7.add(@arroz)
			@menu8 = Menu.new()
			@menu8.add(@queso)
			@menu8.add(@pan)
			@menu9 = Menu.new()
			@menu9.add(@tomate)
			@menu9.add(@leche)
			@menu10 = Menu.new()
			@menu10.add(@pan)
			@menu10.add(@arroz)
		end

		it "Crear array de 10 menus" do
			@menus = []
			@menus << @menu1
			@menus << @menu2
			@menus << @menu3
			@menus << @menu4
			@menus << @menu5
			@menus << @menu6
			@menus << @menu7
			@menus << @menu8
			@menus << @menu9
			@menus << @menu10

			expect(@menus.length).to eq(10);
		end
	end

	describe "Pruebas para el ejercicio numero 2" do
		before :all do
			@persona1 = Individuo.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75]) #Bajo peso
                        @persona2 = Individuo.new("Patricia", 80, 1.70, 19, 0, [0.70, 0.71], [0.80, 0.75]) #Sobrepeso
                        @persona3 = Individuo.new("Manuel", 63, 1.80, 60, 1, [0.70, 0.71], [0.80, 0.75]) #Adecuado
                        @persona4 = Individuo.new("Jose", 100, 1.63, 16, 1, [0.70, 0.71], [0.80, 0.75]) #Obesidad grado 2
                        @persona5 = Individuo.new("Teresa", 60, 1.40, 44, 0, [0.70, 0.71], [0.80, 0.75]) #Obesidad grado 1
			
			@valoracion1 = ValoracionNutricional.new(@persona1)
			@valoracion2 = ValoracionNutricional.new(@persona2)
			@valoracion3 = ValoracionNutricional.new(@persona3)
			@valoracion4 = ValoracionNutricional.new(@persona4)
			@valoracion5 = ValoracionNutricional.new(@persona5)
			@valoracion6 = @valoracion1
			@valoracion7 = @valoracion2
			@valoracion8 = @valoracion3
			@valoracion9 = @valoracion4
			@valoracion10 = @valoracion5
                end

		it "Crear lista con 10 valoraciones" do
			@lista = Lista.new()

			@lista.insert(@valoracion1)
                        @lista.insert(@valoracion2)
                        @lista.insert(@valoracion3)
                        @lista.insert(@valoracion4)
			@lista.insert(@valoracion5)
                        @lista.insert(@valoracion6)
                        @lista.insert(@valoracion7)
                        @lista.insert(@valoracion8)
			@lista.insert(@valoracion9)
                        @lista.insert(@valoracion10)

			expect(@lista.size).to eq(10)
		end
	end

	 describe "Pruebas para el ejercicio numero 3, 4 y 5" do
		before :all do
                        @chocolate = Etiqueta.new("Chocolate", 30.9,10.6,57.5,56.3,6.3,0.107)   #533.9 Kcal
                        @galletas = Etiqueta.new("Galletas", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)  #350.5 Kcal
                        @mermelada = Etiqueta.new("Mermelada", 30.9,10.6,57.5,56.3,6.3,0.107)   #533.9 Kcal
                        @donut = Etiqueta.new("Donut", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)        #350.5 Kcal
                        @queso = Etiqueta.new("Queso", 30.9,10.6,57.5,56.3,6.3,0.107)           #533.9 Kcal
                        @chorizo = Etiqueta.new("Chorizo", 10.0, 4.2, 60.0, 40.6, 5.0, 0.09)    #350.5 Kcal
                        @leche = Etiqueta.new("Leche", 60,15,50,56.3,7,0.3)                     #769.8 kcal
                        @arroz = Etiqueta.new("Arroz", 60,15,50,56.3,7,0.3)                     #769.8 kcal
                        @tomate = Etiqueta.new("Tomate", 60,15,50,56.3,7,0.3)                   #769.8 kcal
                        @pan = Etiqueta.new("Pan", 30.9,10.6,57.5,56.3,6.3,0.107)               #533.9 Kcal

			@menu1 = Menu.new()	#1303.7 kcal
                        @menu1.add(@chocolate)
                        @menu1.add(@tomate)
			@menu2 = Menu.new()	#884.4 kcal
                        @menu2.add(@galletas)
                        @menu2.add(@mermelada)
			@menu3 = Menu.new()	#1067.8 kcal
                        @menu3.add(@mermelada)
                        @menu3.add(@chocolate)
			@menu4 = Menu.new()	#884.4 kcal
                        @menu4.add(@donut)
                        @menu4.add(@queso)
			@menu5 = Menu.new()	#1120.3 kcal
                        @menu5.add(@chorizo)
                        @menu5.add(@leche)
                        @menu6 = Menu.new()	#656 kcal
                        @menu6.add(@chorizo)
                        @menu6.add(@donut)
			@menu7 = Menu.new()	#1539.6 kcal
                        @menu7.add(@tomate)
                        @menu7.add(@arroz)
			@menu8 = Menu.new()	#1067.8 kcal
                        @menu8.add(@queso)
                        @menu8.add(@pan)
                        @menu9 = Menu.new()	#1539 kcal
                        @menu9.add(@tomate)
                        @menu9.add(@leche)
                        @menu10 = Menu.new()	#1303 kcal
                        @menu10.add(@pan)
                        @menu10.add(@arroz)

			@menus = []
                        @menus << @menu1
                        @menus << @menu2
                        @menus << @menu3
                        @menus << @menu4
                        @menus << @menu5
                        @menus << @menu6
                        @menus << @menu7
                        @menus << @menu8
                        @menus << @menu9
                        @menus << @menu10
  

			@paciente1 = Paciente.new("Pepe", 50, 1.80, 30, 1, [0.70, 0.71], [0.80, 0.75], 0.27) #Bajo peso
                        @paciente2 = Paciente.new("Patricia", 80, 1.70, 19, 0, [0.70, 0.71], [0.80, 0.75], 0.12) #Sobrepeso
                        @paciente3 = Paciente.new("Manuel", 63, 1.80, 60, 1, [0.70, 0.71], [0.80, 0.75], 0.54) #Adecuado
                        @paciente4 = Paciente.new("Jose", 100, 1.63, 16, 1, [0.70, 0.71], [0.80, 0.75], 0.0) #Obesidad grado 2
                        @paciente5 = Paciente.new("Teresa", 60, 1.40, 44, 0, [0.70, 0.71], [0.80, 0.75], 0.0) #Obesidad grado 1
		        @paciente6 = @paciente1
		        @paciente7 = @paciente2
			@paciente8 = @paciente3
			@paciente9 = @paciente4
			@paciente10 = @paciente5


			@lista = Lista.new()

                        @lista.insert(@paciente1)
                        @lista.insert(@paciente2)
                        @lista.insert(@paciente3)
                        @lista.insert(@paciente4)
                        @lista.insert(@paciente5)
                        @lista.insert(@paciente6)
                        @lista.insert(@paciente7)
                        @lista.insert(@paciente8)
                        @lista.insert(@paciente9)
                        @lista.insert(@paciente10)

		end

		it "Ordenar el array de menus (for)" do
			utils = Utils.new
			#6, 2, 4, 3, 8, 5, 1, 10, 9, 7
			puts Benchmark.measure {
				expect(utils.sort_for(@menus)).to eq([@menu6, @menu2, @menu4, @menu3, @menu8, @menu5, @menu1, @menu10, @menu9, @menu7])
			}	
		end

		it "Ordenar la lista de valoraciones (for)" do
			utils = Utils.new
			#5, 10, 2, 7, 1, 6, 4, 9, 3, 8
			puts Benchmark.measure {
				expect(utils.sort_for(@lista)).to eq([@paciente5, @paciente10, @paciente2, @paciente7, @paciente1, @paciente6, @paciente4, @paciente9, @paciente3, @paciente8])
			}
		end
		
		it "Ordenar el array de menus (each)" do
                        utils = Utils.new
                        #6, 2, 4, 3, 8, 5, 1, 10, 9, 7
                        puts Benchmark.measure {
				expect(utils.sort_each(@menus)).to eq([@menu6, @menu2, @menu4, @menu3, @menu8, @menu5, @menu1, @menu10, @menu9, @menu7])
                	}
		end

                it "Ordenar la lista de valoraciones (each)" do
                        utils = Utils.new
                        #5, 10, 2, 7, 1, 6, 4, 9, 3, 8
                        puts Benchmark.measure {
				expect(utils.sort_each(@lista)).to eq([@paciente5, @paciente10, @paciente2, @paciente7, @paciente1, @paciente6, @paciente4, @paciente9, @paciente3, @paciente8])
			}
		end
		
		it "Ordenar el array de menus (sort)" do
                        #6, 2, 4, 3, 8, 5, 1, 10, 9, 7
			puts Benchmark.measure {
				expect(@menus.sort).to eq([@menu6, @menu2, @menu4, @menu3, @menu8, @menu5, @menu1, @menu10, @menu9, @menu7])
			}
		end

                it "Ordenar la lista de valoraciones (sort)" do
                        #5, 10, 2, 7, 1, 6, 4, 9, 3, 8
			puts Benchmark.measure {
				expect(@lista.sort).to eq([@paciente5, @paciente10, @paciente2, @paciente7, @paciente1, @paciente6, @paciente4, @paciente9, @paciente3, @paciente8])
                	}
		end
	 end
end
