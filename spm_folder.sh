#!/bin/bash

# Define sub_nos and ses_nos
sub_array=({1..29})
ses_no_array=(1 2)

cd /media/ccnlab/Elements
#mkdir spm_ActionAttention
cd ./spm_ActionAttention
#mkdir subjects
cd ./subjects

#dicom to nifti func files
for sub_no in "${sub_array[@]}"; do
    cd /media/ccnlab/Elements/spm_ActionAttention/subjects
    mkdir sub${sub_no}
    cd /media/ccnlab/Elements/spm_ActionAttention/subjects/sub${sub_no}
    mkdir anat ses-1 ses-2 1stlevel_active 1stlevel_passive 1stlevel_RSA
    for ses_no in "${ses_no_array[@]}"; do
        run_no_array=()
        if [ "$ses_no" == 1 ]; then
           run_array=({1..8})
        else
           run_array=({1..4})
        fi

        for run_no in "${run_array[@]}"; do
        cd /media/ccnlab/Elements/spm_ActionAttention/subjects/sub${sub_no}/ses-${ses_no}
	mkdir run-${run_no}
        done
    done
done
