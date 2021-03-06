 echo "usage: create-docker-proj.sh  [-d <dockerhub>] [-p <proj-name>]"
# last modified 20190105
# ManuMuc

usage() {
   echo "Usage: create-docker-proj.sh  [-d <dockerhub>] [-p <proj-name>]" 1>&2;
   exit 1;
}

dockerhub=""
newproj=""
os=""
basedir="/tmp/docker"
#wgetopts="--user=set-user --password=set-pwd --no-check-certificate --content-disposition"
wgetopts"=--no-check-certificate --content-disposition"
gitdldockerfiletemp="https://raw.githubusercontent.com/manumuc/docker/master/dockerfile.template"

# if : follows flag than i needs a value like -d testproj
while getopts "d:p:h" option; do
   case "${option}" in
      d) dockerhub="$OPTARG";;
      p) newproj="$OPTARG";;
      h) usage ;;
   esac
done
shift "$((OPTIND-1))"

# exit script if variable is empty or not for lx or win configured
if [ -z "${basedir}" ]; then
   echo "<Error 0001>: No information about the OS or base directory not configured"
   usage
fi

if [ -z "${dockerhub}"] && [ -z "${newproj}"]; then
   # set variable manually
   dockerhub="enter-docker-hub-proj"
   newproj="enter-project-name"
fi

# create new project folder, change into it
mkdir -p ${basedir}/${dockerhub}/${newproj} && cd ${newproject}

# Download the template Dockerfile to the folder
    wget ${wgetopts} ${gitdldockerfiletemp} -P ${basedir}/${dockerhub}/${newproj}
#    curl -LJO  $gitdldockerfiletemp   -u USER:PASSWORD
#    curl -LJO $gitdldockerfiletemp -u manumuc:<pwd2enter>
