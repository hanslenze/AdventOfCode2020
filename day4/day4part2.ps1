$passinput = get-content 'day4input.txt' -Raw

$passports = @{}

$passecond = ($passinput -split '(?:\r?\n){2,}')
write-host "Total number of passports given =" $passecond.count "passports." 

for ($i = 0; $i -lt $passecond.Count; $i++) {
    $passports[$i] = $passecond[$i].split(' ').Replace(':', ' = ') | convertfrom-stringdata
}

$count = 0
for ($i = 0; $i -lt $passports.Count; $i++) {
    if (($passports[$i].iyr -ge 2010 -and $passports[$i].iyr -le 2020) -and `
        ($passports[$i].byr -ge 1920 -and $passports[$i].byr -le 2002) -and `
        ($passports[$i].eyr -ge 2020 -and $passports[$i].eyr -le 2030) -and `
        !($passports[$i].hgt -notmatch '^[0-9]{2,3}(in|cm)$') -and `
        !(($passports[$i].hgt.endswith('cm')) -and ([int]$passports[$i].hgt.split('cm')[0] -lt 150 -or [int]$passports[$i].hgt.split('cm')[0] -gt 193)) -and `
        !(($passports[$i].hgt.endswith('in')) -and ([int]$passports[$i].hgt.split('in')[0] -lt 59 -or [int]$passports[$i].hgt.split('in')[0] -gt 76)) -and `
        ($passports[$i].hcl -match '^#[0-9a-f]{6}$') -and `
        ($passports[$i].ecl -match 'amb|blu|brn|gry|grn|hzl|oth') -and `
        ($passports[$i].pid -match '^[0-9]{9}$')
    )
    {
        write-output "Passport $i is Valid"
        $count ++
    }
}

$count

<#
for ($i = 0; $i -lt $passthird.Count; $i++) {
    Write-host "Evaluating " $passthird[$i].hgt
    if ($passthird[$i].hgt -notmatch '^[0-9]{2,3}(in|cm)$'){
       Write-Host "Wrong patern"
        continue
    } if ($passthird[$i].hgt.endswith('cm')){
       Write-host "Evaluating CM"
        $hgt = $passthird[$i].hgt.split('cm')[0]
        if ([int]$hgt -lt 150 -or [int]$hgt -gt 193){
         Write-host "CM wrong"
            continue
        }
    } if ($passthird[$i].hgt.endswith('in')) {
        Write-host "Evaluating IN"
        $hgt = $passthird[$i].hgt.split('in')[0] 
        if ([int]$hgt -lt 59 -or [int]$hgt -gt 76){
         Write-host "IN wrong"
            continue
        }
    }
}

$count
#>
# 181 = te hoog
# 180 = te hoog