# Get the computer's hostname
$hostname = hostname

# Define the JSON structure with the updated "GenericUsername"
$jsonContent = @"
{
  "SlingshotEnabled": true,
  "WorkstationID": "",
  "Slingshot": {
    "Logging": {
      "Verbosity": 2,
      "DaysToKeepFile": 3
    },
    "Persistence": {},
    "Credentials": {
      "Domain": "Insert Domain Name",
      "GenericUsername": "$hostname",
      "EncryptedPassword": "Insert relevant key",
      "EncryptedPasswordIV": "Insert relevant key"
    },
    "PublishedApplications": {
      "TRN": {
        "VCmode": "Citrix",
        "StorebrowseURL": "Insert relevant URL",
        "ApplicationName": "HSPRD.Hyperdrive Training",
        "DisplayName": "Hyperdrive Training"
      },
      "PRD": {
        "VCmode": "Citrix",
        "StorebrowseURL": "Insert relevant URL",
        "ApplicationName": "HSPRD.Hyperdrive Community Connect",
        "DisplayName": "Hyperdrive Community Connect"

      }
    }
  }
}
"@

# Save the JSON content to SlingshotConfig.json
$jsonContent | Out-File -FilePath "C:\Program Files (x86)\Epic\Hyperdrive\Config\SlingshotConfig.json" -Encoding ASCII