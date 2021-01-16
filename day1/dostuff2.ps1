# read list with inputs
$collection = get-content 'day1input.txt'

foreach ($item in $collection) {
    $item = [int]$item
    foreach ($item2 in $collection) {
        $item2 = [int]$item2
        foreach ($item3 in $collection) {
            $item3 = [int]$item3
            if ($item + $item2 + $item3 -eq 2020)
            {
                $answer = $item * $item2 * $item3
                write-host $answer
            }    
        }
        
    }
}