#!/bin/bash
# statische Variablen
file=~/.davfs2/secrets

# Schritt 1: Zugangsdaten aus $file einlesen
read ln < $file
IFS=‘ ‘ read -ra login <<< “$ln“
upw=$( echo ${login[2]} | awk ‘{ print substr( $0, 1, length($0)-7 ) }‘ )

# Schritt 2: OTP abfragen
read -p “Bitte gebe das Einmalpasswort (OTP) ein: “ otp

# Schritt 3: Logindaten in secret File schreiben
sed -i 1d $file
echo ${login[0]} ${login[1]} $upw:$otp >> $file

# Schritt 4: Verbindungsaufbau mit den in Schritt 1 eingelesenen und in Schritt 2 abgefragten Daten
echo “Verbindungsaufbau zu HiDrive-Speicher via WebDAV...“
mount /mnt/hidrive
