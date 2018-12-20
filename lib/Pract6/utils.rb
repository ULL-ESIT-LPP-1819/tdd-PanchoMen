class  Utils
	def initialize
	end 

	def sort(array)
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
end
