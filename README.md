# ponderworthy-tools
Some applets courtesy of Ponderworthy folks and friends.

## CATE: (C)lean (A)ll system and user profile (T)emp folders, (E)tcetera

For quite a while I had been curious as to why a simple method to do this was not available. CCLEANER and others do not reach into every user profile, and on many machines this is crucial, e.g., terminal servers. CATE was originated as a .VBS by the excellent David Barrett ( http://www.cedit.biz ) and has been rewritten thoroughly by yours truly (JEB of Ponderworthy). The current VBS is [here.](https://raw.githubusercontent.com/jebofponderworthy/ponderworthy-tools/master/CATE.vbs)  But [the most recent version](https://raw.githubusercontent.com/jebofponderworthy/ponderworthy-tools/master/CATE.ps1) is a PowerShell script, which adds removal of Ask Partner Network folders from user profiles, and a good bit of speed and clean running; future development will be in PowerShell.

One thing discovered along the way, is even in XP there was a user profile called the “System Profile” — XP had it in C:\WINDOWS\System32\config\systemprofile — and some malware dumps junk into it, and sometimes many gigs of unwanted files can be found in its temporary storage. CATE cleans all user profiles including those, as well as the Windows Error Reporting cache, and the .NET caches, and the system TEMP folders, and in recent versions, many Windows log files which are often found in many thousands of fragments.

The tool is designed for Windows 10 down through XP. As of 2017-10-10, it is self-elevating if run non-administratively.
