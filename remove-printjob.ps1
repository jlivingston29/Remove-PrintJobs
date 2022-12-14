# Getting PC name in variable and opening in Session
$Computer = Read-host -Prompt 'Computername of PC?'
$PSession = New-PSSession $Computer

# Stopping Print Spooler, Delete print jobs, and restarting Printer Spooler
Invoke-Command -Session $PSession -ScriptBlock { stop-service spooler -force }
remove-item -path \\$Computer\c`$\Windows\System32\spool\PRINTERS\* -Force
Invoke-Command -Session $PSession -ScriptBlock { start-service spooler }
remove-pssession -session $PSession
