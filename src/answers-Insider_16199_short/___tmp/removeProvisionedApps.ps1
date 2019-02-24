
#Microsoft.Microsoft3DViewer_1.1702.21039.0_neutral_~_8wekyb3d8bbwe,
#Microsoft.MicrosoftSolitaireCollection_3.14.1181.0_neutral_~_8wekyb3d8bbwe,
#Microsoft.StorePurchaseApp_11703.1703.30024.0_neutral_~_8wekyb3d8bbwe,
#Microsoft.WindowsSoundRecorder_2017.405.2107.0_neutral_~_8wekyb3d8bbwe,
#Microsoft.WindowsStore_11701.1001.874.0_neutral_~_8wekyb3d8bbwe,

$apps = @( `
"Microsoft.3DBuilder_13.0.10349.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.BingWeather_4.18.56.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.DesktopAppInstaller_1.1.25002.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Getstarted_4.5.6.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Messaging_3.2.24002.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.MicrosoftOfficeHub_2017.311.255.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.MicrosoftStickyNotes_1.4.101.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.MSPaint_1.1702.28017.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Office.OneNote_2015.8121.10001.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.OneConnect_2.1703.754.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.People_2017.324.1823.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.SkypeApp_11.8.204.0_neutral_~_kzf8qxf38zg5c",
"Microsoft.Wallet_1.0.16328.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Windows.Photos_2016.511.9510.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsAlarms_2017.411.2307.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsCalculator_2017.403.1051.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsCamera_2017.214.20.0_neutral_~_8wekyb3d8bbwe",
"microsoft.windowscommunicationsapps_2015.8104.42387.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsFeedbackHub_1.1703.971.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsMaps_2017.317.1503.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxApp_2017.113.1250.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxGameOverlay_1.15.2003.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxIdentityProvider_2016.719.1035.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxSpeechToTextOverlay_1.14.2002.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.ZuneMusic_2019.16112.11621.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.ZuneVideo_2019.17022.10311.0_neutral_~_8wekyb3d8bbwe" )


Get-AppXProvisionedPackage -Online | ? {$apps -contains $_.PackageName} | remove-appxProvisionedPackage -online