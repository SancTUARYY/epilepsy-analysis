% The 'draw_channels' script is used for plotting channel signals
close all
% Read NWB file
nwb = nwbRead('sub-RatC16_ses-20231030-ictal10_ecephys.nwb');
nwb.acquisition

% Load selected fragment
LFP_data = nwb.acquisition.get('C16_2023_10_30-ictal8').data.load();
% Plot waveform - 12 channels
for i = 1:12
    plot(LFP_data(i, :) - 5000*(i-1));
    hold on
end