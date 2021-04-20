#! /bin/bash
#This script is to validate the network connectivity needed to successfully deploy your #HDInsight cluster.

. params.txt

#Validate Custom Ambari DB
if [ ! -z "$AMBARIDB" ]; then
	echo "Validating connectivity to custom Ambari DB: $AMBARIDB.database.windows.net" 
	AmbariErr="$(telnet $AMBARIDB.database.windows.net 1433 2>&1)"
	echo "Custom Ambari DB Results: $AmbariErr"
	echo "************************************"
else
	echo "No custom Ambari DB defined"
	echo "************************************"
fi

#Validate Custom Hive DB
if [ ! -z "$HIVEDB" ]; then 
	echo "Validating connectivity to custom Hive DB: $HIVEDB.database.windows.net" 
	HiveErr="$(telnet $HIVEDB.database.windows.net 1433 2>&1)"
	echo "Custom Hive DB Results: $HiveErr"
	echo "************************************"
else
	echo "No custom Hive DB defined"
	echo "************************************"
fi

#Validate Custom OOZIE DB
if [ ! -z "$OOZIEDB" ]; then 
	echo "Validating connectivity to custom OOZIE DB: $OOZIEDB.database.windows.net" 
	OozieErr="$(telnet $OOZIEDB.database.windows.net 1433 2>&1)"
	echo "Custom Oozie DB Results: $OozieErr"
	echo "************************************"
else
	echo "No custom Oozie DB defined"
	echo "************************************"
fi

#Validate Custom RANGER DB
if [ ! -z "$RANGERDB" ]; then 
	echo "Validating connectivity to custom Ranger DB: $RANGERDB.database.windows.net" 
	RangerErr="$(telnet $RANGERDB.database.windows.net 1433 2>&1)"
	echo "Custom Ranger DB Results: $RangerErr"
	echo "************************************"
else
	echo "No custom Ranger DB defined"
	echo "************************************"
fi

#Validate Internal Metastore DBs
#Need a way to test connectivity to the Azure SQL DB endpoints used for internal Hive #and Ambari databases. Need to test ports 1433 and 11000 - 11999.

#Validate Primary Storage Account:
if [ ! -z "$PrimaryStorage" ]; then 
	echo "Validating connectivity to Primary Storage Account: $PrimaryStorage" 
	PrimStorErr="$(nslookup $PrimaryStorage 2>&1)"
	echo "Primary Storage Connectivity Results: $PrimStorErr"
	echo "************************************"
else
	echo "A primary storage account is required to create an HDInsight cluster"
	echo "************************************"
fi

#Validate Secondary Storage Account:
if [ ! -z "$SecondaryStorage" ]; then 
	echo "Validating connectivity to Secondary Storage Account: $SecondaryStorage" 
	SeconStorErr="$(nslookup $SecondaryStorage 2>&1)"
	echo "Secondary Storage Connectivity Results: $SeconStorErr"
	echo "************************************"
else
	echo "A Secondary storage account was not found"
	echo "************************************"
fi

#Validate KeyVault Connectivity:
if [ ! -z "$KV1" ]; then 
	echo "Validating connectivity to Azure Key Vault: $KV1" 
	KV1Err="$(telnet $KV1 2>&1)"
	echo "Key Vault Connectivity Results: $KV1Err"
	echo "************************************"
else
	echo "No KeyVault entry was"
	echo "************************************"
fi

#Validate Azure Management Connectivity:
echo "Validating management.azure.com Connectivity:" 
	AzureMgmtErr="$(telnet management.azure.com 443 2>&1)"
	echo "Azure Management Connectivity Results: $AzureMgmtErr"
	echo "************************************"

#Validate Microsoft OAuth endpoint Connectivity:
echo "Validating login.windows.net Connectivity" 
	MSFTloginErr="$(telnet login.windows.net 443 2>&1)"
	echo "login.windows.net Connectivity Results: $MSFTloginErr"
	echo "************************************"

