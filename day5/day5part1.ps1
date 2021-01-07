$passes = get-content day5input.txt
write-host "Number of boarding passes loaded = " $passes.count
​
#example $passes = "FBFBBFFRLR","BFFFBBFRRR","FFFBBBFRRR","BBFFBBFRLL"

$results = @()

for ($i = 0; $i -lt $passes.Count; $i++) {
    #$i = 0
    $seatrow = 0..127
    $r = 0..6
    foreach ($row in $r){
        if ($passes[$i][$row] -eq "F"){
            $seatrow = $seatrow[0..([int]($seatrow.count / 2)-1)]
        } else {$seatrow = $seatrow[([int]($seatrow.count / 2))..$seatrow[-1]]}
    write-host "For position $row, " $passes[$i][$row]" the outcome is $seatrow"
    }
    $seat = [int]0..7
    $s = [int]7..9
    foreach ($se in $s){
        if ($passes[$i][$se] -eq "L"){
            $seat = $seat[0..([int]($seat.count / 2)-1)]
        } else {$seat = $seat[([int]($seat.count / 2))..$seat[-1]]}
        write-host "For position $se, "$passes[$i][$se]" the outcome is $seat"
    }
    $result = $seatrow[0] * 8 + $seat[0]
    $results = $results + "$result"
}
write-host "Highest number found is " ($results | Sort-Object -Descending)[0]