$rg = "AZ100T04M01NICS"
$location = "EastUS"
$templateURI = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/301-create-ad-forest-with-subdomain/azuredeploy.json"

$rgObject = Get-AzureRmResourceGroup -Name $rg -ErrorAction SilentlyContinue

if($rgObject -eq $null) {
    New-AzureRmResourceGroup -Name $rg -Location $location
}
