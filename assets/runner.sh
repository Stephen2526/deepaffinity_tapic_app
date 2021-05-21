# Allow over-ride
if [ -z "${CONTAINER_IMAGE}" ]
then
    version=$(cat ./_util/VERSION)
    CONTAINER_IMAGE="index.docker.io/ste55/deepaffinity:0.1"
fi
. lib/container_exec.sh

# Write an excution command below that will run a script or binary inside the 
# requested container, assuming that the current working directory is 
# mounted in the container as its WORKDIR. In place of 'docker run' 
# use 'container_exec' which will handle setup of the container on 
# a variety of host environments. 
#
# Here is a template:
#
# container_exec ${CONTAINER_IMAGE} COMMAND OPTS INPUTS
#
# Here is an example of counting words in local file 'poems.txt',
# outputting to a file 'wc_out.txt'
#
# container_exec ${CONTAINER_IMAGE} wc poems.txt > wc_out.txt
#

# set -x

# set +x

COMMAND=" bash run_job.sh "
PARAMS=" ${running_mode} ${model_version} ${inputs} ${output_file} ${label_to_predict} ${compound_library}"



job_dir=$PWD
container_exec ${CONTAINER_IMAGE} cp -r /deepaffinity ./
cd deepaffinity
container_exec ${CONTAINER_IMAGE} ${COMMAND} ${PARAMS}
cp ${output_file} ${job_dir}
#rm -r deepaffinity