echo "Validating login.microsoftonline.com Connectivity" 
	MSFTonlineErr="$(telnet login.microsoftonline.com 443 2>&1)"
	echo "login.microsoftonline.com Connectivity Results: $MSFTonlineErr"
	echo "************************************"

#Validate HDInsight Management IPs All Regions:
echo "Health and management services IP 168.61.49.99 connectivity check" 
	AllRegionsErr1="$(telnet 168.61.49.99 443 2>&1)"	
	echo "Health and management services IP 168.61.49.99 443 Connectivity Results: $AllRegionsErr1"
	echo "************************************"

echo "Health and management services IP 23.99.5.239 connectivity check" 
	AllRegionsErr2="$(telnet 23.99.5.239 443 2>&1)"	
	echo "Health and management services IP 23.99.5.239 Connectivity Results: $AllRegionsErr2"
	echo "************************************"

echo "Health and management services IP 168.61.48.131 connectivity check" 
	AllRegionsErr3="$(telnet 168.61.48.131 443 2>&1)"	
	echo "Health and management services IP 168.61.48.131 Connectivity Results: $AllRegionsErr3"
	echo "************************************"	
	
echo "Health and management services IP 138.91.141.162 connectivity check" 
	AllRegionsErr4="$(telnet 138.91.141.162 443 2>&1)"	
	echo "Health and management services IP 138.91.141.162 Connectivity Results: $AllRegionsErr4"
	echo "************************************"
	
#Validate HDInsight Management IPs East Asia:
echo "Health and management services (East Asia) IP 23.102.235.122 connectivity check" 
	EastAsiaErr1="$(telnet 23.102.235.122 443 2>&1)"	
	echo "Health and management services IP 23.102.235.122 443 Connectivity Results: $EastAsiaErr1"
	echo "************************************"
	
echo "Health and management services (East Asia) IP 52.175.38.134 connectivity check" 
	EastAsiaErr2="$(telnet 52.175.38.134 443 2>&1)"	
	echo "Health and management services IP 52.175.38.134 443 Connectivity Results: $EastAsiaErr2"
	echo "************************************"
	
#Validate HDInsight Management IPs Southeast Asia:
echo "Health and management services (Southeast Asia) IP 13.76.245.160 connectivity check" 
	SEastAsiaErr1="$(telnet 13.76.245.160 443 2>&1)"	
	echo "Health and management services IP 13.76.245.160 443 Connectivity Results: $SEastAsiaErr1"
	echo "************************************"
	
echo "Health and management services (Southeast Asia) IP 13.76.136.249 connectivity check" 
	SEastAsiaErr2="$(telnet 13.76.136.249 443 2>&1)"	
	echo "Health and management services IP 13.76.136.249 443 Connectivity Results: $SEastAsiaErr2"
	echo "************************************"
	
#Validate HDInsight Management IPs Australia East:
echo "Health and management services (Australia East) IP 104.210.84.115 connectivity check" 
	AusEastErr1="$(telnet 104.210.84.115 443 2>&1)"	
	echo "Health and management services IP 104.210.84.115 443 Connectivity Results: $AusEastErr1"
	echo "************************************"
	
echo "Health and management services (Australia East) IP 13.75.152.195 connectivity check" 
	AusEastErr2="$(telnet 13.75.152.195 443 2>&1)"	
	echo "Health and management services IP 13.75.152.195 443 Connectivity Results: $AusEastErr2"
	echo "************************************"
	
#Validate HDInsight Management IPs Australia Southeast:
echo "Health and management services (Australia Southeast) IP 13.77.2.56 connectivity check" 
	AusSEastErr1="$(telnet 13.77.2.56 443 2>&1)"	
	echo "Health and management services IP 13.77.2.56 443 Connectivity Results: $AusSEastErr1"
	echo "************************************"
	
echo "Health and management services (Australia Southeast) IP 13.77.2.94 connectivity check" 
	AusSEastErr2="$(telnet 13.77.2.94 443 2>&1)"	
	echo "Health and management services IP 13.77.2.94 443 Connectivity Results: $AusSEastErr2"
	echo "************************************"
	
