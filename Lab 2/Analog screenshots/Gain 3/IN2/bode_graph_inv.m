data = 	[10, 308, 0.6
	20, 309, 0.6
	50, 310, 0.6

	100, 311, 0.7

	200, 320, 0.85	

	500, 304, 0.98

	600, 240, 1.11
	610, 220, 1.13
	620, 210, 1.15
	630, 202, 1.17
	640, 195, 1.19
	650, 180, 1.20
	660, 173, 1.21];

dim = size(data);
freq = zeros(dim(1),1);
mod = zeros(dim(1),1);
phase = zeros(dim(1),1);
for i=1:1:dim
    freq(i)=data(i, 1);
    mod(i)=20*log10(data(i, 2)/100);
    phase(i)=180-(data(i, 3).*10^-3).*freq(i).*360;
end

disp(mod);
disp(phase);

figure(1);
ln1 = semilogx(freq,mod);
ln1.LineWidth = 1.5;
ln1.Marker = 'o';
title('Magnitude bode plot')
xlabel('Frequency[kHz]') 
ylabel('Magniture [dB]') 
y = mod(2)-3;
line([10,1000],[y,y],'color', 'red')
line([freq(8),freq(8)],[4,y],'color', 'red')

figure(2)
ln2 = semilogx(freq,phase);
ln2.LineWidth = 1.5;
ln2.Marker = 'o';
title('Phase bode plot')
xlabel('Frequency [kHz]') 
ylabel('Phase [degrees]')
line([freq(8),freq(8)],[-150,phase(8)],'color', 'red')
line([10,freq(8)],[phase(8),phase(8)],'color', 'red')

