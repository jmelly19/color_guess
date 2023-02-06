<#
Program Name : colors.ps1
Date: 2/1/2023
Author: Jared Meldrum
Corse: CIT361
I, Jared Meldrum, affirm that I wrote this script as original work completed by me.
#> 

$newgame = "true"


Write-host 'Welcome to  the color guessing game! Here are some extra commands for later;)'
Write-Host 'Press "h" for a hint or "q" to quit'

# Starts a new game and gives us a new random color
while($newgame -eq "true"){
$SystemColors=[System.Enum]::getvalues([System.ConsoleColor])
$color = $SystemColors|get-random
$hintcolor = [string]$color
#creates a blank variable for the round so the counter restarts.
[int]$round =''

do{$guess = Read-Host "Select one of the following colors: $systemcolors"
    if($guess -eq 'q'){
        break
    }
    #gives us a hint based off of the random color
    elseif($guess -eq 'h'){ 
        if($color -like 'dark*'){ 
            write-host $($hintcolor.Substring(0,5))
        }else{ 
            write-host $hintcolor[0]
        }
    }
    else{#allow the player to guess again and only count the round off an acutal guess
        write-host 'Please guess again'
        $round =$round + 1
    }
}while($guess -ne $color)
    if($guess -eq $color){
    #tells us we got the right color and how many rounds it took along with asking if we want to play again
    write-host "You got it my favorite color is" $color -ForegroundColor $color
    write-host "It took you $round turns to guess my favorite color"
    $play = Read-Host 'Would you like to play again (y/n)?'
#Determine if the user wants to play again and then restart or quit. 
        if($play -eq 'y'){
            $newgame="true"
        }
        else{
            $newgame ='False'
            Write-Host 'Thanks for playing!'
        }
    } else {
        Write-Host 'Thanks for playing!'
        break
    }
}