#Validate HDInsight Management IPs Brazil South:
echo "Health and management services (Brazil South) IP 191.235.84.104 connectivity check" 
	BrazilSErr1="$(telnet 191.235.84.104 443 2>&1)"	
	echo "Health and management services IP 191.235.84.104 443 Connectivity Results: $BrazilSErr1"
	echo "************************************"
	
echo "Health and management services (Brazil South) IP 191.235.87.113 connectivity check" 
	BrazilSErr2="$(telnet 191.235.87.113 443 2>&1)"	
	echo "Health and management services IP 191.235.87.113 443 Connectivity Results: $BrazilSErr2"
	echo "************************************"
	
#Validate HDInsight Management IPs Canada East:
echo "Health and management services (Canada East) IP 52.229.127.96 connectivity check" 
	CanadaE1="$(telnet 52.229.127.96 443 2>&1)"	
	echo "Health and management services IP 52.229.127.96 443 Connectivity Results: $CanadaE1"
	echo "************************************"
	
echo "Health and management services (Canada East) IP 52.229.123.172 connectivity check" 
	CanadaE2="$(telnet 52.229.123.172 443 2>&1)"	
	echo "Health and management services IP 52.229.123.172 443 Connectivity Results: $CanadaE2"
	echo "************************************"
	
#Validate HDInsight Management IPs Canada Central:
echo "Health and management services (Canada Central) IP 52.228.37.66 connectivity check" 
	CanadaCentral="$(telnet 52.228.37.66 443 2>&1)"	
	echo "Health and management services IP 52.228.37.66 443 Connectivity Results: $CanadaCentral"
	echo "************************************"
	
echo "Health and management services (Canada Central) IP 52.228.45.222 connectivity check" 
	CanadaCentral2="$(telnet 52.228.45.222 443 2>&1)"	
	echo "Health and management services IP 52.228.45.222 443 Connectivity Results: $CanadaCentral2"
	echo "************************************"
	
#Validate HDInsight Management IPs China North:
echo "Health and management services (China North) IP 42.159.96.170 connectivity check" 
	ChinaN1="$(telnet 42.159.96.170 443 2>&1)"	
	echo "Health and management services IP 42.159.96.170 443 Connectivity Results: $ChinaN1"
	echo "************************************"
	
echo "Health and management services (China North) IP 139.217.2.219 connectivity check" 
	ChinaN2="$(telnet 139.217.2.219 443 2>&1)"	
	echo "Health and management services IP 139.217.2.219 443 Connectivity Results: $ChinaN2"
	echo "************************************"
	
echo "Health and management services (China North) IP 42.159.198.178 connectivity check" 
	ChinaN3="$(telnet 42.159.198.178 443 2>&1)"	
	echo "Health and management services IP 42.159.198.178 443 Connectivity Results: $ChinaN3"
	echo "************************************"
	
echo "Health and management services (China North) IP 42.159.234.157 connectivity check" 
	ChinaN4="$(telnet 42.159.234.157 443 2>&1)"	
	echo "Health and management services IP 42.159.234.157 443 Connectivity Results: $ChinaN4"
	echo "************************************"
	
#Validate HDInsight Management IPs China East:
echo "Health and management services (China East) IP 42.159.198.178 connectivity check" 
	ChinaE1="$(telnet 42.159.198.178 443 2>&1)"	
	echo "Health and management services IP 42.159.198.178 443 Connectivity Results: $ChinaE1"
	echo "************************************"
	
echo "Health and management services (China East) IP 42.159.234.157 connectivity check" 
	ChinaE2="$(telnet 42.159.234.157 443 2>&1)"	
	echo "Health and management services IP 42.159.234.157 443 Connectivity Results: $ChinaE2"
	echo "************************************"
	
