$uri = "https://raw.githubusercontent.com/GKLabContent/AZ100Practices/master/Deployments/AZ100T04.json"
$rg = "AZ100T04M04"
$location = "EastUS"

$rgObject = Get-AzureRmResourceGroup -Name $rg -ErrorAction SilentlyContinue

if ($rgObject -eq $null) {
    New-AzureRmResourceGroup -Name $rg -Location $location
}

New-AzureRmResourceGroupDeployment -Name "Setup" -ResourceGroupName $rg -TemplateUri $uri -Mode Incremental -Force -Verbose
