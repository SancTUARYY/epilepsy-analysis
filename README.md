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

















