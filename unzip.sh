#!/bin/bash

# Define sub_nos and ses_nos
sub_array=({1..29})
ses_no_array=(1 2)

#dicom to nifti func files
for sub_no in "${sub_array[@]}"; do

    printf -v formatted_subno "%02d" "$sub_no"

    cd /media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives/sub-${sub_no}/anat

    sudo gunzip -dkf *.gz 

    for ses_no in "${ses_no_array[@]}"; do

         cd /media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives/sub-${sub_no}/ses-${ses_no}/func

	 sudo gunzip -dkf *.gz

    done
done
