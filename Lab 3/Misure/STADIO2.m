close all

Vin = 500;

data = [0.2,512,0
	0.3,528,20
	0.5,560,20
	0.6,592,40
	0.7,624,50
	0.8,664,60
	0.9,720,60
	1.0,784,70
	1.1,856,80
	1.2,944,90
	1.3,1040,116
	1.4,1100,136
	1.5,1060,150
	1.7,864,190
	2.0,536,180
	2.2,400,180
	2.5,280,160
	2.7,224,150
	3.0,172,150
	3.2,148,150
	3.5,116,130
	5,54,92
	7,28,64
	10,14,44];

dim = size(data);
freq = zeros(dim(1),1);
mod = zeros(dim(1),1);
phase = zeros(dim(1),1);
for i=1:1:dim
    freq(i)=data(i, 1);
    mod(i)=20*log10(data(i, 2)/Vin);
    phase(i)=-(data(i, 3).*10^-3).*freq(i).*360;
end

disp(mod);
disp(phase);

error = ones(dim(1),1)*0.2;
error1 = ones(dim(1),1)*0.01;

figure(3);

ax = axes();
ln1 = errorbar(freq, mod, error);
set(ax, 'XScale', 'log');

%ln1 = semilogx(freq,mod);
ln1.LineWidth = 1.5;
ln1.Marker = 'o';
title('Magnitude bode plot')
xlabel('Frequency [kHz]') 
ylabel('Magniture [dB]') 
y = mod(2)-3;
%line([10,1000],[y,y],'color', 'red')
%line([freq(10),freq(10)],[5,y],'color', 'red')

figure(4)
%ln2 = semilogx(freq,phase);

ax1 = axes();
ln2 = errorbar(freq, phase, error1);
set(ax1, 'XScale', 'log');

ln2.LineWidth = 1.5;
ln2.Marker = 'o';
title('Phase bode plot')
xlabel('Frequency [kHz]') 
ylabel('Phase [degrees]')
%line([freq(10),freq(10)],[-300,phase(10)],'color', 'red')
%line([10,freq(10)],[phase(10),phase(10)],'color', 'red')