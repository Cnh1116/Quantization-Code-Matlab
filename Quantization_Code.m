%--------------------------------------------------------------------------
%Quantization of a analog signal
%Carson Holland, Developed for DSP Class
%September 2022
%Parameters----------------------------------------------------------------
Fs = 4000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 8000;             % Length of signal
t = (0:L-1)*T;    % Time vector 

%Signal--------------------------------------------------------------------
signal = 0.5*sin(2*pi*100*t);

%Plotting the Original Signal----------------------------------------------
figure(1)
plot(1000*t(1:150),signal(1:150))
title('Analog Signal (t)')
xlabel('t (ms)')
ylabel('S(t)')

%Quantization Paramters
nbits = 7;
qLevels = 2^nbits; 
signalMin = -5;  
signalMax = 5;  
scalingFactor = (signalMax-signalMin)/qLevels;
scaled_signal = ((signalMax-signalMin)/2)*signal;

%Quantizing the signal and plotting it-------------------------------------
quantized_signal = quant(scaled_signal,scalingFactor);

figure(2)
stem(1000*t(1:150),quantized_signal(1:150))
title('Quantized Signal(t)')
xlabel('t (ms)')
ylabel('Q(t)')

%Plotting the Sampled Signal-----------------------------------------------
figure(3)
stem(1000*times(1:150),signal(1:150))
title('Sampled 4000Hz Signal[n] ')
xlabel('N Samples')
ylabel('Signal[n]')


