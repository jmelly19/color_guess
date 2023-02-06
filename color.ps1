$yours=Read-host "What is your favorite color?"
$mine='blue'
if($yours -eq $mine){
    write-host "Our favorite colors are the same!"
}
else{
    "We don't have the same favorite color."
}