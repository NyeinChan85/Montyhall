#' @title
#'   Create a new Monty Hall Problem game.
#'
#' @description
#'   `create_game()` generates a new game that consists of two doors 
#'   with goats behind them, and one with a car.
#'
#' @details
#'   The game setup replicates the game on the TV show "Let's
#'   Make a Deal" where there are three doors for a contestant
#'   to choose from, one of which has a car behind it and two 
#'   have goats. The contestant selects a door, then the host
#'   opens a door to reveal a goat, and then the contestant is
#'   given an opportunity to stay with their original selection
#'   or switch to the other unopened door. There was a famous 
#'   debate about whether it was optimal to stay or switch when
#'   given the option to switch, so this simulation was created
#'   to test both strategies. 
#'
#' @param ... no arguments are used by the function.
#' 
#' @return The function returns a length 3 character vector
#'   indicating the positions of goats and the car.
#'
#' @examples
#'   create_game()
#'
#' @export
create_game <- function()
{
    a.game <- sample( x=c("goat","goat","car"), size=3, replace=F )
    return( a.game )
} 



#' @title
#'    The contestant makes their first selection.
#' @description
#'   'select_door()' creates a vector of doors numbered 1,2,3. 
#'    After the contestant selects the one of doors randomly, 
#'    the function reuturns the variable (a.pick).
#' @details
#'    This function creates a vector named(doors). The contestant
#'    selects a number and it creates a variable which is randomly 
#'    assigned from "doors". The selected door by the contestant
#'    which is between 1 and 3 is returned.
#' @param ... no arguments are used by the function.
#' @return The function returns a variable named 'a.pick'. 
#' @examples
#'     select_door()
#'     select_door()
#'     select_door()
#' @export
select_door <- function( ) 
{
  doors <- c(1,2,3) 
  a.pick <- sample( doors, size=1 )
  return( a.pick )  # number between 1 and 3
}



#' @title
#'     The host makes a selection. 
#' @description
#'    'open_goat_door' creates a vector of doors "doors".
#'     When selecting a door to open, ensure it is not "a.pick" 
#'     chosen by the contestant and does not conceal the "car."
#' @details
#'    The host is required to choose a door containing a goat that 
#'    hasn't been selected by the contestant, ensuring it's neither 
#'    the car "car" nor the door "a.pick" initially chosen by the 
#'    contestant. When the contestant initially picks the car, the  
#'    host can open either door, but if the contestant selects a goat, 
#'    the host's only option is determined.
#' @param ... two arguments (game and a.pick) are used.
#' @return  The function returns "opened.door" variable.
#' @examples
#'    this.game <- create_game()
#'    this.game
#'    my.initial.pick <- select_door()
#'    my.initial.pick
#'    open_goat_door( this.game, my.initial.pick )
#'    
#' @export
open_goat_door <- function( game, a.pick )
{
   doors <- c(1,2,3)
   # if contestant selected car,
   # randomly select one of two goats 
   if( game[ a.pick ] == "car" )
   { 
     goat.doors <- doors[ game != "car" ] 
     opened.door <- sample( goat.doors, size=1 )
   }
   if( game[ a.pick ] == "goat" )
   { 
     opened.door <- doors[ game != "car" & doors != a.pick ] 
   }
   return( opened.door ) # number between 1 and 3
}



