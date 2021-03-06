close all

data = 	

	[
	0.1,720,200
	0.2,696,200
	0.5,584 ,180 
	0.6,552,180
	0.7,520,160
	0.720,504,160
	0.750,504,160
    0.8,488,150
    0.9,456,140
    1,424,130
    1.5,320,110
	2,256,90
	5,112,40
	7,80,20
	10,56,10
	];

dim = size(data);
freq = zeros(dim(1),1);
mod = zeros(dim(1),1);
phase = zeros(dim(1),1);
for i=1:1:dim
    freq(i)=data(i, 1);
    mod(i)=20*log10(data(i, 2)/100);
    phase(i)=-(data(i, 3).*10^-6).*freq(i).*360;
end

disp(mod);
disp(phase);

error = ones(dim(1),1)*0.25;
error1 = ones(dim(1),1)*14;

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
line([10,1000],[y,y],'color', 'red')
line([freq(10),freq(10)],[5,y],'color', 'red')

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
line([freq(10),freq(10)],[-300,phase(10)],'color', 'red')
line([10,freq(10)],[phase(10),phase(10)],'color', 'red')