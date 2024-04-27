#!/bin/bash
#Template provided by Daniel Levitas of Indiana University
#Edits by Andrew Jahn, University of Michigan, 07.22.2020

# MNI152NLin2009cAsym:res-2

# arguments : $1 = research_group, $2 subject id, $3 available ram in mbs, $4 number of threads

#User inputs:
data_dir=/media/ccnlab/Elements/ActionAttention_fMRI/Analysis/NIFTI
out_root_dir=/media/ccnlab/Elements/ActionAttention_fMRI/Analysis/Derivatives
fs_license_dir=/home/ccnlab/Documents/freesurfer_license.txt


subj=$1
mem_mb=8000 #gb
nthreads=4


#export TEMPLATEFLOW_HOME=$HOME/.cache/templateflow
export FS_LICENSE=$fs_license_dir

start=$(date +'%s')
#--user 10110:10003 id -u id -g
sudo docker run -v $data_dir:/data -v $out_root_dir:/out -v $fs_license_dir:/license \
nipreps/fmriprep /data /out \
participant \
--participant-label $subj \
--fs-license-file /license \
--nthreads $nthreads \
--stop-on-first-crash \
--mem_mb $mem_mb \
--write-graph 


end=$(date +'%s')


echo "It took $(($end - $start)) for subject - $(($subj)) seconds"
