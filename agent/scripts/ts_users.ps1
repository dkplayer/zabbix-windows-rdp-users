 function Get-TSSessions {
    param(
        $ComputerName = "localhost"
    )

    qwinsta /server:$ComputerName |
    #Parse output
    ForEach-Object {
        $_.Trim() -replace "\s+",","
    } |
    #Convert to objects
    ConvertFrom-Csv
}


#Get-TSSessions -ComputerName "localhost"
Get-TSSessions -ComputerName "localhost" | where -Property СЕАНС -Like "rdp-tcp#*" | select ПОЛЬЗОВАТЕЛЬ -ExpandProperty ПОЛЬЗОВАТЕЛЬ
Get-TSSessions -ComputerName "localhost" | where -Property SESSIONNAME -Like "rdp-tcp#*" | select USERNAME -ExpandProperty USERNAME 