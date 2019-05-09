﻿function Get-WinADDomainGroupsSpecialMembers {
    param(
        [Array] $DomainGroupsMembers
    )
    $DomainGroupsMembers | Where-Object { ($_.'Group SID').Length -eq 12 } | Select-Object * #-Exclude Group*, 'High Privileged Group'
}