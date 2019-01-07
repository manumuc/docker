# echo "usage: create-docker=proj.sh  [-d <dockerhub>] [-p <proj-name>]"
# last modified 20190105
# ManuMuc

usage() { echo "Usage: $0 [-d <dockerhub>] [-p <proj-name>]" 1>&2; exit 1; }


dockerhub=""
newproj=""
os=""
basedir="/tmp/docker"
gitdldockerfiletemp="https://raw.githubusercontent.com/manumuc/docker/master/dockerfile.template"

# if : follows flag than i needs a value like -d testproj
while getopts "hd:p:" option; do
   case "${option}" in
      d) dockerhub=${optarg};;
      p) newproj=$[optarg];;
      h) usage ;;
   esac
done
shift $((OPTIND-1))

# exit script if variable is empty or not for lx or win configured
if [ -z "${basedir}" ]; then
   echo "<Error 0001>: No information about the OS or base directory not configured"
   usage
fi

if [-z "${d}"] || [-z "${d}"]; then
   # set variable manually
   dockerhub="enter-docker-hub-proj"
   newproj="enter-project-name"
fi

# create new project folder, change into it
mkdir -p ${basedir}/${dockerhub}/${newproj} && cd ${newproject}

# Download the template Dockerfile to the folder
    wget --no-check-certificate --content-disposition ${gitdldockerfiletemp}
#    curl -LJO  $gitdldockerfiletemp   -u USER:PASSWORD
#    curl -LJO $gitdldockerfiletemp -u manumuc:<pwd2enter>
                                                                              
