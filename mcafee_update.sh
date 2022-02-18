#!/bin/bash
get_version="/opt/NAI/LinuxShield/bin/nails --version"
$get_version | head -n 2 | tail -n 1  | sed 's/.* \(.*\)/\1/'| sed 's/.0000//' > Mcafee.file
version=$(cat Mcafee.file)
rm -f Mcafee.file
var="$((version + 3))"
mkdir -p /tmp/AV
cd /tmp/AV
wget "http://download.nai.com/products/DatFiles/4.x/NAI/avvepo$((var))dat.zip"
if [ ! -f "/tmp/AV/avvepo$((var))dat.zip" ]
then
      echo "No file"
      sudo rm -Rf /tmp/AV
      exit
else
      sudo unzip avvepo*
      sudo /etc/init.d/nails stop
      cd /opt/NAI/LinuxShield/engine/dat
      sudo rm -f *
      echo "/tmp/AV/avvdat-$((var)).zip"
      sudo unzip "/tmp/AV/avvdat-$((var)).zip"
      sudo rm -f /opt/NAI/LinuxShield/engine/dat/*.txt
      sudo /etc/init.d/nails start
      sudo rm -Rf /tmp/AV
      sudo /opt/NAI/LinuxShield/bin/nails --version
      sudo /opt/McAfee/cma/bin/cmdagent -p
fi
