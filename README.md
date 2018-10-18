# Inactive Mode Automation

When all of sudden you fell asleep while coding or watching a movie on linux laptop.
Have you ever bothered about your system, if in case it may drain your battery, or else misconfigured because of 
your sleeping activity. Or else when you don't predict the specific time to issue a shutdown command on time basis for CLI (Command Line Interface).


Here is the Linux script package to help you! It takes your prefered arguments such as `Mode` , `Inactivity period in minutes` and `Battery Percentage in Numerical`,
 based on these values of `Inactivity period in minutes` and `Battery Percentage in Numerical`mode of operation is done which ever [among bothe] satisfies earlier.

## what?
* This script can automatically perform the following activities after a period of `Physical Inactivity`(such as Keyboard and Mouse) or/and below the `Battery Percentage`.
        

    |Mode | About mode |
    |:-----|:----------|
    |haltmode | Halts the system. |
    |poweroffmode | Powers off the system.  |
    |rebootmode   |  Restarts the system.  |
    |suspendmode |Suspends the system.|
    |hibernatemode | Hibernates the system. |
    |hybrid-sleepmode | Hibernates and suspends the system.|
    
    
## Global Installation  : [Linux System wide access]
For Debian based systems such as Debian and Ubuntu
  
  
       git clone  #This repository
       cd inactivekm/
       run ./setup.sh #To install it throughout system wide.
       

Next,

**Usage** : 


     inactivity [mode] [Time_In_Minutes] [Battery_Percentage]    

 For more details,See for its [More detailed use and example](/README.md#more-detailed-use-) .
 
### Normal Installation : [Specific to current directory]  


           git clone  #This repository
           cd inactivekm/
           
   
 
Next,

**Usage** : 

 
         inactivity [mode] [Time_In_Minutes] [Battery_Percentage] 


Then within the same directory, See for its [More detailed use and example](/README.md#more-detailed-use-)   


## More Detailed Use :

Supported System Action (mode) : `haltmode`, `poweroffmode`, `rebootmode`, `suspendmode`, `hibernatemode`, `hybrid-sleepmode`.

Suppoted System Action in `(time)` in `minutes` : `numerical` 

Supported System Action in `(Battery)` Level : `1 to 100` values


**Example usage::** 

      
      suspendmode 60 30
** System `suspends` after `60 minutes` or when below `30 %` of battery level, or which ever comes earlier when Keyboard/mouse is inactivite.

