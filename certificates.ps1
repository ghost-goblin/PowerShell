$mypwd = ConvertTo-SecureString "p@ssword" -asplaintext -force
$certpath = "\\path\to\share\certificate.pfx"
$CIFAthumbprint = "####" 

$Thumbprint = (Get-ChildItem -Path Cert:\CurrentUser\My| Where-Object {$_.Thumbprint -match $CIFAthumbprint}).Thumbprint;
### Write-Host -Object "My thumbprint is: $Thumbprint"
if ($Thumbprint -eq $null ) { Import-PfxCertificate -FilePath $certpath -CertStoreLocation Cert:\CurrentUser\My -Password $mypwd
} else { exit } sleep 10
