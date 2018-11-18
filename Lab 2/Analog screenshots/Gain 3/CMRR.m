data = [	1, 1.6
	10,2
	20,3.1
	50,7
	100,10
	200, 15];
dim = size(data);
freq = zeros(dim(1),1);
magn = zeros(dim(1),1);
Ad = 3;
ampl = 100; %mV
for i=1:size(data)
freq(i) = data(i,1);
magn(i) = 20*log10((Ad*ampl)/data(i,2));
    disp(i)
end

freq1 = [1:10:200];
magn1 = spline(freq, magn, freq1);
semilogx(freq, magn);
hold on;
%semilogx(freq1, magn1, 'color', 'red');
title('CMRR plot')
xlabel('Frequency [kHz]') 
ylabel('Magniture [dB]') 