#!/bin/sh

#########################################################
PACKAGE_DIR='weatherplugin/main'
MY_FILE="weatherplugin"
version=v-1.4
#########################################################

MY_MAIN_URL="https://raw.githubusercontent.com/biko-73/"
MY_URL=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_FILE'_'$version.tar.gz
MY_TMP_FILE="/tmp/"$MY_FILE'_'$version.tar.gz

rm -f $MY_TMP_FILE > /dev/null 2>&1

MY_SEP='========================================'
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo ''
wget -T 2 $MY_URL -P "/tmp/"

if [ -f $MY_TMP_FILE ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	tar -xf $MY_TMP_FILE -C /
	MY_RESULT=$?

	rm -f $MY_TMP_FILE > /dev/null 2>&1

	echo ''
	echo ''
	if [ $MY_RESULT -eq 0 ]; then

        echo '**********************************************************'
        echo '*    weatherplugin $version INSTALLED SUCCESSFULLY          *'
	echo '*                    Mod by Fairman                      *'
        echo '*             upload BY BIKO - support on                *'	
        echo '*  https://www.tunisia-sat.com/forums/threads/3181413/   *'
        echo '**********************************************************'
        echo '*           your Device will RESTART Now                 *'
        echo '**********************************************************'
	
		if which systemctl > /dev/null 2>&1; then
			sleep 2; systemctl restart enigma2
		else
			init 4; sleep 4; init 3;
		fi
	else
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi;
	echo ''
	echo '**************************************************'
	echo '**                   FINISHED                   **'
	echo '**************************************************'
	echo ''
	exit 0
else
	echo ''
	echo "Download failed !"
	exit 1
fi
# ------------------------------------------------------------------------------------------------------------
