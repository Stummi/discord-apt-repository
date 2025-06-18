#!/bin/bash -e

if [[ ! -d tmp/discord-*.deb ]]; then
  mkdir -p tmp
  (cd tmp && wget --content-disposition https://discord.com/api/download?platform=linux)
fi

curVersion=(pool/main/discord-*.deb)
curVersion=${curVersion##*/}
echo $curVersion
newVersion=(tmp/discord-*.deb)
newVersion=${newVersion##*/}

if [[ $curVersion == $newVersion ]]; then
  echo "Current version is up to date."
  exit 0
fi

echo "New version found: $newVersion"
rm -f pool/main/discord-*.deb
mv tmp/$newVersion pool/main/

dpkg-scanpackages pool/ > dists/stable/main/binary-amd64/Packages
(cd dists/stable/ && ../../gen.sh > Release)
