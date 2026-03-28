$results = @()

# TCP
$tcp = Get-NetTCPConnection
foreach ($conn in $tcp) {
    $direction = if ($conn.State -eq "Listen") { "Inbound" } else { "Outbound" }
    $ipVersion = if ($conn.LocalAddress -like "*:*") { "IPv6" } else { "IPv4" }

    $scope = if ($conn.RemoteAddress -match "^(10\.|192\.168\.|172\.)") {
        "Internal"
    } elseif ($conn.RemoteAddress -eq "0.0.0.0" -or $conn.RemoteAddress -eq "::") {
        "Internal"
    } else {
        "External"
    }

    $results += [PSCustomObject]@{
        direction = $direction
        ipVersion = $ipVersion
        protocol = "TCP"
        scope = $scope
        localPort = $conn.LocalPort
        remote = "$($conn.RemoteAddress):$($conn.RemotePort)"
    }
}

# UDP ✅ FIX
$udp = Get-NetUDPEndpoint
foreach ($conn in $udp) {
    $ipVersion = if ($conn.LocalAddress -like "*:*") { "IPv6" } else { "IPv4" }

    $results += [PSCustomObject]@{
        direction = "Inbound"
        ipVersion = $ipVersion
        protocol = "UDP"
        scope = "Internal"
        localPort = $conn.LocalPort
        remote = "0.0.0.0:*"
    }
}

# Send
$json = $results | ConvertTo-Json -Depth 3

Invoke-RestMethod -Uri "http://localhost:3000/api/ports" `
    -Method POST `
    -Body $json `
    -ContentType "application/json"