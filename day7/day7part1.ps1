$bags = get-content .\day7input.txt -Raw
# $bags = get-content .\day7example.txt -Raw

$baglines = $bags -split '(?:\r?\n)'
write-host $baglines.count " bag rules to follow."

#parse baglines for easy automation
$baglines = $baglines.replace("bags","bag").replace(" bag.","").replace(" bag contain "," = ").replace(" bag, ",",")

#make a hashtable for easy lookup
$bagcontent = @{}
foreach ($bagline in $baglines){
    $bagname = ($bagline -split " = " )[0]
    $bagvalue = ($bagline -split " = " )[1]
    $bagcontent[$bagname] = $bagvalue
}

function Check-Bag {
    param (
        [string]$bag
    )
    # stop unpacking if "shiny gold" or "no other"
    if (($bagcontent[$bag]).contains("no other")){
        #write-host "einde"
        return $false
    } elseif ($bagcontent[$bag].contains("shiny gold")) {
        #write-host "waarheid"
        return $true
    }
    else {
        ($bagcontent[$bag].split(",")).substring(2) | foreach-object {check-bag -bag $_}
    }
}

$goldbags = 0
foreach ($bagline in $baglines){
    $bagname = ($bagline -split " = ")[0]
    write-host "Checking '" $bagname "' right now."
    if ((Check-Bag -bag $bagname) -contains "waarheid"){
        $goldbags ++
        write-host "--- Bag " $bagname " can contain a shiny gold bag. ---"
    }
}
write-host "Total number of bags that can contain a shiny gold bag is " $goldbags