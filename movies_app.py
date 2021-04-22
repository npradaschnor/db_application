#Galway Mayo Institute of Technology
#Computer Science | Data Analytics
#Applied Database Module | Lecturer: Gerard Harrison
# G00364704 Noa P Prada Schnor

###################################################################################################################################################

#Import the file containing the functions 

import moviesDB_appDB


def main():

  ###################################################################################################################################################

  #Input messages

  Choice = "Choice: "
  YOBStr = "Year of Birth: " #this is useful in case you need to change it to another language, you do not need to change too much the code, but only a few variables like this
  GenderStr = "Gender (Male/Female): "
  IDNum = "ID: "
  LanguageStr = "Enter Subtitle Language: "
  CountryIDNum = "ID: "
  CountryStr = "Name: "
  SubtitlesLanguage = 'Subtitles language (-1 to end): '
  KeywordSt = 'Keyword (-1 to end): '

###################################################################################################################################################
#Show the menu

  display_menu() #show menu of options

  while True:

    try:

      choice = choice_input(Choice)

  ########################################################################

      if (choice == '1'): #view films

        try:
          moviesDB_appDB.films_header() #header
          moviesDB_appDB.get_film() #show the list of films (in alphabetical order) and the actors who starred in the film in group of 5. If the user presses 'q' it stops showing the list, if the user presses any key it keeps showing the list in group of 5
          display_menu()

        except Exception as e:
          print("***ERROR***:" , e)
        
  #######################################################################

      elif (choice == '2'):

        try:
          moviesDB_appDB.actor_header() #header
          actorYOB = get_inputNumber(YOBStr) #input: year of birth
          actorGender = get_inputNone(GenderStr) #input: gender (Female, Male or if none is typed, will be both)
          moviesDB_appDB.actor_header() #result header
          moviesDB_appDB.get_actor(actorYOB,actorGender) #get the name,month that were born and gender of actors
          display_menu() #show the menu after the results are displayed

        except Exception as e:
          print("***ERROR***:", e)

  #######################################################################

      elif (choice == '3'):

        try:
          moviesDB_appDB.studios_header() #header
          moviesDB_appDB.print_studios()#get the list of ID and name of all studios
          display_menu() # after the list is displayed, then show the menu of options
          
        except Exception as e:
          print("***ERROR***:", e)

  #######################################################################

      elif (choice == '4'): #add new country

        try:
          moviesDB_appDB.newCountry_header() #header
          countryID = get_inputNumber(CountryIDNum) #input: ID
          countryName = no_input(CountryStr) #input: Country's name
          moviesDB_appDB.add_country(str(countryID), countryName) #insert the ID and name into the DB
          display_menu #after the data is inserted, then show the menu

        except Exception as e:
          if e is ValueError:
            print("***ERROR***: Invalid ID. Try again.")
          else:
            print("***ERROR***: ", e)

#######################################################################
    
      elif (choice == '5'): #subtitles
      
        try:
          moviesDB_appDB.subtitles_header() #header
          language = no_input(LanguageStr) #input: language
          moviesDB_appDB.languageSubtitles_header(language) #result's header
          fID = moviesDB_appDB.film_subtitle(language) 
          moviesDB_appDB.get_filmSynopsis(fID)
          display_menu() #after the output is displaed, then show the menu of options

        except Exception as e:
          print("***ERROR***:", e)

  #######################################################################

      elif (choice == '6'): #add new moviescript
        
        try:
          moviesDB_appDB.newMoviescript_header()
          movieID = get_inputNumber(IDNum)
          subTitle = moviesDB_appDB.create_array(SubtitlesLanguage)
          keyword = moviesDB_appDB.create_array(KeywordSt)
          moviesDB_appDB.add_moviescript(movieID,keyword,subTitle)
          display_menu()

        except Exception as e:
          if e is ValueError or e is TypeError:
            print("***ERROR***: Invalid ID. Try again.")
          else:
            print("Error: ", e)
      
      elif (choice == 'X' or 'x'):  # if the user choose X(upper of lowercase), then stop running the code
        moviesDB_appDB.close_connection()  # close MySQL connection
        break

    except Exception as e:
        print("***ERROR***: ", e)
###################################################################################################################################################

def display_menu(): #function that display the menu
  print(" ")
  print('Movies DB')
  print('---------')
  print('')
  print('MENU')
  print('====')
  print('1 - View Films')
  print('2 - View Actors by Year of Birth & Gender')
  print('3 - View Studios')
  print('4 - Add New Country')
  print('5 - View Movie with Subtitles')
  print('6 - Add New MovieScript')
  print('X - Exit application')
  print(' ')

###################################################################################################################################################
# Inputs

def get_inputNumber(g): #function that returns an integer input

  while True:
    
    try:

      x = int(input(g))
    
    except Exception as e:
      if e is ValueError or e is TypeError: #if user entered strings, not integer
        continue #keep asking for input
    
    else: #if an int is provided, then stop asking for input
        break
 
  return x


def get_inputString(g): #function that returns a string user input
  return input(g)


def get_inputNone(g): #function that returns 'None' if the user has not entered an input value and keep asking for a input if not valid
  
  while True:

    try:

      x = input(g)

      if x == '': #if no input is provided, then the input is considered as 'None'
        x = None
        return x 
      
      elif x == 'Female' or x == 'Male': 
        return x

      elif x != 'Female' or x != 'Male' or x != '':
        print("Invalid gender option. Try again.")
        continue
      #  continue #there are 3 options of input: no input, Female or Male. If the input entered by the user is none of the 3 possible options, then s/he will get a message that the input is invalid, and the app will keep asking for input.
    
    except Exception as e:
      print("***ERROR***: ", e)


def no_input(g): #function that keeps asking for input if the user has not entered one

  x = input(g)

  while x == '': #if no input is entered, then it keep asking for a input

    x = input(g)
  
  return x.capitalize()  # return the input with the first letter capitalized


def choice_input(g):

  c = ['1','2','3','4','5','6','x','X']
  i = input(g)

  while i not in c:
    i = input(g)

  return i
###################################################################################################################################################

if __name__ == "__main__":
  main()
