% The 'interictal_spike' script is used for interictal spike detection
close all

% The multi-site LFP signal should be imported and stored in the 'data' variable
fs = 1000;                          % Sampling frequency
channel = 4;                     % Channel selection
duration = 60;                  % Duration of the signal for analysis

t = 0:1/fs:60-1/fs;
lfp = data(channel,100*fs : 160*fs-1);
lfp_ = -lfp;
baseline = mean(lfp);
SD = std(lfp);

peak_amp = baseline+5*SD;       % Threshold Definition
peak_width = 100;
[pks_h, locs_h, w_h, p_h] = findpeaks(lfp, fs, 'MinPeakDistance', 0.2, 'MinPeakHeight', peak_amp);
[pks_l, locs_l, w_l, p_l] = findpeaks(lfp_, fs, 'MinPeakDistance', 0.2, 'MinPeakHeight', peak_amp);
index = find(w_h < 0.1);
pks_h = pks_h(index); locs_h = locs_h(index);
index = find(w_l < 0.1);
pks_l = pks_l(index); locs_l = locs_l(index);
%Plot the LFP signal and the peaks found
figure('Color', 'w', 'Position', [500,200,650,350])
plot(t,lfp);
hold on
plot(locs_h, pks_h, '*')
hold on
plot(locs_l, -pks_l, '*')
%Plot the positive and negative thresholds
x = 0:1:duration;
y1 = zeros(1,duration+1)+peak_amp;
y2 = zeros(1,duration+1)-peak_amp;
plot(x, y1, '--', Color="r")
hold on
plot(x, y2, '--', Color="r")

title('Interictal spike detection in late stage', 'FontSize',14,'FontName','Arial')
xlabel('Time/s', 'FontSize',14,'FontName','Arial')
ylabel('Amplitude/μV', 'FontSize',14,'FontName','Arial')
ylim([-2500,2500])
set(gca,'FontName','Arial','FontSize',12)