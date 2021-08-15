$regPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'

# 清除代理
function Clear-Proxy
{
    Set-ItemProperty -Path $regPath -Name ProxyEnable -Value 0
    Set-ItemProperty -Path $regPath -Name ProxyServer -Value ''
    Set-ItemProperty -Path $regPath -Name ProxyOverride -Value ''

    [Environment]::SetEnvironmentVariable('http_proxy', $null, 'User')
    [Environment]::SetEnvironmentVariable('https_proxy', $null, 'User')
}

# 设置代理
function Set-Proxy
{
    $proxy = 'http://127.0.0.1:1081'

    Set-ItemProperty -Path $regPath -Name ProxyEnable -Value 1
    Set-ItemProperty -Path $regPath -Name ProxyServer -Value $proxy
    Set-ItemProperty -Path $regPath -Name ProxyOverride -Value '<local>'

    [Environment]::SetEnvironmentVariable('http_proxy', $proxy, 'User')
    [Environment]::SetEnvironmentVariable('https_proxy', $proxy, 'User')
}