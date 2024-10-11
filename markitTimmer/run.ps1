# Input bindings are passed in via param block.
param($Timer)

# Get the current universal time in the default string format
$currentUTCtime = (Get-Date).ToUniversalTime()

# The 'IsPastDue' porperty is 'true' when the current function invocation is later than scheduled.
if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

# Write an information log with the current time.
Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"

$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0"
# Adiciona os cookies...

$session.Cookies.Add((New-Object System.Net.Cookie("acceptedRequiredCookies", "COOKIEACCEPTED", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("acceptedRequiredCookies", "COOKIEACCEPTED", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("acceptedOptionalCookies", "COOKIEACCEPTED", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("X-Oracle-BMC-LBS-Route", "535bf7a6441f8325819e91e694d1efa780fa3ba9", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("Aplanguage", "0", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("clockDeviceToken8001", "/hvmmdjtCMNQzYclwDbwfWoXjZeQljjudvHKcjFufA==", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("authenticated", "true", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("loginOK", "true", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("FIN_COOKIE", "true", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("apdataCookieIsEnabled", "none", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("ts", "", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("SessionID", "x1i5nlcdgpfvtgjtd1g043w4", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("dynSID", "{`"success`":true,`"SessionID`":`"`",`"selectedEmployee`":1905121,`"selectedCandidate`":0,`"selectedPosition`":0,`"userName`":`"1905121`",`"userEmployee`":1905121,`"userId`":2992,`"languages`":{`"port`":true,`"eng`":true,`"esp`":true},`"initalURL`":`"index.html`",`"NTLM`":false,`"cosDiretorioPersWeb2`":`"`",`"selectedVacancy`":0,`"selectedEmployeeName`":`"GUILHERME ALVES RODRIGUES`",`"selectedCandidateName`":`"Nenhum`",`"selectedVacancyDescr`":`"Folha: Nenhuma - Cargo: Nenhum - Centro de Custo: Nenhum`",`"upperCase`":false,`"acceptTerm`":false,`"useTerm`":false,`"currentCountry`":1,`"idTipoDaltonismo`":0,`"totalFolhasCC`":0,`"acceptTermLGPD`":false,`"factorAuthenticationHwd`":0,`"factorAuthenticationMsg`":`"`",`"ModelPasswordReset`":0,`"HasQuestionNResponse`":false,`"tenantName`":`"Apdata`",`"isMultiTenant`":false,`"tenantFolderName`":`"Apdata`"}", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("__zjc6299", "5430715532", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("__z_a", "508168826223475905522347", "/", "cliente.apdata.com.br")))
$session.Cookies.Add((New-Object System.Net.Cookie("__ZEHIC3191", "1728650443", "/", "cliente.apdata.com.br")))

try {
    # Faz a requisição e captura a resposta
    $response = Invoke-WebRequest -UseBasicParsing -Uri "https://cliente.apdata.com.br/dicon/.net/index.ashx/SaveTimmingEvent" `
    -Method "POST" `
    -WebSession $session `
    -Headers @{
        "authority"="cliente.apdata.com.br"
        "method"="POST"
        "path"="/dicon/.net/index.ashx/SaveTimmingEvent"
        "scheme"="https"
        "accept"="*/*"
        "accept-encoding"="gzip, deflate, br, zstd"
        "accept-language"="en-US,en;q=0.9,pt;q=0.8"
        "cache-control"="no-cache"
        "origin"="https://cliente.apdata.com.br"
        "pragma"="no-cache"
        "priority"="u=1, i"
        "referer"="https://cliente.apdata.com.br/dicon/"
        "sec-ch-ua"="`"Microsoft Edge`";v=`"129`", `"Not=A?Brand`";v=`"8`", `"Chromium`";v=`"129`""
        "sec-ch-ua-mobile"="?0"
        "sec-ch-ua-platform"="`"Windows`""
        "sec-fetch-dest"="empty"
        "sec-fetch-mode"="cors"
        "sec-fetch-site"="same-origin"
        "x-requested-with"="XMLHttpRequest"
    } `
    -ContentType "application/x-www-form-urlencoded; charset=UTF-8" `
    -Body "deviceID=8001&eventType=1&userName=1905121&password=Chanceller#*7"
    
    # Salva a resposta em um arquivo de log
    Write-Host $response.Content

    # Exibe a resposta no terminal
    $response.Content
} catch {
    # Em caso de erro, loga o erro
    Write-Host "Ocorreu um erro durante a requisição: $_"
}
