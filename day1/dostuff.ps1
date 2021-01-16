# read list with inputs
$collection = get-content 'day1input.txt'

foreach ($item in $collection) {
    $item = [int]$item
    foreach ($item2 in $collection) {
        $item2 = [int]$item2
        if ($item + $item2 -eq 2020)
        {
            $answer = $item * $item2
            write-host $answer
        }
    }
}