#!/bin/bash

# Define sub_nos
sub_array=({1..29})

#dicom to nifti func files
for sub_no in "${sub_array[@]}"; do

    printf -v formatted_subno "%02d" "$sub_no"

    scp -r aeroglu@139.179.121.48:/auto/k2/aeroglu/ActionAttention_fMRI/Analysis/Derivatives/sub-${sub_no}  /media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives
    scp aeroglu@139.179.121.48:/auto/k2/aeroglu/ActionAttention_fMRI/Analysis/Derivatives/sub-${sub_no}.html  /media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives

done
