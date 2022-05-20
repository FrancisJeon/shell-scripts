write-host "종료시간을 입력해주세요. 예) 20220520 1500" -ForegroundColor Yellow
write-host "주의: 현재 시간보다 전 시간을 입력시 컴퓨터가 즉시 종료됩니다. 저장하지 않은 문서가 날아갈 수 있음" -ForegroundColor Red
$input=Read-host "입력값: "
$end = [Datetime]::ParseExact($input, 'yyyyMMdd HHmm', $null)
$endStr = $end.ToString("yyyy년 MM월 dd일 HH시 mm분")
while ($true)
{
clear
if ((Get-Date) -ge $end)
{
    Stop-Computer -ComputerName localhost -Force
return
}
else
{
    write-host "================================================================================================`n"
    write-host "`t`t종료 예정 시간 : $endStr" -ForegroundColor Red
    $remain = New-TimeSpan -Start (Get-Date) -End $end
    write-host "`t`t남은시간:" $remain.Hours"시간"$remain.Minutes"분"$remain.Seconds"초 (취소하려면 Ctrl+C를 눌러주세요)" -ForegroundColor Yellow
    write-host "`n================================================================================================"
}
Start-Sleep 1
}