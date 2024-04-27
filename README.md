# fmri-data-preparation
This set of codes prepares the fMRI data for preprocessing, applies preprocessing, and creates folder structure for spm 1st analysis.

dicom2nifti.sh: This script converts the dicom files to nifti format to be able to apply preprocessing.

change_anat_name.sh: Some anatomical files do not comply with the BIDS folder format. This script changes the names accordingly.

to_server_copy_files.sh: This script can be used to transfer any files to a server with scp command.

fmriprep.sh: This script runs the preprocessing using fmriprep. It was originally written by Daniel Levitas of Indiana University and is adjusted according to our project.

get_derivatives_from_server.sh: After preprocessing on the server, it transfers the necessary files to the local computer.

unzip.sh: This script unzips the necessary folders.

spm_folder.sh: This creates the spm folder structure for further spm 1st level analysis.

copy_files_to_spm_folder.sh: After the preprocessing, this script copies the necessary outputs to spm folder for 1st level analysis.
