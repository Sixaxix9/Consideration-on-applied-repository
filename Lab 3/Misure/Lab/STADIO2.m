close all


data = [0.2,1024,0
	0.3,1056,20
	0.5,1120,20
	0.6,1184,40
	0.7,1248,50
	0.8,1328,60
	0.9,1440,60
	1.0,1568,70
	1.1,1712,80
	1.2,1888,90
	1.3,2080,116
	1.4,2200,136
	1.5,2120,150
	1.7,1728,190
	2.0,1072,180
	2.2,800,180
	2.5,560,160
	2.7,448,150
	3.0,344,150
	3.2,296,150
	3.5,232,130
	5,108,92
	7,56,64];
	%10,28,44

    Vin  = 1000
    
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

errorplus = ones(dim(1),1);
errorminus = ones(dim(1),1);

for i=1:1:dim
    if i<5
    errorplus(i) = 20*log10((data(i,2)+ 0.2*200)/Vin) - mod(i);
    errorminus(i) =mod(i) - 20*log10((data(i,2) - 0.2*200)/Vin);
    end
    if i>4
        if i<15
        errorplus(i) = 20*log10((data(i,2)+ 0.2*500)/Vin) - mod(i);
        errorminus(i) =mod(i) - 20*log10((data(i,2) - 0.2*500)/Vin);
        end
    end
    if i>14
        if i<20
        errorplus(i) = -20*log10((data(i,2)+ 0.2*200)/Vin) + mod(i);
        errorminus(i) =-mod(i) + 20*log10((data(i,2) - 0.2*200)/Vin);
        end
    end
    if i>19
        if i<21
        errorplus(i) = -20*log10((data(i,2)+ 0.2*100)/Vin) + mod(i);
        errorminus(i) =-mod(i) + 20*log10((data(i,2) - 0.2*100)/Vin);
        end
    end
    if i>20
        errorplus(i) = -20*log10((data(i,2)+ 0.2*50)/Vin) + mod(i);
        errorminus(i) =-mod(i) + 20*log10((data(i,2) - 0.2*50)/Vin);
    end
        
end

error1 = ones(dim(1),1)*14;

figure(3);

ax = axes();
ln1 = errorbar(freq, mod, errorminus*10, errorplus*10);
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
