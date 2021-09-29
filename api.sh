echo "-----------------------------------------------------"
echo "|ENV1: $(awk 'END{print}' env1/.vh)     |"
echo "|ENV2: $(awk 'END{print}' emv2/.vh)    |"
echo "|ENV3: $(awk 'END{print}' emv3/.vh) |"
echo "-----------------------------------------------------"
PS3='Choose: '
options=("ENV1" "ENV2" "ENV3")
select opt in "${options[@]}"
do
    case $opt in
        "ENV1")
            root_folder=env
            url=env1.local
            break
            ;;
        "ENV2")
            root_folder=env2
            url=env2.local
            break
            ;;
        "ENV3")
            root_folder=env3
            url=env3.local
            break
            ;;
        "Quit")
            exit 0
            ;;
        *) exit 0
			;;
        esac
done
curl -fs $url/v1/version > $root_folder/version.txt
version=$(awk -F' ' '{print $1}' $root_folder/version.txt)
build=$(awk -F' ' '{print $2}' $root_folder/version.txt)
rm $root_folder/version.txt
folder=$version.$build
if [ -d $root_folder/$folder ];
 then
     #versions index
    $(ls -lt $root_folder | awk -F' ' '{print $9}' > $root_folder/.index)
else
	mkdir $root_folder/$folder
    ls -lt $root_folder | awk -F' ' '{print $9}' > $root_folder/.index
    date=$(date)
	curl -s $url/api-docs > $root_folder/$folder/api.json
    #adding basePath and host params to fix some errors made by developer
    cp $root_folder/.fixbasePath.sh $root_folder/$folder && cd $root_folder/$folder
    $(./.fixbasePath.sh) && rm api.json .fixbasePath.sh && mv new.json api.json && cd ../../
    echo "OK! Got $folder"
    sleep 3
    echo $folder $date >> $root_folder/.vh
    date > $root_folder/$folder/.ds
    #generate bash client
    mkdir $root_folder/$folder/client
    java -jar swagger-codegen-cli.jar generate -i $root_folder/$folder/api.json -l bash -c config.json -o $root_folder/$folder/client/
    #generate postman collection
    cp convert.js $root_folder/$folder/ && cd $root_folder/$folder
    node convert.js && rm convert.js && cd client
    #Replace 1st line of Dockerfile with different ubuntu version
    awk '$0 = NR==1 ? replace : $0' replace="FROM ubuntu:17.10" Dockerfile > Dockerfile.new
    #Adding jq install
    awk '$0 = NR==4 ? replace : $0' replace="RUN apt-get install -y bash-completion zsh curl cowsay git vim bsdmainutils jq" Dockerfile > Dockerfile.new
    mv Dockerfile.new Dockerfile
    docker build -t api-client-$root_folder-$folder .
    cd ../../../
	#
    #docker exec -it imageHash /bin/zsh
    #Diff oldApi with newApi
    diff --suppress-common-lines $root_folder/$(sed -n '3p' $root_folder/.index)/api.json $root_folder/$folder/api.json > $root_folder/$folder/api.diff
fi
#Opens diff if found. Also opens latest diff if nothing new
if [ -s $root_folder/$folder/api.diff ];
then
./idiff.sh $root_folder/$folder/api.diff > /dev/null
view $root_folder/$folder/api.diff
else
echo "-----------------------"
echo "      ¯\_(ツ)_/¯"
echo "-----------------------"
fi
