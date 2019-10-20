## Copyright (C) 2019 vero
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## Author: vero <vero@vero-pc>
## Created: 2019-05-08
%PRE: Recibe una matriz de numeros complejos
%POS: DEVUELVE UNA MATRIZ CON LA PARTE REAL E IMAG DE ESOS NUMEROS, 
 %IMPRIME POR PANTALLA EL DIAGRAMA FASORIAL DE LOS NUMEROS COMPLEJOS PASADOS.
function fasores = diagrama_fasorial (A)
  
  fasores=[real(A) imag(A)] %creo una matriz con las partes real e imaginaria
  for i=1:length(A)
    %plot ([xinicial xfinal],[yinicial yfinal])
    plot([0,fasores(i,1)],[0,fasores(i,2)]);
    hold on;
    plot(fasores(i,1),fasores(i,2),"r*"); %"punta" de flecha
  endfor
  
  grid minor; %grilla chiquita
  coordenadas=num2str(A); %quiero que las coordenadas sean strings para poder mostrarlas en pantalla (es lo que pide text)
  for i=1:length(fasores)
    radio=1.05; % esto me defasa un poquitin el texto, sino me lo escribe encima de la punta
    cartel= coordenadas(i,:) %le indico cual texto
    text (radio*fasores(i,1),radio*fasores(i,2), cartel,"horizontalalignment","center"); %escribe
  endfor

endfunction
