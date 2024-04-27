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
        source_dir="/media/ccnlab/Elements/ActionAttention_fMRI/Analysis/DICOM/sub-${sub_no}/ses-${ses_no}/anat"
        dest_dir="/media/ccnlab/Elements/ActionAttention_fMRI/Analysis/NIFTI/sub-${sub_no}/ses-${ses_no}/anat"

        # dcm2niix
	dcm2niix -f "sub-${sub_no}_ses-${ses_no}_T1w" -p y -x y -z n -o ${dest_dir} ${source_dir}
    done
done


#dicom to nifti func files
for sub_no in "${sub_no_array[@]}"; do
    for ses_no in "${ses_no_array[@]}"; do
        run_no_array=()
	if [ "$ses_no" == 1 ]; then
	   run_array=({1..8})
           for i in "${run_array[@]}"; do
              printf -v run_number "%02d" "$i"
	      run_no_array+=("$run_number")
           done
        else
           run_array=({1..4})
           for i in "${run_array[@]}"; do
              printf -v run_number "%02d" "$i"
              run_no_array+=("$run_number")
           done
        fi

	for run_no in "${run_no_array[@]}"; do

        # Define directory name
        source_dir="/media/ccnlab/Elements/ActionAttention_fMRI/Analysis/DICOM/sub-${sub_no}/ses-${ses_no}/func/run-${run_no}"
        dest_dir="/media/ccnlab/Elements/ActionAttention_fMRI/Analysis/NIFTI/sub-${sub_no}/ses-${ses_no}/func"

        # dcm2niix
        dcm2niix -f "sub-${sub_no}_ses-${ses_no}_task-ActionAttention_run-${run_no}_bold" -p y -x y -z n -o ${dest_dir} ${source_dir}
	done
    done
done
