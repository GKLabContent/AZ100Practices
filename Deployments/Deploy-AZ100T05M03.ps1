$rg = "AZ100T04M01NICS"
$location = "EastUS"
$templateURI = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/301-create-ad-forest-with-subdomain/azuredeploy.json"
Login-AzureRmAccount

$rgObject = Get-AzureRmResourceGroup -Name $rg -ErrorAction SilentlyContinue

if($rgObject -eq $null) {
    New-AzureRmResourceGroup -Name $rg -Location $location
}

New-AzureRmResourceGroupDeployment -Name "Setup" -ResourceGroupName $rg -TemplateUri $templateURI -Mode Incremental -Force -Verbose
