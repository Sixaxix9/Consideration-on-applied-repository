clear all;

syms x runo cuno rdue cdue rtre rquattro n m

r1 = 39000;
r2 = 10000;
r3 = 12000;
r4 = 27000;
c1 = 680*10^(-12);
c2 = 22*10^(-9);

freq = 100;

percentage_value_resistor = 1/100;
percentage_value_capacitor = 10/100;

druno = percentage_value_resistor*r1;
drdue = percentage_value_resistor*r2;
drtre = percentage_value_resistor*r3;
drquattro = percentage_value_resistor*r4;

dcuno = percentage_value_capacitor*c1;
dcdue = percentage_value_capacitor*c2;

f = (1/(sqrt((-x^2*n*m*runo^2*cuno^2+1)^2+(x*runo*cuno*(m+1))^2)))*(1/(sqrt(x^2*rdue^2*cdue^2+1)))*(1+rtre/rquattro);

delta = druno*abs(diff(f,runo)) +  drdue*abs(diff(f,rdue)) +  drtre*abs(diff(f,rtre)) + ...
    drquattro*abs(diff(f,rquattro)) + dcuno*abs(diff(f,cuno)) +  dcdue*abs(diff(f,cdue));

k = subs(f,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq});
u = subs(delta,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq});

double(k)
double(u)

double(u)/double(k)*100

assex = linspace(100, 10000, 100);

for r = 100:100:10000
    freq = r;
    k = subs(f,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq});
    u = subs(delta,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq});
    assey(r/100 , 1) = double(u)/double(k)*100
end
    
    plot(assex, assey);
    
