# read the input
$i = get-content 'day2input.txt'

# question 1
$count = 0
foreach ($item in $i) {
   $parseditem = (-split ($item -split ':')) -split "-" 
   $hitcount = ($parseditem[3].ToCharArray() -eq $parseditem[2]).count
   if ($hitcount -gt ([int]$parseditem[0]-1)) {
    if ($hitcount -lt ([int]$parseditem[1]+1)){
        $count += 1
    }
   }
}
$count

#question 2
$count = 0
foreach ($item in $i) {
    $parseditem = (-split ($item -split ':')) -split "-" 
    $index1 = [int]$parseditem[0]-1
    $index2 = [int]$parseditem[1]-1
    if (($parseditem[3][$index1] -eq $parseditem[2]) -xor ($parseditem[3][$index2] -eq $parseditem[2])) {
            $count += 1
    }
}
$count

# single input for testing
$item =  "1-3 a: abcde"