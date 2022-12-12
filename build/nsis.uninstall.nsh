Section "Uninstall"
  # uninstall for all users
  setShellVarContext all

  # Delete (optionally) installed files
  {{range $}}Delete $INSTDIR\{{.}}
  {{end}}
  Delete $INSTDIR\uninstall.exe

  # Delete install directory
  rmDir $INSTDIR

  # Delete start menu launcher
  Delete "$SMPROGRAMS\${APPNAME}\${APPNAME}.lnk"
  Delete "$SMPROGRAMS\${APPNAME}\Attach.lnk"
  Delete "$SMPROGRAMS\${APPNAME}\Uninstall.lnk"
  rmDir "$SMPROGRAMS\${APPNAME}"

  # Firewall - remove rules if exists
  SimpleFC::AdvRemoveRule "Gdubx incoming peers (TCP:32609)"
  SimpleFC::AdvRemoveRule "Gdubx outgoing peers (TCP:32609)"
  SimpleFC::AdvRemoveRule "Gdubx UDP discovery (UDP:32609)"

  # Remove IPC endpoint (https://github.com/DUBXCOIN/EIPs/issues/147)
  ${un.EnvVarUpdate} $0 "ETHEREUM_SOCKET" "R" "HKLM" "\\.\pipe\gdubx.ipc"

  # Remove install directory from PATH
  Push "$INSTDIR"
  Call un.RemoveFromPath

  # Cleanup registry (deletes all sub keys)
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${GROUPNAME} ${APPNAME}"
SectionEnd
