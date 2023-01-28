from scipy.fft import rfft, ifft, rfftfreq
import numpy as np

# function to perform Fourier transform of waveform data spaced out by time dt
def waveform_to_Fourier(waveform, dt):
	intensities = fft(waveform)
	amplitudes = np.abs(intensities)
	sum_amp = np.sum(amplitudes)
	norm_amplitudes = amplitudes/sum_amp
	
	frequencies = rfftfreq(len(waveform), dt)
	
	return (norm_amplitudes, frequencies)
	
# function to find the union of the most significant frequencies for two different waveforms. freq_cutoff defines the minimized normalized amplitude to be considered in the union
def significant_frequencies(waves_tuple, dt, freq_cutoff = 0.05):
	n = len(waves_tuple) # should be 2 for now
	n_amp            = [None for _ in range(n)]
	inds_significant = [None for _ in range(n)]
	for i in range(n):
        # if first iteration, get frequency variable freq. Otherwise, freq should be the same
        if i == 0:
            (n_amp[i], freq) = waveform_to_Fourier(waves_tuple[i], dt)
        else:
            (n_amp[i], _) = waveform_to_Fourier(waves_tuple[i], dt)
		inds_significant[i] = n_amp[i] > freq_cutoff 
	
	# now want the indices which are significant for any of the waves
    inds = inds_significant[0]
    for i in range(1, n):
        inds = np.logical_or(inds, inds_significant[i])
        
    freq_significant = freq[inds]
