G=6.673*(10^-11); %Ley de gravitación Universal
hTL=3.84*(10^8); %Distancia Tierra-Luna metros
hTS=1.496*(10^11); %Distancia Tierra-Sol metros
hSL=1.50004588*(10^11); %Distancia Luna-Sol metros
mT=5.98*(10^24); %Masa de la Tierra
mL=7.36*(10^22); %Masa de la Luna
mS=1.989*(10^30); %Masa del Sol
rT=6.37*(10^6); %Radio de la Tierra
rS=6.96*(10^8); %Radio del Sol
rL=1.737*(10^6); %Radio de la Luna
dST=hTS+rS+rT; %Distancia del centro de la Tierra al sol;
dTL=hTL+rT+rL; %Distancia de la Tierra a la Luna;
dSL=dST+dTL; %Distancia del Sol a la Luna
t1=0; %Contador de segundos
tD1=3600; % Cada 3600 Segundos (Una Hora)
TOL=2.360580*(10^6); %Tiempo de ORBITA de Luna sobre tierra en segundos
TOT=3.1536000*(10^7); %Tiempo de ORBITA de tierra sobre sol en segundos
vTL=(2*pi*dTL)/TOL; %Velocidad Tangente de la Luna
vTT=(2*pi*dST)/TOT; %Velocidad Tangente de la Tierra
pT1=[0,0,dST]; %Punto donde se encuentra la Tierra
pL1=[0,0,dSL]; %Punto donde se encuentra la Luna
pS1=[0,0,0]; %Punto donde se encuentra la Tierra
drTL=pT1-pL1; %Vector desplazamiento Tierra-Luna
drST=pS1-pT1; %Vector desplazamiento Sol-Tierra
drSL=pS1-pL1; %Vector desplazamiento Sol-Luna
VTL=[vTL,0,0]; %Perpendicular dr, se usa vTL
VST=[vTT,0,0]; %Perpendicular dr, se usa vTT
pT11=[pT1]; %Inicio de Array, guarda posición Tierra
t11=[t1]; %Inicio de Array, guarda variable tiempo

xL1=[]; %Inicio de array, guarda posición x de la Luna
yL1=[]; %Inicio de array, guarda posición y de la Luna
zL1=[]; %Inicio de array, guarda posición z de la Luna
xT2=[]; %Inicio de array, guarda posición x de la Tierra
yT2=[]; %Inicio de array, guarda posición y de la Tierra
zT2=[]; %Inicio de array, guarda posición z de la Tierra
xS2=[]; %Inicio de array, guarda posición x del Sol
yS2=[]; %Inicio de array, guarda posición y del Sol
zS2=[]; %Inicio de array, guarda posición z del Sol
TVT=(365*24)+6; %Tiempo de Vuelta de la Tierra en horas

for n=0 : TVT %Inicio de for de 0 a Tiempo vueltas Tierra en horas
t1=t1+tD1; %Variable de tiempo aumentara cada 3600 segundos=1 hora
t11=[t11;t1]; %Guarda variable tiempo
pS2=[0,0,0]; %Punto donde se encuentra el Sol, no se mueve
dr1=pT1-pL1; %Vector desplazamiento Tierra-Luna
dr2=pS1-pT1; %Vector desplazamiento Sol-Tierra
dr3=pS1-pL1; %Vector desplazamiento Sol-Luna
vU1=dr1/(sqrt((dr1(1)^2)+(dr1(2)^2)+(dr1(3)^2))); %Vector Unitario Tierra-Luna
vU2=dr2/(sqrt((dr2(1)^2)+(dr2(2)^2)+(dr2(3)^2))); %Vector Unitario Sol-Tierra
vU3=dr3/(sqrt((dr3(1)^2)+(dr3(2)^2)+(dr3(3)^2))); %Vector Unitario Sol-Luna
F1=G*((mT*mL)/(dTL^2))*vU1; %Fuerza Tierra-Luna
F2=G*((mS*mT)/(dST^2))*vU2; %Fuerza Sol-Tierra
F3=G*((mS*mL)/(dSL^2))*vU3; %Fuerza Sol-Luna
F12=F1+F2; %Suma de la fuerza de la Tierra-Luna y Sol-Tierra, afecta a la Tierra
F22=F2+F3; %Suma de la fuerza de la Sol-Tierra y Sol-Luna, afecta al Sol
F32=F3+F1; %Suma de la fuerza de la Sol-Luna y Tierra-Luna, afecta a la Luna
mL1=mL+mT; %Suma se la masa de la Tierra y de la Luna, afecta a la Luna


A1=F32/mL1; %Aceleración Luna
A2=F12/mT; %Aceleración Tierra
VTL=VTL+(A1*tD1); %Nueva Velocidad Sol-Luna
VST=VST+(A2*tD1); %Nueva Velocidad Sol-Tierra
V12=VTL+VST;
pT1=pT1+(VST*tD1); %Nueva posición Tierra
pL1=pL1+(V12*tD1); %Nueva posición Luna
xL1=[xL1 pL1(1)]; %Guarda la variable x de la Luna en la variable array inicializada
yL1=[yL1 pL1(2)]; %Guarda la variable y de la Luna en la variable array inicializada
zL1=[zL1 pL1(3)]; %Guarda la variable z de la Luna en la variable array inicializada
xT2=[xT2 pT1(1)]; %Guarda la variable x de la Tierra en la variable array inicializada
yT2=[yT2 pT1(2)]; %Guarda la variable y de la Tierra en la variable array inicializada
zT2=[zT2 pT1(3)]; %Guarda la variable z de la Tierra en la variable array inicializada
xS2=[xS2 pS1(1)]; %Guarda la variable x del Sol en la variable array inicializada
yS2=[yS2 pS1(2)]; %Guarda la variable y del Sol en la variable array inicializada
zS2=[zS2 pS1(3)]; %Guarda la variable z del Sol en la variable array inicializada
dST=sqrt((pT1(1)^2)+(pT1(2)^2)+(pT1(3)^2)); %Distancia NUEVA del centro de la Tierra al sol;
dSL=sqrt((pL1(1)^2)+(pL1(2)^2)+(pL1(3)^2)); %Distancia NUEVA del centro de la Luna al sol;

end %Termina for
plot3(xS2,yS2,zS2,'Or',xT2,yT2,zT2,'-g',xL1,yL1,zL1,'.b'); %Grafica las posiciones del So-Tierra-Luna
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on; %Inserta Cuadricula