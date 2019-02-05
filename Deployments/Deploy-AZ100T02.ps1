$uri = "https://raw.githubusercontent.com/GKLabContent/AZ100Practices/master/Deployments/AZ100T02.2.json"
$rg = "AZ100T02"
$location = "EastUS"
Login-AzureRmAccount

$rgObject = Get-AzureRmResourceGroup -Name $rg -ErrorAction SilentlyContinue

if ($rgObject -eq $null) {
    New-AzureRmResourceGroup -Name $rg -Location $location
}

New-AzureRmResourceGroupDeployment -Name "Setup" -ResourceGroupName $rg -TemplateUri $uri -Mode Incremental -Force -Verbose
