function Get-WinADForestInfo {
    [CmdletBinding()]
    param(
        [PSCustomObject] $Forest,
        [Microsoft.ActiveDirectory.Management.ADRootDSE] $RootDSE
    )
    #$Time = Start-TimeLog
    #Write-Verbose 'Getting forest information - Forest Information'

    [ordered] @{
        'Name'                     = $Forest.Name
        'Root Domain'              = $Forest.RootDomain
        'Forest Distingushed Name' = $RootDSE.defaultNamingContext
        'Forest Functional Level'  = $Forest.ForestMode
        'Domains Count'            = ($Forest.Domains).Count
        'Sites Count'              = ($Forest.Sites).Count
        'Domains'                  = ($Forest.Domains) -join ", "
        'Sites'                    = ($Forest.Sites) -join ", "
    }

    #$EndTime = Stop-TimeLog -Time $Time -Option OneLiner
    #Write-Verbose "Getting forest information - Forest Information Time: $EndTime"
}