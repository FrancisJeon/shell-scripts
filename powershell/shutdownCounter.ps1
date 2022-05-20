write-host "원하시는 종료시간을 입력해주세요. 예) 20220520 1500"
# write-host "다음 예시의 입력값은 모두 동일한 값입니다. 편한 포맷으로 사용하세요" -ForegroundColor Yellow
# write-host "원하는 종료시간 = 2022년 05월 20일 13시00분00초" -ForegroundColor Yellow
# write-host "`t예시1: 052022 1300" -ForegroundColor Yellow
# write-host "`t예시2: 052022 130000" -ForegroundColor Yellow
# write-host "`t예시3: 05 20 22 13 00 00" -ForegroundColor Yellow
# write-host "`t예시4: 0520 22 1300" -ForegroundColor Yellow
$start = (get-date)
$input=Read-host "종료 시간을 입력하세요"
$end = [Datetime]::ParseExact($input, 'yyyyMMdd hhmm', $null)

echo $start
echo $end

# while ($true)
# {
# clear
# if ((Get-Date) -ge $end)
# {
#     # Stop-Computer -ComputerName localhost -Force
#     write-host "종료합니다"
# return
# }
# else
# {
#     write-host "================================================================================================`n"
#     write-host "`t`t종료 예정 시간 : $end" -ForegroundColor Red
#     $remain = New-TimeSpan -Start (Get-Date) -End $end
#     write-host "`t`t남은시간:" $remain.Hours"시"$remain.Minutes"분"$remain.Seconds"초 (취소하려면 Ctrl+C를 눌러주세요)" -ForegroundColor Yellow
#     write-host "`n================================================================================================"
# }
# Start-Sleep 1
# }