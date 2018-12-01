close all
clear all

data = 	[
	0.1,1440,200
	0.2,1392,200
	0.5,1168 ,180 
	0.6,1104,180
	0.7,1040,160
	0.720,1008,160
	0.750,1008,160
    0.8,976,150
    0.9,912,140
    1,848,130
    1.5,640,110
	2,512,110
	5,224,50
	7,160,37
	10,112,28
	];
vin = 1000;
dim = size(data);
freq = zeros(dim(1),1);
mod = zeros(dim(1),1);
phase = zeros(dim(1),1);
for i=1:1:dim
    freq(i)=data(i, 1);
    mod(i)=20*log10(data(i, 2)/vin);
    phase(i)=-(data(i, 3).*10^-3).*freq(i).*360;
end

disp(mod);
disp(phase);

errorplus = ones(dim(1),1);
errorminus = ones(dim(1),1);

for i=1:1:dim
    if i<10
    errorplus(i) = 20*log10((data(i,2)+ 0.2*200)/vin) - mod(i);
    errorminus(i) =mod(i) - 20*log10((data(i,2) - 0.2*200)/vin);
    end
    if i>9
        if i<14
        errorplus(i) = 20*log10((data(i,2)+ 0.2*100)/vin) - mod(i);
        errorminus(i) =mod(i) - 20*log10((data(i,2) - 0.2*100)/vin);
        end
    end
    if i>13
        if i<16
        errorplus(i) = -20*log10((data(i,2)+ 0.2*50)/vin) + mod(i);
        errorminus(i) =-mod(i) + 20*log10((data(i,2) - 0.2*50)/vin);
        end
    end
    if i>15
        errorplus(i) = -20*log10((data(i,2)+ 0.2*50)/vin) + mod(i);
        errorminus(i) =-mod(i) + 20*log10((data(i,2) - 0.2*50)/vin);
    end
end

error1 = ones(dim(1),1)*10;

figure(3);

ax = axes();
ln1 = errorbar(freq, mod, errorminus*4, errorplus*4);
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