echo "Health and management services (China East) IP 42.159.96.170 connectivity check" 
	ChinaE3="$(telnet 42.159.96.170 443 2>&1)"	
	echo "Health and management services IP 42.159.96.170 443 Connectivity Results: $ChinaE3"
	echo "************************************"
	
echo "Health and management services (China East) IP 139.217.2.219 connectivity check" 
	ChinaE4="$(telnet 139.217.2.219 443 2>&1)"	
	echo "Health and management services IP 139.217.2.219 443 Connectivity Results: $ChinaE4"
	echo "************************************"
	
#Validate HDInsight Management IPs China North 2:
echo "Health and management services (China North 2) IP 40.73.37.141 connectivity check" 
	ChinaNo21="$(telnet 40.73.37.141 443 2>&1)"	
	echo "Health and management services IP 40.73.37.141 443 Connectivity Results: $ChinaNo21"
	echo "************************************"
	
echo "Health and management services (China North 2) IP 40.73.38.172 connectivity check" 
	ChinaNo22="$(telnet 40.73.38.172 443 2>&1)"	
	echo "Health and management services IP 40.73.38.172 443 Connectivity Results: $ChinaNo22"
	echo "************************************"
	
#Validate HDInsight Management IPs China East 2:
echo "Health and management services (China East 2) IP 139.217.227.106 connectivity check" 
	ChinaEa21="$(telnet 139.217.227.106 443 2>&1)"	
	echo "Health and management services IP 139.217.227.106 443 Connectivity Results: $ChinaEa21"
	echo "************************************"
	
echo "Health and management services (China East 2) IP 139.217.228.187 connectivity check" 
	ChinaEa22="$(telnet 139.217.228.187 443 2>&1)"	
	echo "Health and management services IP 139.217.228.187 443 Connectivity Results: $ChinaEa22"
	echo "************************************"
	
#Validate HDInsight Management IPs North Europe:
echo "Health and management services (North Europe) IP 13.74.153.132 connectivity check" 
	NEurope1="$(telnet 13.74.153.132 443 2>&1)"	
	echo "Health and management services IP 13.74.153.132 443 Connectivity Results: $NEurope1"
	echo "************************************"
	
echo "Health and management services (North Europe) IP 52.164.210.96 connectivity check" 
	NEurope2="$(telnet 52.164.210.96 443 2>&1)"	
	echo "Health and management services IP 52.164.210.96 443 Connectivity Results: $NEurope2"
	echo "************************************"
	
#Validate HDInsight Management IPs West Europe:
echo "Health and management services (West Europe) IP 52.166.243.90 connectivity check" 
	WEurope1="$(telnet 52.166.243.90 443 2>&1)"	
	echo "Health and management services IP 52.166.243.90 443 Connectivity Results: $WEurope1"
	echo "************************************"
	
echo "Health and management services (West Europe) IP 52.174.36.244 connectivity check" 
	WEurope2="$(telnet 52.174.36.244 443 2>&1)"	
	echo "Health and management services IP 52.174.36.244 443 Connectivity Results: $WEurope2"
	echo "************************************"
	
#Validate HDInsight Management IPs France Central:
echo "Health and management services (France Central) IP 20.188.39.64 connectivity check" 
	FranceCen1="$(telnet 20.188.39.64 443 2>&1)"	
	echo "Health and management services IP 20.188.39.64 443 Connectivity Results: $FranceCen1"
	echo "************************************"
	
echo "Health and management services (France Central) IP 40.89.157.135 connectivity check" 
	FranceCen2="$(telnet 40.89.157.135 443 2>&1)"	
	echo "Health and management services IP 40.89.157.135 443 Connectivity Results: $FranceCen2"
	echo "************************************"
	
#Validate HDInsight Management IPs Germany Central:
echo "Health and management services (Germany Central) IP 51.4.146.68 connectivity check" 
	GerCen1="$(telnet 51.4.146.68 443 2>&1)"	
	echo "Health and management services IP 51.4.146.68 443 Connectivity Results: $GerCen1"
	echo "************************************"
	
