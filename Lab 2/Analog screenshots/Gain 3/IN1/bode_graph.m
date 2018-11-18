data = 	[10, 308, 0.6
	20, 309, 0.6
	50, 310, 0.6

	100, 311, 0.65

	200, 336, 0.81	

	500, 330, 0.93

	600, 247, 1.11
	610, 237, 1.12
	620, 225, 1.14
	630, 218, 1.15
	640, 206, 1.16
	650, 196, 1.18
	660, 185, 1.19];

dim = size(data);
freq = zeros(dim(1),1);
mod = zeros(dim(1),1);
phase = zeros(dim(1),1);
for i=1:1:dim
    freq(i)=data(i, 1);
    mod(i)=20*log10(data(i, 2)/100);
    phase(i)=-(data(i, 3).*10^-3).*freq(i).*360;
end

disp(mod);
disp(phase);

figure(3);
ln1 = semilogx(freq,mod);
ln1.LineWidth = 1.5;
ln1.Marker = 'o';
title('Magnitude bode plot')
xlabel('Frequency [kHz]') 
ylabel('Magniture [dB]') 
y = mod(2)-3;
line([10,700],[y,y],'color', 'red')
line([freq(10),freq(10)],[5,y],'color', 'red')

figure(4)
ln2 = semilogx(freq,phase);
ln2.LineWidth = 1.5;
ln2.Marker = 'o';
title('Phase bode plot')
xlabel('Frequency [kHz]') 
ylabel('Phase [degrees]')
line([freq(10),freq(10)],[-300,phase(10)],'color', 'red')
line([10,freq(10)],[phase(10),phase(10)],'color', 'red')

