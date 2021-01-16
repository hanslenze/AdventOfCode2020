$content = Get-Content 'day3input.txt'
# $content = Get-Content 'day3sample.txt'

$hstep = '1'
$vstep = '1'
$tree = '#'

$linelength = ($content | Select-Object -First 1).length

$hpos = 1
$output1 = @()

foreach ($item in $content) {
    $index = $hpos -1
    $output1 = $output1 + $item[$index]
    $hpos = $hpos + $hstep
    if ($hpos -gt $linelength) { 
        $hpos = $hpos - $linelength
    }
}

$hstep = '3'
$vstep = '1'
$hpos = 1
$output2 = @()

foreach ($item in $content) {
    $index = $hpos -1
    $output2 = $output2 + $item[$index]
    $hpos = $hpos + $hstep
    if ($hpos -gt $linelength) { 
        $hpos = $hpos - $linelength
    }
}

$hstep = '5'
$vstep = '1'
$hpos = 1
$output3 = @()

foreach ($item in $content) {
    $index = $hpos -1
    $output3 = $output3 + $item[$index]
    $hpos = $hpos + $hstep
    if ($hpos -gt $linelength) { 
        $hpos = $hpos - $linelength
    }
}

$hstep = '7'
$vstep = '1'
$hpos = 1
$output4 = @()

foreach ($item in $content) {
    $index = $hpos -1
    $output4 = $output4 + $item[$index]
    $hpos = $hpos + $hstep
    if ($hpos -gt $linelength) { 
        $hpos = $hpos - $linelength
    }
}

$hstep = '1'
$vstep = '2'
$hpos = 1
$output5 = @()

foreach ($item in $content) {
    if ($content.IndexOf($item) % 2 -eq 1){
        write-host "Skip regel " $content.indexof($item)
        continue
    }
    $index = $hpos -1
    $index
    $output5 = $output5 + $item[$index]
    $item[$index]
    $hpos = $hpos + $hstep
    if ($hpos -gt $linelength) { 
        $hpos = $hpos - $linelength
    }
}

$hittree = ($output1 -eq $tree).Count * ($output2 -eq $tree).Count * ($output3 -eq $tree).Count * ($output4 -eq $tree).Count * ($output5 -eq $tree).Count
"You hit " + $hittree + " trees in run"

55 * 79 * 85 * 205 * 87

4 % 2 -eq 0