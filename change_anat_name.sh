#!/bin/bash

# Define sub_no's and ses_no's
sub_array=({1..29})
sub_no_array=()
for i in "${sub_array[@]}"; do
    printf -v sub_number "%02d" "$i"
    sub_no_array+=("$sub_number")    
done


ses_no_array=(1 2)

# dicom to nifti anat files
for sub_no in "${sub_no_array[@]}"; do
    for ses_no in "${ses_no_array[@]}"; do

        # Define directory name
        source_file="/media/ccnlab/Elements/ActionAttention_fMRI/Analysis/NIFTI/sub-${sub_no}/ses-${ses_no}/anat/sub-${sub_no}_ses-${ses_no}_T1w_Crop_1.nii"
        dest_file="/media/ccnlab/Elements/ActionAttention_fMRI/Analysis/NIFTI/sub-${sub_no}/ses-${ses_no}/anat/sub-${sub_no}_ses-${ses_no}_acq-crop_T1w.nii"

        # dcm2niix
        mv ${source_file} ${dest_file}
    done
done

