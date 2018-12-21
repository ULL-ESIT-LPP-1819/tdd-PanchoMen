class  Utils
	def initialize
	end 

	def sort_for(array)
		#puts("Sin ordenar: ")
                #array.map{|x| puts(x.to_s)}
		ordenado = array.map{|x| x}
		for i in 0...(ordenado.size - 1) do
			aux = ordenado[i]
		 	p = i
	
			for j in (i + 1)...(ordenado.size) do
				if ordenado[j] < aux
					aux = ordenado[j]
					p = j
				end
		 	end

			ordenado[p] = ordenado[i]
			ordenado[i] = aux
		end
		#puts("Ordenado: ")
                #ordenado.map{|x| puts(x.to_s)}
		return ordenado
	end

	def sort_each(array)
		ordenado = array.map{|x| x}
		ordenado.each_index{|i| ordenado.each_index{|j| ordenado[i],ordenado[j] = ordenado[j],ordenado[i] if ordenado[i] < ordenado[j]}}
	end
end 
