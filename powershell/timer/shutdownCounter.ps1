write-host "`n종료시간을 입력해주세요. 예) 20220520 1500" -ForegroundColor Yellow
write-host "`n경고: 현재 시간보다 과거 입력시 컴퓨터가 즉시 종료됩니다." -ForegroundColor Red
write-host "작업중인 문서는 꼭 저장하고 사용하세요`n" -ForegroundColor Red
$inp = Read-host "입력값: "
<# # 과거 입력 컨트롤
while ((get-date) -ge $end) {
    clear
    write-host "종료 시간은 과거 시점으로 입력할 수 없습니다."
    write-host ((get-date) - $end)
    $input=Read-host "입력값: "
}
$end = [Datetime]::ParseExact($input, 'yyyyMMdd HHmm', $null) 
#>

try {
    $end = [Datetime]::ParseExact($inp, 'yyyyMMdd HHmm', $null)
    $endStr = $end.ToString("yyyy년 MM월 dd일 HH시 mm분")
    while ($true) {
        Clear-Host
        if ((Get-Date) -ge $end) {
            Stop-Computer -ComputerName localhost -Force
            # write-host "컴퓨터를 종료합니다..." 
            return
        }
        else {
            write-host "================================================================================================`n"
            write-host "`t`t종료 시간: $endStr" -ForegroundColor Red
            $remain = New-TimeSpan -Start (Get-Date) -End $end
            write-host "`t`t남은 시간:" $remain.Days"일"$remain.Hours"시간"$remain.Minutes"분"$remain.Seconds"초 (취소하려면 Ctrl+C를 눌러주세요)" -ForegroundColor Yellow
            write-host "`n================================================================================================"
        }
        Start-Sleep 1
    }
}
catch {
    Write-Host "입력값이 정확하지 않습니다. powershell.bat을 다시 실행해주세요" -ForegroundColor Yellow
    # Pause # 이렇게 넣으면 보기 안좋아서 Start-Sleep을 사용할 예정
    Start-Sleep 3
}