$passinput = get-content 'day4input.txt' -Raw

$passports = @{}

$passecond = ($passinput -split '(?:\r?\n){2,}')
write-host "Total number of passports given =" $passecond.count "passports." 

for ($i = 0; $i -lt $passecond.Count; $i++) {
    $passports[$i] = $passecond[$i].split(' ').Replace(':', ' = ') | convertfrom-stringdata
}

$count = 0
for ($i = 0; $i -lt $passports.Count; $i++) {
    if ($passports[$i].iyr -and $passports[$i].byr -and $passports[$i].eyr -and $passports[$i].hgt -and $passports[$i].hcl -and $passports[$i].ecl -and $passports[$i].pid){
        write-output "Passport $i is Valid"
        $count ++
    }
}
$count