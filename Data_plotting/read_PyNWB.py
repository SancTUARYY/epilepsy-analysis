" The 'draw_channels' script is used for plotting channel signals "

import matplotlib.pyplot as plt
import numpy as np
from pynwb import NWBHDF5IO

# Read NWB file
filepath = "sub-RatB6_ses-20230519-ictal6_ecephys.nwb"
# Open the file in read mode "r",
io = NWBHDF5IO(filepath, mode="r")
nwb = io.read()

# Load selected fragment
LFP_data = np.asarray(nwb.acquisition["B6_2023_5_19-ictal5"].data)
i = 0
while i < 12:
    plt.plot(range(len(LFP_data[:, i])), LFP_data[:, i] - 10000*i, linewidth=0.5)
    i += 1
plt.show()
