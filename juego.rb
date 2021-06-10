require 'matrix' 


puts "Bienvenido al juego de la vida"
puts "Ingrese las medidas de la cuadricula: "

puts "Columnas:"
x = gets.chomp.to_i

puts "filas:"
y = gets.chomp.to_i

cuadricula = Matrix.build(y,x){rand.to_i}
c_n = Matrix.build(y,x){rand.to_i}


puts "Ingrese '*' o '.' para los espacios disponibles: de la cuadricula: "

for i in 0..(x-1) do
    for j in 0..(y-1) do
        if i==0  || i == (x-1)
            cuadricula[j,i] = '.'
            c_n[j,i] = 0
        elsif j==0 || j==(y-1)
            cuadricula[j,i] = '.'
            c_n[j,i] = 0
        else
            puts "(#{i},#{y})"
            v = gets.chomp.to_s
            cuadricula[j,i]=v
            if v =='*'
                c_n[j,i]=1
            else
                c_n[j,i]=0
            end
        end 
    end
end
puts "Generation 1:"
puts "#{x} #{y}\n"

for i in 0..(x-1) do
    for j in 0..(y-1) do
        print cuadricula[i,j]
    end
    puts "\n"
end

for i in 0..(x-1) do
    for j in 0..(y-1) do
        #esquina inicial
        if i==0 && j==0
            no_Vecinos = c_n[j,(i+1)] + c_n[(j+1),i] + c_n[(j+1),(i+1)]
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif  c_n[j,i]==1 
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3
                cuadricula[j,i]='*'
            end
        #borde superior
        elsif i!=0 && j==0 && i!=(x-1)
            no_Vecinos=(c_n[j,(i-1)] + c_n[(j+1),(i-1)] + c_n[(j+1),i] + c_n[(j+1),(i+1)] + c_n[j,(i+1)]) 
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1 && no_Vecinos >3 
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3 
                cuadricula[j,i]='*'
            end
        #esquina superior derecha
        elsif i==(x-1) && j==0
            no_Vecinos = c_n[j,(i-1)] + c_n[(j+1),i] + c_n[(j+1),(i-1)]
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif  c_n[j,i]==1 
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3
                cuadricula[j,i]='*'
            end
        #borde izquierdo
        elsif i==0 && j!=0 && j!=(y-1) 
            no_Vecinos = c_n[(j-1),i] + c_n[(j-1),(i+1)] + c_n[j,(i+1)] + c_n[(j+1),(i+1)] + c_n[(j+1),i]
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1 && no_Vecinos >3 
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3 
                cuadricula[j,i]='*'
            end
        #borde derecho
        elsif j!=0 && i!=0 && i==(x-1) && j!=(y-1)
            no_Vecinos = c_n[(j-1),(i-1)] + c_n[(j-1),i] + c_n[j,(i-1)] + c_n[(j+1),(i-1)] + c_n[(j+1),i]   
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1 && no_Vecinos >3 
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3 
                cuadricula[j,i]='*'
            end
        #centro
        elsif i!=0 && j!=0 && i!=(x-1) && j!=(y-1)
            no_Vecinos = c_n[(j-1),i] + c_n[(j-1),(i+1)] + c_n[j,(i+1)] + c_n[(j+1),(i+1)] + c_n[(j+1),i] + c_n[(j+1),(i-1)] + c_n[j,(i-1)] + c_n[(j-1),(i-1)]
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif c_n[j,i] == 1 && no_Vecinos > 3 
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1 && (no_Vecinos == 2 || no_Vecinos ==3) 
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3 
                cuadricula[j,i]='*'
            end
        #esquina inferior izquierda
        elsif i==0 && j==(y-1)
            no_Vecinos = c_n[j,(i+1)] + c_n[(j-1),i] + c_n[(j-1),(i+1)]
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif  c_n[j,i]==1 
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3
                cuadricula[j,i]='*'
            end
        #esquina inferior derecha
        elsif i==(x-1) && j==(y-1)
            no_Vecinos = c_n[j,(i-1)] + c_n[(j-1),i] + c_n[(j-1),(i-1)]
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif  c_n[j,i]==1 
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3
                cuadricula[j,i]='*'
            end
        #borde inferior 
        elsif i!=0 && j==(y-1) && i!=(x-1)
            no_Vecinos= c_n[(j-1),(i-1)] + c_n[(j-1),i] + c_n[j,(i-1)] + c_n[j,(i+1)] + c_n[(j-1),(i+1)]
            if c_n[j,i]==1 && no_Vecinos < 2
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1 && no_Vecinos >3 
                cuadricula[j,i]='.'
            elsif c_n[j,i]==1
                cuadricula[j,i]='*'
            elsif c_n[j,i]==0 && no_Vecinos == 3 
                cuadricula[j,i]='*'
            end
        end
    end
end


puts "Generation 2:"
puts "#{x} #{y}\n"

for i in 0..(x-1) do
    for j in 0..(y-1) do
        print cuadricula[i,j]
    end
    puts "\n"
end


