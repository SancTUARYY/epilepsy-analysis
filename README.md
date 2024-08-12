# Source code for: Dataset of long-term multi-site LFP activity with spontaneous chronic seizures recorded in temporal lobe epilepsy rats

## Introduction

This repository contains the codes that relate to our paper 'Dataset of long-term multi-site LFP activity with spontaneous chronic seizures recorded in temporal lobe epilepsy rats'. [Neurodata Without Borders (NWB)](https://www.nwb.org/) format files in the dataset can be easily exported into MATLAB or Python by using the code in this repository. Moreover, we provided some MATLAB scripts as well, which are used for channel signals plotting, power spectrum calculation, seizure onset pattern analysis, interictal spike detection, etc.

Abstract of the paper:

> This work provided a long-term electrophysiological dataset of 10 pilocarpine-treated temporal lobe epilepsy (TLE) rats during the development of epilepsy. The dataset was constituted by multi-site local field potential (LFP) signal recorded from 12 sites in the circuit of Papez in TLE, including spontaneous seizures and interictal fragments in the chronic period. The LFP data were saved in MATLAB, stored as the Neurodata Without Borders (NWB) standard, and published on the DANDI Archive. The dataset can be used to evaluate the alterations of seizure onset zone (SOZ), seizure onset pattern (SOP), and functional network connectivity during the development of epilepsy. We have technically validated the dataset through histology and specific signal analysis. In addition, we provided MATLAB codes for basic analyses of this dataset, including power spectral analysis, SOP identification, and interictal spike detection. The dataset is available to reveal how electrophysiological and epileptic network properties of chronic TLE rats change from early to late stages, and help inform the design of adaptive neuromodulation for epilepsy.

## Installation - Code

The code in this repository can be downloaded by entering the following commands:

```
cd $target_directory
git clone https://github.com/SancTUARYY/epilepsy-analysis.git
```

## Installation - DANDI

All data in NWB files were released on the DANDI Archive ([Dandiset #1044](https://dandiarchive.org/dandiset/001044)), and the dataset can be obtained through the Dandi command line interface (CLI). Enter `pip install dandi` in Python Terminal to install the Dandi CLI,and enter `dandi download https://dandiarchive.org/dandiset/001044` to download the dataset.

## Installation - MatNWB/PyNWB

After downloading the data from the DANDI archive to the local computer, they can be exported by using PyNWB and MatNWB APIs. Instructions for [reading NWB files with PyNWB and MatNWB](https://nwb-overview.readthedocs.io/en/latest/file_read/file_read.html) were provided in NWB Overview documentation.

## Data Plotting

Here we provide the sample code for exporting data from NWB files through MatNWB and PyNWB APIs respectively. 

- **MatNWB:** Download MATLAB script `draw_channels.m`. First, set the parameter of the `nwbRead` function to the path of the NWB file, and all the ictal and interictal fragments in the NWB file can be listed by the `nwb.acquisition` command. Then enter the `start time` and the `duration` parameters, and set the parameter of the `nwb.acquisition.get` function to the chosen fragment. Run the script to get the channel signals.
- **PyNWB:** Download Python script `read_PyNWB.py`. First, set the parameter `filepath` as the path of the NWB file, and all the ictal and interictal fragments in the NWB file can be listed. Then set the parameter of the `nwb.acquisition` function to the chosen fragment. get the channel signals.

The following figure is an example for reading and plotting the data of a seizure fragment (raw LFP data, entire 10 min, all 12 channels) with MatNWB and PyNWB. In the plotted figure, the x-axis represents the number of time points, and the y-axis represents the signal amplitude of the shifted channels.

<div align="center">
  <img src="https://github.com/SancTUARYY/epilepsy-analysis/blob/main/Figures/Fig1.png">
</div>

## MATLAB Analysis

- **Power Spectrum Calculation:** First, the multi-site LFP signal should be exported and stored in the `data` variable. Second, initialize the variables. Set `chn_select` as the selected channel. Set `fre_high` as the upper limit frequency of the spectrum analyzed. Set `start_time` as the start time of the signal for analysis, and set `duration` as the duration of the signal for analysis. Third, Welch method will be used to calculate the PSD of the LFP signal (`pwelch` function, with 1.024 s Hamming window and 50% overlap by default). The parameters of `noverlap`, `nfft`, `window`, and `n_segments` can be adjusted according to the duration of the signal. Run the script to calculate the power spectrum of the LFP signal, and the PSD of the selected channel will be stored in the variable of `POWER`.

- **Seizure Onset Pattern Analysis:** First, the multi-site LFP signal should be exported and stored in the `data` variable. Second,  initialize the variables. Set `channel` as the selected channel. Set `high_fre` as the upper limit frequency. Set `start_time` as the start time of the signal for analysis, and set `duration` as the duration of the signal for analysis. Third, `spectrogram` function will be used to calculate the Time Spectrum of the LFP signal by using short-time Fourier transform. The parameters of `noverlap`, `nfft`, `window`, and `Nw` can be adjusted according to the duration of the signal. Run the script to plot the selected signal in the time domain and its corresponding Time Spectrum in colormap, which can be used for seizure onset pattern analysis.
- **Interictal Spike Detection:** First, the multi-site LFP signal should be exported and stored in the `data` variable. Second, initialize the variables. Set `channel` as the selected channel and set `duration` as the duration of the signal for analysis. Variable of `peak_amp` refers to the baseline threshold (baseline + 5*SD by default) to define the spike peaks, which can be modified if necessary. Run the script to plot the selected interictal signal in the time domain, the positive and negative thresholds in the dashed lines, and the spikes detected. 

## Contributors

- Haoqi Ni