echo "Health and management services (Germany Central) IP 51.4.146.80 connectivity check" 
	GerCen2="$(telnet 51.4.146.80 443 2>&1)"	
	echo "Health and management services IP 51.4.146.80 443 Connectivity Results: $GerCen2"
	echo "************************************"
	
#Validate HDInsight Management IPs Germany Northeast:
echo "Health and management services (Germany Northeast) IP 51.5.150.132 connectivity check" 
	GerNE1="$(telnet 51.5.150.132 443 2>&1)"	
	echo "Health and management services IP 51.5.150.132 443 Connectivity Results: $GerNE1"
	echo "************************************"
	
echo "Health and management services (Germany Northeast) IP 51.5.144.101 connectivity check" 
	GerNE2="$(telnet 51.5.144.101 443 2>&1)"	
	echo "Health and management services IP 51.5.144.101 443 Connectivity Results: $GerNE2"
	echo "************************************"
	
#Validate HDInsight Management IPs Central India:
echo "Health and management services (Central India) IP 52.172.153.209 connectivity check" 
	CenIndia1="$(telnet 52.172.153.209 443 2>&1)"	
	echo "Health and management services IP 52.172.153.209 443 Connectivity Results: $CenIndia1"
	echo "************************************"
	
echo "Health and management services (Central India) IP 52.172.152.49 connectivity check" 
	CenIndia2="$(telnet 52.172.152.49 443 2>&1)"	
	echo "Health and management services IP 52.172.152.49 443 Connectivity Results: $CenIndia2"
	echo "************************************"
	
#Validate HDInsight Management IPs South India:
echo "Health and management services (South India) IP 104.211.223.67 connectivity check" 
	SIndia1="$(telnet 104.211.223.67 443 2>&1)"	
	echo "Health and management services IP 104.211.223.67 443 Connectivity Results: $SIndia1"
	echo "************************************"
	
echo "Health and management services (South India) IP 104.211.216.210 connectivity check" 
	SIndia2="$(telnet 104.211.216.210 443 2>&1)"	
	echo "Health and management services IP 104.211.216.210 443 Connectivity Results: $SIndia2"
	echo "************************************"
	
#Validate HDInsight Management IPs Japan East:
echo "Health and management services (Japan East) IP 13.78.125.90 connectivity check" 
	JapanE1="$(telnet 13.78.125.90 443 2>&1)"	
	echo "Health and management services IP 13.78.125.90 443 Connectivity Results: $JapanE1"
	echo "************************************"
	
echo "Health and management services (Japan East) IP 13.78.89.60 connectivity check" 
	JapanE2="$(telnet 13.78.89.60 443 2>&1)"	
	echo "Health and management services IP 113.78.89.60 443 Connectivity Results: $JapanE2"
	echo "************************************"
	
#Validate HDInsight Management IPs Japan West:
echo "Health and management services (Japan West) IP 40.74.125.69 connectivity check" 
	JapanW1="$(telnet 40.74.125.69 443 2>&1)"	
	echo "Health and management services IP 40.74.125.69 443 Connectivity Results: $JapanW1"
	echo "************************************"
	
echo "Health and management services (Japan West) IP 138.91.29.150 connectivity check" 
	JapanW2="$(telnet 138.91.29.150 443 2>&1)"	
	echo "Health and management services IP 138.91.29.150 443 Connectivity Results: $JapanW2"
	echo "************************************"
	
#Validate HDInsight Management IPs Korea Central:
echo "Health and management services (Korea Central) IP 52.231.39.142 connectivity check" 
	KoreaC1="$(telnet 52.231.39.142 443 2>&1)"	
	echo "Health and management services IP 52.231.39.142 443 Connectivity Results: $KoreaC1"
	echo "************************************"
	
echo "Health and management services (Korea Central) IP 52.231.36.209 connectivity check" 
	KoreaC2="$(telnet 52.231.36.209 443 2>&1)"	
	echo "Health and management services IP 52.231.36.209 443 Connectivity Results: $KoreaC2"
	echo "************************************"
	