#' @title
#'    The contestant receives an option to select a different door.
#' @description
#'    Change_door creates a vector of doors numbered 1, 2, and 3.
#'    Then, based on the contestant's choice to either stay with their 
#'    initial pick or switch, determine the final selection. 
#'    Finally, it returns the chosen door.
#' @details
#'     Once the host has revealed a remaining goat door, only two options remain for the contestant.
#'     Those two options are their initial pick and one more remaining door. At this point,
#'     the player must decide whether to stay with their initial choice or switch to the 
#'     remaining unopened door. 
#' @param ... three arguments ( stay which is assinged to T, opened.door. a.pick) are used. 
#' @return The function returns 'final.pick' which is either 
#'    a.pick (initial selected door) or the remained door.
#' @examples
#'    this.game
#'    my.initial.pick
#'    my.final.pick <- change_door( stay=T, opened.door=opened.door, a.pick=my.initial.pick )
#'    determine_winner( final.pick=my.final.pick, game=this.game )
#'    my.final.pick <- change_door( stay=F, opened.door=opened.door, a.pick=my.initial.pick )
#'    determine_winner( final.pick=my.final.pick, game=this.game )
#' @export
change_door <- function( stay=T, opened.door, a.pick )
{
   doors <- c(1,2,3) 
   
   if( stay )
   {
     final.pick <- a.pick
   }
   if( ! stay )
   {
     final.pick <- doors[ doors != opened.door & doors != a.pick ] 
   }
  
   return( final.pick )  # number between 1 and 3
}



#' @title
#'    Determine the winner.
#' @description
#'    It etermines if the final pick is the "car" to declare a win, or if it's a "goat" to signify a loss, 
#'    then return the selection accordingly.
#' @details
#'    The function checks if the final pick corresponds to "car" to determine if the contestant has won; 
#'    if so, return the selection. Similarly, check if the final pick matches "goat" to ascertain if 
#'    the contestant has lost; then, return the selection.
#' @param ... two arguments (final.pick and game(a vector)) are used.
#' @return It returns the string "WIN" or "LOSE".
#' @examples
#'    this.game
#'    my.initial.pick
#'    my.final.pick <- change_door( stay=T, opened.door=opened.door, a.pick=my.initial.pick )
#'    determine_winner( final.pick=my.final.pick, game=this.game )
#'    my.final.pick <- change_door( stay=F, opened.door=opened.door, a.pick=my.initial.pick )
#'    determine_winner( final.pick=my.final.pick, game=this.game )

#' @export
determine_winner <- function( final.pick, game )
{
   if( game[ final.pick ] == "car" )
   {
      return( "WIN" )
   }
   if( game[ final.pick ] == "goat" )
   {
      return( "LOSE" )
   }
}





#' @title
#'    Play the Monty Hall game.
#' @description
#'    It enables the entire game to be played with one function call. 
#' @details
#'    This function puts together all game functions into a single function, 
#'    making it possible to play the entire game with just one function call.
#' @param ... no arguments are used by the function.
#' @return  It returns "game.results" which is "WON" or "LOSE".
#' @examples
#'    play_game()
#' @export
play_game <- function( )
{
  new.game <- create_game()
  first.pick <- select_door()
  opened.door <- open_goat_door( new.game, first.pick )

  final.pick.stay <- change_door( stay=T, opened.door, first.pick )
  final.pick.switch <- change_door( stay=F, opened.door, first.pick )

  outcome.stay <- determine_winner( final.pick.stay, new.game  )
  outcome.switch <- determine_winner( final.pick.switch, new.game )
  
  strategy <- c("stay","switch")
  outcome <- c(outcome.stay,outcome.switch)
  game.results <- data.frame( strategy, outcome,
                              stringsAsFactors=F )
  return( game.results )
}






#' @title
#'    Playing the game for n times (default=100)
#' @description
#'    This function is a simulation of playing the games multiple times
#' @details
#'    The function will execute the entire game, eeping track of the outcomes from each simulation,
#'    and then provide a "count"of how many times switching or sticking with the initial choice and 
#'    the results respectively.
#' @param ... The arugment (n) is used for simulation.
#' @return The function returns a dataframe of analysis of game results.
#' @examples
#'    play_games(200)
#' @export
play_n_games <- function( n=100 )
{
  
  library( dplyr )
  results.list <- list()   # collector
  loop.count <- 1

  for( i in 1:n )  # iterator
  {
    game.outcome <- play_game()
    results.list[[ loop.count ]] <- game.outcome 
    loop.count <- loop.count + 1
  }
  
  results.df <- dplyr::bind_rows( results.list )

  table( results.df ) %>% 
  prop.table( margin=1 ) %>%  # row proportions
  round( 2 ) %>% 
  print()
  
  return( results.df )

}
