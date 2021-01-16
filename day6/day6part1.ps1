$answersraw = get-content day6input.txt -Raw
#example $answersraw = get-content day6example.txt -Raw

$answers = $answersraw -split '(?:\r?\n){2,}'
write-host $answers.count" groups to process."

foreach ($answer in $answers) {
    $result = (($answer  -replace '\r*\n', '').tochararray() | Sort-Object -Unique).count
    $results += $result
}
$results