#Validate HDInsight Management IPs Korea South:
echo "Health and management services (Korea South) IP 52.231.203.16 connectivity check" 
	KoreaS1="$(telnet 52.231.203.16 443 2>&1)"	
	echo "Health and management services IP 52.231.203.16 443 Connectivity Results: $KoreaS1"
	echo "************************************"
	
echo "Health and management services (Korea South) IP 52.231.205.214 connectivity check" 
	KoreaS2="$(telnet 52.231.205.214 443 2>&1)"	
	echo "Health and management services IP 52.231.205.214 443 Connectivity Results: $KoreaS2"
	echo "************************************"
	
#Validate HDInsight Management IPs UK West:
echo "Health and management services (UK West) IP 51.141.13.110 connectivity check" 
	UKWest1="$(telnet 51.141.13.110 443 2>&1)"	
	echo "Health and management services IP 51.141.13.110 443 Connectivity Results: $UKWest1"
	echo "************************************"
	
echo "Health and management services (UK West) IP 51.141.7.20 connectivity check" 
	UKWest2="$(telnet 51.141.7.20 443 2>&1)"	
	echo "Health and management services IP 51.141.7.20 443 Connectivity Results: $UKWest2"
	echo "************************************"
	
#Validate HDInsight Management IPs UK South:
echo "Health and management services (UK South) IP 51.140.47.39 connectivity check" 
	UKSouth1="$(telnet 51.140.47.39 443 2>&1)"	
	echo "Health and management services IP 51.140.47.39 443 Connectivity Results: $UKSouth1"
	echo "************************************"
	
echo "Health and management services (UK South) IP 51.140.52.16 connectivity check" 
	UKSouth2="$(telnet 51.140.52.16 443 2>&1)"	
	echo "Health and management services IP 51.140.52.16 443 Connectivity Results: $UKSouth2"
	echo "************************************"

#Validate HDInsight Management IPs Central US:
echo "Health and management services (Central US) IP 13.89.171.122 connectivity check" 
	CentralUS1="$(telnet 13.89.171.122 443 2>&1)"	
	echo "Health and management services IP 13.89.171.122 443 Connectivity Results: $CentralUS1"
	echo "************************************"
	
echo "Health and management services (Central US) IP 13.89.171.124 connectivity check" 
	CentralUS2="$(telnet 13.89.171.124 443 2>&1)"	
	echo "Health and management services IP 13.89.171.124 443 Connectivity Results: $CentralUS2"
	echo "************************************"
	
#Validate HDInsight Management IPs East US:
echo "Health and management services (East US) IP 13.82.225.233 connectivity check" 
	EastUS1="$(telnet 13.82.225.233 443 2>&1)"	
	echo "Health and management services IP 13.82.225.233 443 Connectivity Results: $EastUS1"
	echo "************************************"
	
echo "Health and management services (East US) IP 40.71.175.99 connectivity check" 
	EastUS2="$(telnet 40.71.175.99 443 2>&1)"	
	echo "Health and management services IP 40.71.175.99 443 Connectivity Results: $EastUS2"
	echo "************************************"
	
#Validate HDInsight Management IPs East US2:
#Need to explode the IP ranges: 20.44.16.8/29, 20.49.102.48/29

#Validate HDInsight Management IPs North Central US:
echo "Health and management services (North Central US) IP 157.56.8.38 connectivity check" 
	NCenUS1="$(telnet 157.56.8.38 443 2>&1)"	
	echo "Health and management services IP 157.56.8.38 443 Connectivity Results: $NCenUS1"
	echo "************************************"
	
echo "Health and management services (North Central US) IP 157.55.213.99 connectivity check" 
	NCenUS2="$(telnet 157.55.213.99 443 2>&1)"	
	echo "Health and management services IP 157.55.213.99 443 Connectivity Results: $NCenUS2"
	echo "************************************"
