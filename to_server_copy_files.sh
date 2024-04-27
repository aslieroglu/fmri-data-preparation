#!/bin/bash

# Define sub_no's and ses_no's
sub_array=({1..29})
sub_no_array=()
for i in "${sub_array[@]}"; do
    printf -v sub_number "%01d" "$i"
    sub_no_array+=("$sub_number")    
done


# Define the source and destination paths
source_path="/media/ccnlab/Elements/spm_ActionAttention/subjects/sub"
destination_path="aeroglu@139.179.121.48:/auto/k2/aeroglu/spm_ActionAttention/subjects/sub"

# Loop over subject numbers
for subject_no in "${sub_no_array[@]}"; do
    # Construct the complete source and destination paths
    complete_source_path="$source_path$subject_no/1stlevel_decoding_passive"
    complete_destination_path="$destination_path$subject_no"
    
    # Run the scp command
    scp -r "$complete_source_path" "$complete_destination_path"
done
