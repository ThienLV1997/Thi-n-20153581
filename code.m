>> % Bài t?p ?a Ph??ng Ti?n
% SV: Luy?n V?n Thi?n - 20153581

% T?o các n?t nh?c
%A:440.00 Hz  ;  B:    493.88 Hz;   C#:  554.37 Hz;   D:    587.33 Hz;   E:    659.26 Hz;  F#:  739.99 Hz
Amp = 0.25;
t = 0:0.000125:0.499875;
fs = 8000; %T?n s? l?y m?u 
a=Amp*sin(2*pi*440*t); 
b=Amp*sin(2*pi*493.88*t); 
c=Amp*sin(2*pi*554.37*t); 
d=Amp*sin(2*pi*587.33*t); 
e=Amp*sin(2*pi*659.26*t); 
f=Amp*sin(2*pi*739.99*t);

%T?o melody
melody=[a,d,e,c,b,b,f,e,a,c];

%??c tín hi?u audio trong file orig_input
audio=audioread('orig_input.wav');
audio=audio';
song= audio + melody;
sound(song,fs)
>> filename = 'melody.wav';
audiowrite(filename,song,fs),
>> N =length(song); %number of FFT point
transform = fft(audio,N)/N;
magTransform = abs(transform);
faxis = linspace(-N/2,N/2,N);
figure(1);
plot(faxis,fftshift(magTransform));
title('The Spectrum');
xlabel('Frequency (Hz)')
figure(2);
win = 128; % window length in samples
% number of samples between overlapping windows:
hop = win/2;          

nfft = win; % width of each frequency bin 
spectrogram(song,win,hop,nfft,fs,'yaxis')

% change the tick labels of the graph from scientific notation to floating point: 
yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt))
title('Spectrogram');
>>
