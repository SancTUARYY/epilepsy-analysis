% The 'powerspec' script is used for power spectrum calculation
close all

% The multi-site LFP signal should be imported and stored in the 'data' variable
fs = 1000;                          % Sampling frequency
channelnum = 12;           % Channel numbers in total
chn_select = 4;                 % Channel selection
fre_high = 100;                 % Upper limit frequency of the spectrum analyzed
duration = 5;                     % Duration of the signal for analysis
start_time = 3.3;               % Start time of the signal for analysis

lfp = data(:, start_time*100000 : start_time*100000+duration*fs-1);
L = length(lfp);
noverlap = 512;                         % Overlap length
nfft = 1024;                                % FFT length
window = hamming(nfft);      % Hamming window
n_segments = L/nfft;
% Spectrum calculation
p = zeros(channelnum, 513);
for i = 1:channelnum
    [p(i,:), f] = pwelch(lfp(i,:), window, noverlap, nfft, fs);
end

index = interp1(f, 1:length(f), fre_high, 'nearest');
Power = 10*log10(p(:, 1:index));
Power = Power';
% Plot the original signal
figure(1)
plot(data(chn_select,:))
% Plot the power spectrum
figure(2)
P = mean(p);
PP = 10*log10(p(chn_select,:));
POWER = PP(1:index)';
plot(f(1:index),POWER)