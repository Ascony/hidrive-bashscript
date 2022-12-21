#!/bin/bash
# statische Variablen
file=~/.davfs2/secrets

# Schritt 1: username, passwort und otp abfragen und zwischenspeichern
read -p "Bitte gebe die URL zum HiDrive-Soeicher ein: " url
read -p "Bitte gebe dein Benutzernamen ein: " user
read -p "Bitte gebe das Passwort ein: " -s upw
echo
read -p "Bitte gebe das Einmalpasswort (OTP) ein: " otp

# Schritt 2: Logindaten in secret File schreiben
sed -i 1d $file
echo $url $user $upw:$otp >> $file

# Schritt 3: Verbindungsaufbau mit den in Schritt 1 erhobenen Daten
echo "Verbindungsaufbau zum HiDrive-Speicher via WebDAV..."
mount /mnt/hidrive
