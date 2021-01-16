$answersraw = get-content day6input.txt -Raw
#example $answersraw = get-content day6example.txt -Raw

$answers = $answersraw -split '(?:\r?\n){2,}'
write-host $answers.count" groups to process."

$counters = $null
foreach ($answer in $answers) {
    # $answer = $answers[2]
    $counter = $null
    $lines  = $answer.split("`r")
    foreach ($line in $lines){
        foreach ($char in $line.tochararray()){
            if ((($lines.split("`r")).tochararray() -eq $char).count -eq $lines.count) {$counter ++}
        }
    }
    $counter = ($counter / $lines.count)
    $counters += $counter
}
Write-host "$counters is the answer"