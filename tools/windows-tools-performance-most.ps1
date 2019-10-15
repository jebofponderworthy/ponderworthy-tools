
<#PSScriptInfo

.VERSION 1.2

.GUID e22f8597-0c05-4a6b-b361-60c5e93434a1

.AUTHOR Jonathan E. Brickman

.COMPANYNAME Ponderworthy Music

.COPYRIGHT (c) 2018 Jonathan E. Brickman

.TAGS 

.LICENSEURI https://opensource.org/licenses/BSD-3-Clause

.PROJECTURI https://github.com/jebofponderworthy/windows-tools

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES
windows-tools-performance-most
Retrieves, installs, and runs all clean/optimize/performance items of the windows-tools project,
including all but TOSC (Turn Off Share Caching).  These do many different things to clean up and 
improve performance and reliability of any Microsoft-supported desktop or server Windows system.

#> 





<# 

.DESCRIPTION 
Windows-tools-performance-most - Retrieves, installs, and runs all clean/optimize/performance items of the windows-tools project, including all but TOSC (Turn Off Share Caching).

#> 

Param()


#######################################################################
# windows-tools-performance-most                                      #
#######################################################################

#
# by Jonathan E. Brickman
#
# Retrieves, installs, and runs most clean/optimize/performance items
# of the windows-tools project, 
# including all but TOSC (Turn Off Share Caching).
#
# Copyright 2018 Jonathan E. Brickman
# https://notes.ponderworthy.com/
# This script is licensed under the 3-Clause BSD License
# https://opensource.org/licenses/BSD-3-Clause
# and is reprised at the end of this file
#

""
"windows-tools-all-cleaners"
""

# Self-elevate if not already elevated.
if (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    {
    "Running elevated; good."
    ""
    }
else {
    "Not running as elevated.  Starting elevated shell."
    Start-Process powershell -WorkingDirectory $PSScriptRoot -Verb runAs -ArgumentList "-noprofile -noexit -file $PSCommandPath"
    return "Done. This one will now exit."
    ""
}

$reportStatus = ''
$currentOp = ''
function ShowProgress {
	param( [string]$reportStatus, [string]$currentOp )

    Write-Progress -Activity "windows-tools-all-cleaners" -Status $reportStatus -PercentComplete -1 -CurrentOperation $currentOp
    }

if ($PSVersionTable.PSVersion.Major -lt 6) {
	# Only do this if PowerShell version less than 6
	ShowProgress("Preparing Powershell environment:","Installing NuGet Package Provider (for VcRedist)...")
	Install-PackageProvider -Name NuGet -Force | Out-Null
	}
ShowProgress("Preparing Powershell environment:","Installing NuGet ...")
Install-Module -Name NuGet -SkipPublisherCheck -Force
ShowProgress("Preparing Powershell environment:","Importing NuGet ...")
Import-Module -Name NuGet

ShowProgress("Preparing for run:","Installing RunDevNodeClean ...")
Save-Script -Name RunDevNodeClean -Path . -Force
ShowProgress("Running:","RunDevNodeClean ...")
.\RunDevNodeClean
ShowProgress("Cleaning up ...")
Remove-Item -Path .\RunDevNodeClean.ps1 -Force

ShowProgress("Preparing for run:","Installing TweakNTFS ...")
Save-Script -Name TweakNTFS -Path . -Force
ShowProgress("Running:","TweakNTFS ...")
.\TweakNTFS
ShowProgress("Cleaning up ...")
Remove-Item -Path .\TweakNTFS.ps1 -Force

ShowProgress("Preparing for run:","Installing OWTAS ...")
Save-Script -Name OWTAS -Path . -Force
ShowProgress("Running:","OWTAS ...")
.\OWTAS
ShowProgress("Cleaning up ...")
Remove-Item -Path .\OWTAS.ps1 -Force

ShowProgress("Preparing for run:","Installing OVSS ...")
Save-Script -Name OVSS -Path . -Force
ShowProgress("Running:","OVSS ...")
.\OVSS
ShowProgress("Cleaning up ...")
Remove-Item -Path .\OVSS.ps1 -Force

ShowProgress("Preparing for run:","Installing CATE ...")
Save-Script -Name CATE -Path . -Force
ShowProgress("Running:","CATE ...")
.\CATE
ShowProgress("Cleaning up ...")
Remove-Item -Path .\CATE.ps1 -Force

ShowProgress("Done!","")

# The 3-Clause BSD License

# SPDX short identifier: BSD-3-Clause

# Note: This license has also been called
# the AYA>A>??sA??.??oNew BSD LicenseAYA>A>??sA??,A? or AYA>A>??sA??.??oModified BSD LicenseAYA>A>??sA??,A?.
# See also the 2-clause BSD License.

# Copyright 2017 Jonathan E. Brickman

# Redistribution and use in source and binary
# forms, with or without modification, are
# permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the
# above copyright notice, this list of conditions and
# the following disclaimer.

# 2. Redistributions in binary form must reproduce the
# above copyright notice, this list of conditions and
# the following disclaimer in the documentation and/or
# other materials provided with the distribution.

# 3. Neither the name of the copyright holder nor the
# names of its contributors may be used to endorse or
# promote products derived from this software without
# specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
# CONTRIBUTORS AYA>A>??sA??.??oAS ISAYA>A>??sA??,A? AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
# GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

