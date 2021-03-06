#! /bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied, give name of presentation"
    exit 1
fi

mkdir koulutukset/$1
cd koulutukset/$1
cp ../template-index.html ./index.html
cp ../template-presentation.md ./presentation.md
sed -i -e "s/Koulutus/$1/g" index.html
