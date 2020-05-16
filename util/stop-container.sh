# PARSE ARGS
while getopts v: option
do
    case "${option}" in
        v) VERSION=${OPTARG};;
    esac
done

docker container stop "ion-radio-${VERSION}"
