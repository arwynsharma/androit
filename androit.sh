#!/bin/bash
clear
tput setaf 2
echo "  .S_SSSs     .S_sSSs     .S_sSSs     .S_sSSs      sSSs_sSSs     .S  sdSS_SSSSSSbs "
echo " .SS~SSSSS   .SS~YS%%b   .SS~YS%%b   .SS~YS%%b    d%%SP~YS%%b   .SS  YSSS~S%SSSSSP "
echo " S%S   SSSS  S%S   \`S%b  S%S   \`S%b  S%S   \`S%b  d%S'     \`S%b  S%S       S%S "
echo " S%S    S%S  S%S    S%S  S%S    S%S  S%S    S%S  S%S       S%S  S%S       S%S "
echo " S%S SSSS%S  S%S    S&S  S%S    S&S  S%S    d*S  S&S       S&S  S&S       S&S "
echo " S&S  SSS%S  S&S    S&S  S&S    S&S  S&S   .S*S  S&S       S&S  S&S       S&S "
echo " S&S    S&S  S&S    S&S  S&S    S&S  S&S_sdSSS   S&S       S&S  S&S       S&S "
echo " S&S    S&S  S&S    S&S  S&S    S&S  S&S~YSY%b   S&S       S&S  S&S       S&S "
echo " S*S    S&S  S*S    S*S  S*S    d*S  S*S   \`S%b  S*b       d*S  S*S       S*S "
echo " S*S    S*S  S*S    S*S  S*S   .S*S  S*S    S%S  S*S.     .S*S  S*S       S*S "
echo " S*S    S*S  S*S    S*S  S*S_sdSSS   S*S    S&S   SSSbs_sdSSS   S*S       S*S "
echo " SSS    S*S  S*S    SSS  SSS~YSSY    S*S    SSS    YSSP~YSSY    S*S       S*S "
echo "        SP   SP                      SP                         SP        SP "
echo "        Y    Y                       Y                          Y         Y "
tput setaf 4
printf "\n"
printf "\t───── ❝ Script to setup android pentesting environment ❞ ─────\n"
printf "\n"
printf "\t \t        ───── ❝ Arwyn Sharma ❞ ─────\n"
printf "\n"

#variables
SCRIPT_DIR=`pwd`
pip2=`which pip2`
pip3=`which pip3`
count=0

tput setaf 1

#root detection
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#checking pre requisites 
echo "[*]Checking prerequisites"
sleep 2

until [[ ("$pip2" && "$pip3") ]]
do
	if [ $count = 1 ];then
		echo "[*]ERROR OCCURED"
		exit 1
	fi
	if [ "$pip2" ];then
		echo "[*]pip2 setup Done"
	else
		echo "  [*]Setting pip2"
		echo "  [*]May take some time do not close the script"
		wget -q https://bootstrap.pypa.io/pip/2.7/get-pip.py
		python2 get-pip.py &>/dev/null
		pip2=`which pip2`
	fi


	if [ "$pip3" ];then
		echo "[*]pip3 setup Done"
	else
		echo "  [*]Setting pip3"
		echo "  [*]May take some time do not close the script"
		apt install --assume-yes python3-pip &>/dev/null
		pip3=`which pip3`
	fi
	tput cuu1;tput el
	tput cuu1;tput el
	tput cuu1;tput el
	tput cuu1;tput el
	((count+=1))
done
tput cuu1;tput el
rm -rf get-pip.py

echo "[*]Prerequisites checked starting the setup process"
sleep 2
tput cuu1;tput el

#android sdk

tput setaf 1
echo "[*]Setting Up android sdk"
tput setaf 7
wget -q --show-progress https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
tput cuu1;tput el
echo "  [*]Download finish"
echo "  [*]Unzipping"
unzip -q commandlinetools-linux*.zip 
echo "  [*]Setting up SDK"
echo "  [i]It may take some time do not close the script"
yes | cmdline-tools/bin/sdkmanager "platforms;android-25" "platform-tools" "build-tools;27.0.3"  --sdk_root=/opt/androit/android_sdk &>/dev/null
cmdline-tools/bin/sdkmanager update  --sdk_root=/opt/androit/android_sdk &>/dev/null
tput cuu1;tput el
echo "  [*]SDK setup complete"
echo "  [i]android sdk location is /opt/androit/android_sdk"
rm -rf commandlinetools-linux*.zip
rm -rf cmdline-tools

#adb
tput setaf 1
echo "[*]Setting up adb"
apt install --assume-yes adb &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

tput setaf 1
echo "[*]Setting up radare2"
apt install --assume-yes radare2 &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

#apktool
tput setaf 1
echo "[*]Setting up apktool"
apt install --assume-yes apktool &>/dev/null 
tput setaf 7
echo "  [*]Setup Done"

