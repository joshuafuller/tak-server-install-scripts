echo "This script will transfer your TAK Server ZIP file from your local machine to your TAK Server"
read -p "Press any key to begin ..."

echo "What is your server IP Address?"
read IPADDRESS

echo "What the filename of your release?"
echo "(ex: 'takserver-docker-4.7-RELEASE-20.zip')"
read TAKVERSION

echo "What is the path you have the zip stored?"
echo "***** DO NOT INCLUDE / AT END OF PATH *****"
echo "(if left blank defaults to '~/atak' )"
read TAKPATH

if [ -z $TAKVERSION ]
then
scp $TAKPATH/$TAKVERSION tak@$IPADDRESS:~/tak-zip
else
scp ~/atak/$TAKVERSION tak@$IPADDRESS:~/tak-zip
fi




#tell user to reboot now and run script 2
echo "=================================================================="
echo "=================================================================="
echo "=================================================================="
echo "******************************************************************"
echo "                                                                   "
echo  "VERIFY FILE TRANSFER SUCCESSFUL THEN LOG BACK INTO TAK SERVER AND RUN NEXT SCRIPT"
echo "                                                                   "
echo "******************************************************************"
echo "=================================================================="
echo "=================================================================="
echo "=================================================================="
