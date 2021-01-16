# get input
$content = Get-Content 'day3input.txt'
$tree = '#'

$hstep = '3'
$vstep = '1'

$linelength = ($content | Select-Object -First 1).length

$hpos = 1
$output = @()

foreach ($item in $content) {
    $index = $hpos -1
    $output = $output + $item[$index]
    $hpos = $hpos + $hstep
    if ($hpos -gt $linelength) { 
        $hpos = $hpos - $linelength
    }
}
$hittree = ($output -eq $tree).Count
$hittree