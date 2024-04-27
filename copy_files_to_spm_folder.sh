#!/bin/bash

# Define sub_nos and ses_nos
sub_array=({1..29})
ses_no_array=(1 2)

#dicom to nifti func files
for sub_no in "${sub_array[@]}"; do

    printf -v formatted_subno "%02d" "$sub_no"

    sudo cp /media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives/sub-${formatted_subno}/anat/sub-${formatted_subno}_space-MNI152NLin2009cAsym_desc-preproc_T1w.json \
/media/ccnlab/Elements/spm_ActionAttention/subjects/sub${sub_no}/anat

    sudo cp /media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives/sub-${formatted_subno}/anat/sub-${formatted_subno}_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii \
/media/ccnlab/Elements/spm_ActionAttention/subjects/sub${sub_no}/anat 

    for ses_no in "${ses_no_array[@]}"; do
        run_no_array=()
        if [ "$ses_no" == 1 ]; then
           run_array=({1..8})
        else
           run_array=({1..4})
        fi

        for run_no in "${run_array[@]}"; do
            sudo cp /media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives/sub-${formatted_subno}/ses-${ses_no}/func/sub-${formatted_subno}_ses-${ses_no}_task-ActionAttention_run-${run_no}_space-MNI152NLin2009cAsym_desc-preproc_bold.json \
/media/ccnlab/Elements/spm_ActionAttention/subjects/sub${sub_no}/ses-${ses_no}/run-${run_no}

            sudo cp /media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives/sub-${formatted_subno}/ses-${ses_no}/func/sub-${formatted_subno}_ses-${ses_no}_task-ActionAttention_run-${run_no}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii \
/media/ccnlab/Elements/spm_ActionAttention/subjects/sub${sub_no}/ses-${ses_no}/run-${run_no}

        done
    done
done
