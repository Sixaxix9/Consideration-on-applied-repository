data = 	[	1, 920, 0
	5, 915, 0
	10, 903, 2
	20, 862, 2.0
	50, 686, 3.1
	52, 670, 3.3
	54, 655, 3.4
	56, 642, 3.45
	58, 628, 3.47
	60, 615, 3.55
];

vin = 40;

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

figure(3);
ln1 = semilogx(freq,mod);
ln1.LineWidth = 1.5;
ln1.Marker = 'o';
title('Magnitude bode plot')
xlabel('Frequency [kHz]') 
ylabel('Magniture [dB]') 
y = mod(2)-3;
line([freq(1),freq(dim(1))],[y,y],'color', 'red')
line([freq(8),freq(8)],[23.5,y],'color', 'red')

figure(4)
ln2 = semilogx(freq,phase);
ln2.LineWidth = 1.5;
ln2.Marker = 'o';
title('Phase bode plot')
xlabel('Frequency [kHz]') 
ylabel('Phase [degrees]')
line([freq(8),freq(8)],[-80,phase(8)],'color', 'red')
line([1,freq(8)],[phase(8),phase(8)],'color', 'red')
