close all

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
    mod(i)=20*log10(data(i, 2)/100);
    phase(i)=-(data(i, 3).*10^-3).*freq(i).*360;
    if freq(i)>1.8
       phase(i)=-360-phase(i); 
    end
end

disp(mod);
disp(phase);

error = ones(dim(1),1)*0.5;
error1 = ones(dim(1),1)*14;

figure(3);

ax = axes();
ln1 = errorbar(freq, mod, I,S);
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