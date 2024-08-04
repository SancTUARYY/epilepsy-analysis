% The 'SOP_analysis' script is used for seizure onset pattern analysis
close all

% The multi-site LFP signal should be imported and stored in the 'data' variable
channel = 5;                    % Channel selection
start_time = 2.94;          % Start time of the signal for analysis
duration = 12;                % Duration of the signal for analysis
high_fre = 200;               % Upper limit frequency of the spectrum analyzed
lfp = data(channel, start_time*100000: start_time*100000+duration*1000-1);
lfp2 = data(channel, start_time*100000: start_time*100000+duration*1000+260);

Nw = 512;                                       % Window length
window = hamming(512);          % Hamming window
noverlap = 500;                             % Overlap length
nfft = 2^nextpow2(length(window));
fs = 1000;                                        % Sampling frequency
t=1/fs:1/fs:duration;

% Plot the original signal
figure('Color', 'w', 'Position', [500,200,600,400])
subplot(211)
plot(t, lfp);
title('Low-voltage fast activity', 'FontSize',14,'FontName','Arial')
% Low-voltage fast activity
% Low-frequency high-amplitude
% Burst of polyspikes
% Rhythmic spikes
% Theta/alpha sharp activity
% Beta/gamma sharp activity
ylabel('Amplitude/μV', 'FontSize',14,'FontName','Arial')
set(gca,'FontName','Arial','FontSize',12)

% Plot the time spectrum
subplot(212)
[S, F, T, P] = spectrogram(lfp2, window, noverlap, nfft, fs);
index = interp1(F, 1:length(F), high_fre, 'nearest');
imagesc(T,F(1:index),10*log10(P(1:index,:)), [10 40]);
set(gca, 'YDir', 'normal');
colormap('jet');
xlabel('Time/s', 'FontSize',14,'FontName','Arial')
ylabel('Frequency/Hz', 'FontSize',14,'FontName','Arial')
set(gca,'FontName','Arial','FontSize',12)
h=colorbar;
h.Label.String = 'Power/Frequency(dB/Hz)';