close all





Vin = 500;

data = [0.1,728,200
	0.2,704,260
	0.3,672,240
	0.4,648,290
	0.7,632,260
	0.8,600,216
	0.9,636,228
    1,636,268
	1.1,656,228 
	1.2,672,242
	1.3,688,254
	1.4,704,260
	1.5,656,268
	1.6,576,284
	1.7,480,288
	1.8,392,264
	1.9,320,240
	2.0,264,220
	2.1,186,184
	2.3,152,172
	2.4,128,164
	2.5,112,152
	2.6,104,142
	2.7,84,132
	2.8,76,126
	2.9,68,120
	3.0,60,116
%	5,24,-60
% 	7,6.4,-50
	];

dim = size(data);
freq = zeros(dim(1),1);
mod = zeros(dim(1),1);
phase = zeros(dim(1),1);
for i=1:1:dim
    freq(i)=data(i, 1);
    mod(i)=20*log10(data(i, 2)/Vin);
    phase(i)=-(data(i, 3).*10^-3).*freq(i).*360;
    if freq(i)>1.8
       phase(i)=-360-phase(i); 
    end
end

%disp(mod);
%disp(phase);

%------------------------------------------------------
syms x runo cuno rdue cdue rtre rquattro n m

r1 = 39000;
r2 = 10000;
r3 = 12000;
r4 = 27000;
c1 = 680*10^(-12);
c2 = 22*10^(-9);

percentage_value_resistor = 1/100;
percentage_value_capacitor = 10/100;

druno = percentage_value_resistor*r1;
drdue = percentage_value_resistor*r2;
drtre = percentage_value_resistor*r3;
drquattro = percentage_value_resistor*r4;

dcuno = percentage_value_capacitor*c1;
dcdue = percentage_value_capacitor*c2;

f = (1/(sqrt((-x^2*n*m*runo^2*cuno^2+1)^2+(x*runo*cuno*(m+1))^2)))*(1/(sqrt(x^2*rdue^2*cdue^2+1)))*(1+rtre/rquattro);

deltasqrt = sqrt((druno*abs(diff(f,runo)))^2 +  (drdue*abs(diff(f,rdue)))^2 +  (drtre*abs(diff(f,rtre)))^2 + ...
    (drquattro*abs(diff(f,rquattro)))^2 + (dcuno*abs(diff(f,cuno)))^2 +  (dcdue*abs(diff(f,cdue)))^2);

delta = druno*abs(diff(f,runo)) +  drdue*abs(diff(f,rdue)) +  drtre*abs(diff(f,rtre)) + ...
    drquattro*abs(diff(f,rquattro)) + dcuno*abs(diff(f,cuno)) +  dcdue*abs(diff(f,cdue));

%k = subs(f,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq});
%u = subs(delta,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq});

%double(k)
%double(u)

%double(u)/double(k)*100

for r = 1:1:dim(1)
    k = subs(f,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq(r)});
    u = subs(delta,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq(r)});
    v = subs(deltasqrt,{runo,cuno,rdue,cdue,rtre,rquattro,n,m, x},{r1,c1,r2,c2,r3,r4,17,1, freq(r)});

    asseymax(r, 1) = double(u)/double(k)*mod(r);
    asseymin(r, 1) = double(u)/double(k)*mod(r);

    assezmax(r, 1) = double(v)/double(k)*mod(r);
    assezmin(r, 1) = double(v)/double(k)*mod(r);

end


%----------------------------------------------------------------



error1 = ones(dim(1),1)*14;

figure(3);

ax = axes();
ln1 = errorbar(freq, mod, asseymin*100, asseymax*50);
set(ax, 'XScale', 'log');

%ln1 = semilogx(freq,mod);
ln1.LineWidth = 1;
ln1.Marker = 'o';
ln1.MarkerSize=4;
title('Magnitude bode plot')
xlabel('Frequency [kHz]') 
ylabel('Magniture [dB]') 
y = mod(2)-3;
figure(4)
%ln2 = semilogx(freq,phase);

ax1 = axes();
ln2 = errorbar(freq, phase, error1);
set(ax1, 'XScale', 'log');

ln2.LineWidth = 1;
ln2.Marker = 'o';
ln2.MarkerSize=3;
title('Phase bode plot')
xlabel('Frequency [kHz]') 
ylabel('Phase [degrees]')