#dex2jar
tput setaf 1
echo "[*]Setting up dex2jar"
apt install --assume-yes dex2jar &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

#enjarify
tput setaf 1
echo "[*]Setting up enjarify"
apt install --assume-yes enjarify &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

#bytecode-viewer
tput setaf 1
echo "[*]Setting up bytecode-viewer"
apt install --assume-yes bytecode-viewer &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

#jd-gui
tput setaf 1
echo "[*]Setting up jd-gui"
apt install --assume-yes jd-gui &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

#pidcat
tput setaf 1
echo "[*]Setting up pidcat"
apt install --assume-yes pidcat &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

#scrcpy
tput setaf 1
echo "[*]Setting up scrcpy"
apt install --assume-yes scrcpy &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

#apkx
tput setaf 1
echo "[*]Setting up apkx"
git clone https://github.com/b-mueller/apkx -q 
cd apkx
./install.sh
cd ..
rm -rf apkx
tput setaf 7
echo "  [*]Setup Done"

#mobsf
echo "  [*]Setting up MOBSF"
tput setaf 7
echo "  [i]This May take some time depending upon your network speed."
git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF.git /opt/androit/MOBSF -q
cd /opt/androit/MOBSF
./setup.sh &>/dev/null
tput cuu1;tput el
echo "  [*]Setup Done"
echo "  [i]You can run MOBSF navigating to /opt/androit/MOBSF/ and executing run.sh"
cd $SCRIPT_DIR

#androbug
tput setaf 1
echo "[*]Setting up Androbug Framework"
git clone https://github.com/AndroBugs/AndroBugs_Framework.git /opt/androit/AndroBugs_Framework -q
tput setaf 7
echo "  [*]Setup Done"
echo "  [i]You can use the AndroBugs Framework by navigating to /opt/androit/AndroBugs_Framework and execute androbugs.py"

#intellij IDE
tput setaf 1
echo "[*]Setting up intellij IDEA"
wget -q --show-progress https://download-cdn.jetbrains.com/idea/ideaIC-2021.1.2.tar.gz
tput cuu1;tput el
tput setaf 7
echo "  [*]Download complete"
echo "  [*]Unzipping may take some time"
tar -xf ideaIC-2021.1.2.tar.gz -C /opt/androit/
tput cuu1;tput el
echo "  [*]Unzipped"
mv /opt/androit/idea-IC-211.7442.40/ /opt/androit/intellij_idea
echo "  [*]Setup Done"
echo "  [*]You can access intellij idea from /opt/androit/intellij_idea/bin/idea.sh
"
rm -rf ideaIC-2021.1.2.tar.gz

tput setaf 1
echo "[*]Setting up angr"
pip install angr &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

tput setaf 1
echo "[*]Setting up androguard"
pip3 install androguard &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

tput setaf 1
echo "[*]Setting up objection"
pip3 install objection &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

tput setaf 1
echo "[*]Setting up ab-decrypt"
pip3 install ab-decrypt &>/dev/null
tput setaf 7
echo "  [*]Setup Done"

tput setaf 1
echo "[*]Setting up drozer"
wget -q --show-progress https://github.com/FSecureLABS/drozer/releases/download/2.4.4/drozer_2.4.4.deb
wget -q --show-progress https://github.com/FSecureLABS/drozer/releases/download/2.4.4/drozer-2.4.4-py2-none-any.whl
tput cuu1;tput el
tput cuu1;tput el
pip install --upgrade setuptools &>/dev/null
pip2 install wheel  &>/dev/null
pip2 install pyyaml &>/dev/null
pip2 install pyhamcrest &>/dev/null
pip2 install protobuf  &>/dev/null
pip2 install pyopenssl  &>/dev/null
pip2 install twisted &>/dev/null
pip2 install service_identity &>/dev/null
pip2 install drozer-2.4.4-py2-none-any.whl &>/dev/null
dpkg -i drozer_2.4.4.deb &>/dev/null
rm -rf drozer-2.4.4.deb
rm -rf drozer-2.4.4-py2-none-any.whl



echo "[*]Setting up frida"
pip3 install frida &>/dev/null
pip3 install frida-tools &>/dev/null
tput setaf 7
wget -q --show-progress https://github.com/frida/frida/releases/download/14.2.18/frida-server-14.2.18-android-x86.xz
unxz frida-server-14.2.18-android-x86.xz
tput cuu1;tput el
echo "  [*]frida setup Done"
echo "  [*]Setting frida server"
sleep 2
mkdir /opt/androit/frida
mv frida-server-14.2.18-android-x86 /opt/androit/frida/frida-server 
tput cuu1;tput el
echo "  [*]frida-server is available in /opt/androit/frida/android-server. Just push it to android to start using."

tput setaf 1
