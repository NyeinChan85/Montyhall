# Montyhall (R Package)

Montyhall, a game based on a scenario that was popularized by a television game show host named Monty Hall. It was written in R programming language.

## Description

The Monty Hall problem emulates a scenario inspired by the TV show "Let's Make a Deal" with the host named Monty Hall.
    It involves three doors, one hiding a car and the other two concealing goats. The contestant initially chooses one door, 
    after which the host reveals a goat behind one of the remaining doors. The contestant is then presented with an option: 
    stick with their original selection or switch to the unopened door. To explore and analyze both strategies, 
   this simulation was developed.

### Prerequisites

R Studio / R Console 

### How to download and Install
To install a R package, it is recommended to start with installing the devtools package using R console.

```
install.packages ("devtools") 
 ```
You can see that if it's successfully installed by this commend.

```
library(devtools)
```
Then start installing this R package from Github
```
install_github("NyeinChan85/montyhall") 
 ```
### How to Test/Play The Game

In R console, you can start playing games.
For example:
```
library(montyhall)
create_game()
```
For more information about the comprehensive game functions and how to test examples, please check the help files by those commands below:
```
help("create_game")
help("select_door")
help("open_goat_door")
help("change_door")
help("determine_winner")
help("play_game")
help("play_n_games")
```
