#
# Example script to perform Fortify SCA static analysis
#

$UploadToSSC = $False

# SSC URL from environment variable
$SSCUrl = $Env:SSC_URL
if ($sscurl) { $UploadToSSC = $True }

# SSC AnalysisUploadToken token from environment variable
$SSCAuthToken = $Env:SSC_ANALYSIS_UPLOAD_TOKEN

# SSC Application version id to upload results to from environment variable
# Can be retrieved using: fortifyclient listApplicationVersions -url $scurl -user [your-username] -password [your-password]
$SSCAppVersionId = $Env:SSC_APPLICATION_ID

# Check Source Analyzer is on the path
if ((Get-Command "sourceanalyzer.exe" -ErrorAction SilentlyContinue) -eq $null)
{
    Write-Error "Unable to find sourceanalyzer.exe in your PATH"
    Break
}

# Check Fortify Client is installed
if ((Get-Command "fortifyclient.bat" -ErrorAction SilentlyContinue) -eq $null)
{
    Write-Host "fortifyclient.bat is not in your PATH, will not upload to SSC"
}

# Clean Project and scan results from previous run
Write-Host ************************************************************
Write-Host Cleaning project and scan results from previous run...
Write-Host ************************************************************
& sourceanalyzer -Dcom.fortify.sca.ProjectRoot=.fortify -b iwa.node -clean

# Remove devDependecies from node_modules 
Write-Host ************************************************************
Write-Host Warning: removing 'node_modules' and installing production dependencies...
Write-Host ************************************************************
Remove-Item -LiteralPath "node_modules" -Force -Recurse
& npm install --only=prod

# Translate source files
Write-Host ************************************************************
Write-Host Translating source files...
Write-Host ************************************************************
& sourceanalyzer '-Dcom.fortify.sca.ProjectRoot=.fortify' '-Dcom.fortify.sca.EnableDOMModeling=true' -b iwa.node `
    "package.json" "server.js" "app/**/*" "node_modules/**/*" "Dockerfile*" "stack.yml" "docker-compose.yml"

# Scan the application
Write-Host ************************************************************
Write-Host Scanning source files...
Write-Host ************************************************************
& sourceanalyzer '-Dcom.fortify.sca.ProjectRoot=.fortify' '-Dcom.fortify.sca.EnableDOMModeling=true' -b iwa.node `
	-build-project "IWA.NodeJS" -build-version "v1.0" -build-label "SNAPSHOT" -scan -f iwa.node.fpr
# -filter etc\sca-filter.txt


# Generate a PDF Report
Write-Host ************************************************************
Write-Host Generating PDF report
Write-Host ************************************************************
& ReportGenerator '-Dcom.fortify.sca.ProjectRoot=.fortify' -user "Demo User" -format pdf -f iwa.node.pdf -source iwa.node.fpr

# Upload results to SSC
if ($UploadToSSC) {
    Write-Host ************************************************************
    Write-Host Uploading results to SSC
    Write-Host ************************************************************
	# & fortifyclient uploadFPR -file iwa.node.fpr -url $SSCUrl -authtoken $SSCAuthToken -applicationVersionID $SSCAppVersionId
}	
