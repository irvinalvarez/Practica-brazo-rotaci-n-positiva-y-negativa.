clear all
clc

prompt='Introduce valor (ángulo) de la primer articulación:';
angDeg=input(prompt);

prompt='introduce valor de L1:';
L1=input(prompt);

prompt='introduce valor de L2:';
L2=input(prompt);

angRad= deg2rad(angDeg)

p1=[0 0 0]'

if angDeg>=0
    
    angVec=0:0.01:angRad
else
    angVec=0:-0.01:angRad    
end    

for v=1:length(angVec)
    
    clf
        imprimir();
        
        Rz= [cos(angVec(v)) -sin(angVec(v)) 0 0 ;sin(angVec(v)) cos(angVec(v)) 0 0 ; 0 0 1 0; 0 0 0 1];
        Tx=[1 0 0 L1; 0 1 0 0; 0 0 1 0;0 0 0 1];
        
        T1=Rz*Tx;
        p2=T1(1:3,4);
        
        line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 0.5 0],'linewidth',5);
        
        TRz2=[cos(0) -sin(0) 0 0 ;sin(0) cos(0) 0 0 ; 0 0 1 0; 0 0 0 1];
        Tx2=[1 0 0 L2; 0 1 0 0; 0 0 1 0;0 0 0 1];
        T2=TRz2*Tx2
        Tf=T1*T2
        
        p3=Tf(1:3,4);
        line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.5 0.5 0.5],'linewidth',5);
        
        pause(0.01)
end