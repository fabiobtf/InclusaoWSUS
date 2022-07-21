net stop wuauserv
net stop CryptSvc
net stop BITS
ren %systemroot%\softwaredistribution softwaredistribution.bak
ren %systemroot%\system32\catroot2 catroot2.bak
regsvr32 /s atl.dll
regsvr32 /s wucltui.dll
regsvr32 /s wups.dll
regsvr32 /s wuaueng.dll
regsvr32 /s wuapi.dll
regsvr32 /s msxml3.dll
regsvr32 /s mssip32.dll
regsvr32 /s initpki.dll
regsvr32 /s softpub.dll
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientIDValidation /f
rd /s /q "C:\WINDOWS\SoftwareDistribution"
net Start BITS
net start CryptSvc
net start wuauserv
wuauclt /resetauthorization /detectnow
PowerShell.exe (New-Object -ComObject Microsoft.Update.AutoUpdate).DetectNow()