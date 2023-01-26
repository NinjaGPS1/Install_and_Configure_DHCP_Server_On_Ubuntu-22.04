#!/bin/bash

#Create by SOTHEA_GPS
#Create by Ninja_GPS

# Update the system
sudo apt update
sudo apt upgrade -y

# Install DHCP server
sudo apt install isc-dhcp-server -y

# Backup the original DHCP config file
sudo cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak

# Create a new DHCP config file
sudo nano /etc/dhcp/dhcpd.conf

# Add the following to the DHCP config file
# Replace YOUR_SUBNET, YOUR_NETMASK, YOUR_RANGE with your desired values
# Replace YOUR_INTERFACE with the interface you want DHCP server to listen on

subnet YOUR_SUBNET netmask YOUR_NETMASK {
  range YOUR_RANGE;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  option routers YOUR_SUBNET;
}

# Save and close the config file

# Configure DHCP to listen on the desired interface
sudo nano /etc/default/isc-dhcp-server

# Change the INTERFACESv4 line to match your interface
INTERFACESv4="YOUR_INTERFACE"

# Save and close the file

# Restart DHCP server
sudo systemctl restart isc-dhcp-server

# Enable DHCP server to start on boot
sudo systemctl enable isc-dhcp-server
echo install and configure DHCP server is completed successfully.
echo ============================SOTHEA======================================
echo ===========================	========	=============================
echo ===========================	GPS-TEAM	=============================
echo ===========================	========	=============================
echo ============================SOTHEA======================================