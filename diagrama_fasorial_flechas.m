## Distribuible y modificable con cita: vbustamante@fi.uba.ar
## Author: vero <vero@vero-pc>
## First Created: 2019-05-08


%PRE: Recibe una matriz de numeros complejos.
%POS: DEVUELVE UNA MATRIZ CON LA PARTE REAL E IMAG DE ESOS NUMEROS, 
 %IMPRIME POR PANTALLA EL DIAGRAMA FASORIAL DE LOS NUMEROS COMPLEJOS PASADOS.
%NOTA: NO CIERRA GRAFICOS ANTERIORES! CUIDADO CON ESTO SI NO SE QUIERE USAR.
function fasores = diagrama_fasorial_flechas (B,close_graphics=0,same=0,color_flecha="b",coord_ok=1)


  if (close_graphics==1)
    close all
  endif
  
  A=redondear_a_3_decimales(B)
  %VARIABLES NECESARIAS PARA EL DIBUJO DE LAS FLECHAS
  
  fasores=[real(A) imag(A)] %creo una matriz con las partes real e imaginaria  
  L=abs(min(A))/10; %numero para que no se me vuelvan flechas muy grandes para el dibujo
  R=abs(min(A))/10; %idem
  inicio_flechas= zeros (size(fasores));
  fin_flechas= fasores;

  %COORDENADAS DE LOS FASORES
  corrimiento_real=  sign(real(A))*R;
  corrimiento_imaginario= sign(imag(A))*R;
  desfasaje_eje_real= real(A)+corrimiento_real;
  desfasaje_eje_imag= imag(A)+corrimiento_imaginario;
  
  coordenadas=num2str(A);

  %GRAFICO
  if (same==1)
    h = gcf ()
  else
    h=figure();
    grid on;
  endif
  
  %POSICION EJES
  eje_x=[min(desfasaje_eje_real)-2*R    max(desfasaje_eje_real)+2*R]
  eje_y=[min(desfasaje_eje_imag)-2*R    max(desfasaje_eje_imag)+2*R]
  %axis(eje_x,eje_y);
  
  %figure(h, 'position',[posicion_pantalla,tamanio_imagen]);
  title("Diagrama fasorial");
  xlabel("Re(z)");
  ylabel("Im(z)"); 
  p=drawArrow ([inicio_flechas fin_flechas],1,L,R,0.5); %ver doc de drawArrow
  set (p.body, "color",color_flecha)
  set (p.head, "facecolor", color_flecha)
  set (p.head, "edgecolor", color_flecha)
  axis([eje_x eje_y]);
  g=get (gcf, "currentaxes");
  set(g,"fontweight","bold","linewidth",2)
  
  %CONFIGURACION PANTALLA E IMAGEN
  posicion_pantalla= [0 0]
  tamanio_imagen=[900 400]
  
  figure(h, 'position',[posicion_pantalla tamanio_imagen]);

  if (coord_ok==1)  
    text (desfasaje_eje_real,desfasaje_eje_imag, coordenadas,"horizontalalignment","left"); 
  endif

  W = 4; H = 3;
  set(h,'PaperUnits','inches')
  set(h,'PaperOrientation','portrait');
  set(h,'PaperSize',[H,W])
  set(h,'PaperPosition',[0,0,W,H])
  
##  FN = findall(h,'-property','FontName');
##  set(FN,'FontName','DejavuSerif');
  FS = findall(h,'-property','FontSize');
  set(FS,'FontSize',14);
##  
endfunction
