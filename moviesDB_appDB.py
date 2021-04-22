#Galway Mayo Institute of Technology
#Computer Science | Data Analytics
#Applied Database Module | Lecturer: Gerard Harrison
# G00364704 Noa P Prada Schnor

###################################################################################################################################################

#Import libraries/modules

import pymysql.cursors #connect to MySQL
import pymongo #connect to MongoDB
import keyboard #if user presses a key
import os #os.system('pause)
import copy
import movies_app

###################################################################################################################################################

# Connections - MySQL and MongoDB

connection = None
myClient = None

#######################################################################

# Connect to MySQL, moviesDB database

def connect(): #connection do moviesDB database in mysql
  global connection
  connection = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             db='moviesdb',
                             cursorclass=pymysql.cursors.DictCursor,
                             autocommit=True)

if (not connection):
  connect()
else:
  print("Database already connected.")

#######################################################################

# Connect to MongoDB, moviesScript database

def mongoConnect():
    global myClient
    global docs
    myClient = pymongo.MongoClient(host='localhost', port=27017)
    myClient.admin.command('ismaster')
    db = myClient.movieScriptDB
    docs = db.movieScripts

#######################################################################

# Check if it connected to DB. Connect if not already connected

def check_connection():
  if (not connection):
    connect()

def check_mongoConnection():
  if (not myClient):  # if not connected to MongoDB, then
    mongoConnect()  # connect to MongoDB


#######################################################################

#Close connections and cursor

def close_connection():
  connection.close()


def close_mongo():
  myClient.close()

###################################################################################################################################################

# Headers

#Choice 1
def films_header():
      print(" ")
      print("Films")
      print('-----')

#Choice 1
def print_quit():
  print("-- Quit (q) --")

#Choice 2
def actor_header():
  print(" ")
  print("Actors")
  print("------")

#Choice 3
def studios_header():
  print(" ")
  print("Studios")
  print("-------")

#Choice 4
def newCountry_header():
  print(" ")
  print("Add New Country")
  print("---------------")

#Choice 5
def subtitles_header():
  print(" ")
  print("Movies with Subtitles")
  print("---------------------")

#Choice 5 - output
def languageSubtitles_header(lang):
  print(" ")
  print("Movies with " + lang + " Subtitles")  # get the input named language
  print("---------------------")

#Choice 6
def newMoviescript_header():
  print(" ")
  print("Add New Movie Script")
  print("--------------------")

###################################################################################################################################################

# Functions fot each choice selected

# 1. Get film

def get_film():

  check_connection() #check if MySQL is connected.Connect, if not connected yet

  #query = get the name of the film, the actor's name and sort by film's name and then actor's name
  filmActor = "SELECT f.FilmName as Film, a.ActorName  as Actor from film as f LEFT JOIN filmcast as fc ON fc.CastFilmID = f.FilmID JOIN actor as a ON fc.CastActorID = a.ActorID ORDER BY Film, Actor;"

  try:

    with connection.cursor() as cursor:
      cursor.execute(filmActor) #execute the query
      
      loop = True
      while loop == True:

        rows = cursor.fetchmany(5) #output is 5 rows

        for row in rows: #for each row of the query's output
          print(row['Film'],' : ',row['Actor']) #print name of the film and the actor's name
        print_quit() #will print --quit(q)-- after the output

        if keyboard.read_key != 'q': #if any key (except 'q') is pressed
          os.system('pause > nul') #pause, msg suppressed
        if keyboard.is_pressed('q'): #if 'q' is pressed
          loop = False #then stop the while loop


  except Exception as e:
    print('***ERROR***: ', e)

  cursor.close()

#######################################################################

# 2. Get actor

def get_actor(yearDOB,actorGender):

  check_connection() #if not connected to MySQL, then connect

  actorInfo= "SELECT ActorName, monthname(ActorDOB) as aDOB, ActorGender from actor WHERE year(ActorDOB) = %s;" #get the info of all F and M actors

  try:
    with connection.cursor() as cursor:
      cursor.execute(actorInfo, (yearDOB)) #execute the query
      actors = cursor.fetchall()  # get the info of all actors
        
      for actor in actors:  

        if actorGender == None: #if the input of gender is None, then print the info of all actors
          print(actor['ActorName'] + ' | ' + actor['aDOB'] + ' | ' + actor['ActorGender'])

        else:
          if actor['ActorGender'] == actorGender: #if the gender was provided by the user, then print info from actors with the gender asked
            print(actor['ActorName'] + ' | '+ actor['aDOB'] + ' | ' + actor['ActorGender'])

  except Exception as e:
    print('***ERROR***: ', e)

  cursor.close()

#######################################################################

#3. Studios

global studiosDict
studiosDict = {}  # create empty dictionary


def get_studio(): #get all the studio ids and names just once, even if a field is updated in the db

  global studiosDict

  check_connection() #if not connected to MySQL, then connect


  if len(studiosDict) == 0: 

    getStudios = "SELECT StudioID, StudioName FROM studio ORDER BY StudioID;" #get the data from table studios

    keys = [] #will be populated with StudioID
    values = [] #will be populated with StudioName

    with connection.cursor() as cursor:
      cursor.execute(getStudios)
      res = cursor.fetchall() #get all the rows from the table studio

    for row in res: #for each row in the studio table
      keys.append(row['StudioID'])  # StudioID dictionary key
      values.append(row['StudioName']) #StudioName will be the values

    studiosDict = dict(zip(keys, values)) #create a dictionary
    
  return studiosDict

  #cursor.close()

originalDict = get_studio()
copyDict = copy.deepcopy(originalDict) #independent copy of originalDict. If the originalDict changes, the copy won't change

#######################################################################
def print_studios():#print the results of the get_studio()

  global copyDict #use the copy of originalDict.
    
  for key in copyDict:
    if key in range(1,41): #print the studios with key 1 to 40. Even if a new studio is inserted into de db, it will not show to user
      print(key,': ',copyDict[key]) #print each line without commas and brackets

print_studios()

#4. Add new country

def add_country(cID, cName):  # function that adds new country to MySQL db if it is not in db already

  check_connection() #if not connected to MySQL, then connect

  duplCountry = [] #create an empty list that will get the resultsf the query checkCountryInfo

  # query = get country ID, country name where country ID = to the ID entered by the user or the country name = to the country name entered by user
  checkCountryInfo = "SELECT CountryID, CountryName FROM country WHERE CountryID = %s or CountryName = %s;"

  # query to insert data into table country
  insCountry = "INSERT INTO country (CountryID, CountryName) VALUES (%s,%s);"

  while True:
    try:
      with connection.cursor() as cursor:

        #check if the ID or name do not exist in the table country

        cursor.execute(checkCountryInfo, (cID, cName)) #execute the query using the inputs provided by the user
        result = cursor.fetchall()

        for row in result:
          duplCountry.append(row) #populate the duplCountry array with results from the query

        if not duplCountry: #if there is no Country with the ID or name provided by the user
          cursor.execute(insCountry, (cID, cName)) #then insert the country
          count = cursor.rowcount #count how many rows were affected

          if count == 1: #if 1 row affected
              # print a msg confirming that they were added to db
            print("Country: " + cID + " , " + cName + " added to database")
            break

        else: #if the duplCountry is not empty, then print a msg stating that the data already exists in the db
          print("***ERROR***:  ID and/or name " + "(" + cID + " , " + cName + ")" + " already exists.")  # then return an #error msg
          break

    except Exception as e:
      print('***ERROR***: ', e)
      break

  cursor.close()

#######################################################################

# 5. Subtitle

def film_subtitle(lg): #get the IDs of films with subtitle in the language entered by user

  #empty list to be populated with film IDs that have subtitle in the language provided by user 
  subID = []
  #if not connected to MongoDB, then connect
  check_mongoConnection()

  try:
    #get all the documents from MongoDB 
    db = myClient.movieScriptsDB
    docs = db.movieScripts 

    #get all the docs with subtitle inputted by user
    res = docs.find({"subtitles":{"$exists":True, "$regex":"" + lg + ""}},{"_id": 1, "subtitles":1}) #var res stores only _id and subtitles.

    for r in res:
      r['_id'] = int(r['_id']) #convert ID to integer
      subID.append(r['_id']) #append it to subID
     
    return subID #list that will be used as parameter to get_filmsynopsis funtion

  except Exception as e:
    print("***ERROR***: ", e)

  myClient.close()

def get_filmSynopsis(fID):

  check_connection() #connect to MySQL if not already connected

  try:

    with connection.cursor() as cursor:

      #query = get the ID, name and the first 32 characters synopsis from table film
      filmSynopsis = "SELECT FilmID as ID, FilmName as Film, substr(FilmSynopsis, 1, 32) as Synopsis from film;"
      cursor.execute(filmSynopsis)
      synopsis = cursor.fetchall()

      for row in synopsis: 
        if row['ID'] in fID: #if ID is equal to ID in the list used as function parameter
          print(row['Film'],' : ', row['Synopsis']) #then print name and synopsis
  
  except Exception as e:
    print("***ERROR***: ", e)

  cursor.close()

#######################################################################

#6. Add new movieScript

def create_array(x):

  array = []

  try:

    while True:

      element = input(x)

      if element != '-1': #if -1 is entered it breaks the loop, otherwise the user can type an input and it will be added into the array
        array.append(element)

      else:
        break
    
    return array

  except Exception as e:
    print("***ERROR***: ", e)


def add_moviescript(a,b,c): #functions that adds new movieScript to (MongoDB) db

  #connect MongiDB and MMySQL if not already connected
  check_mongoConnection()
  check_connection()

  #dict with parameters provided
  nDoc = {"_id": a, "keywords": b, "subtitles":c}

  #empty list to be populated with
  duplM = []

  while True:
    try:
      with connection.cursor() as cursor:

        #check if the ID provided by user exists in table film
        filmID = "SELECT COUNT(FilmID) as result from film WHERE FilmID = %s" #count the rows returned 
        fID = nDoc.get('_id') #get the ID provided
        cursor.execute(filmID, fID) #get the number of rows from the table film with ID fID
        ft = cursor.fetchone()

        #if the ID exists, then check if there is already a moviescript for that film and append it to the empty list
        if ft['result'] == 1:
          moviesID = nDoc.get("_id")
          checkCol = docs.find({"_id": moviesID})
          
          for res in checkCol:
            duplM.append(res)

        #if the list is not populated, then isert the moviescript
          if not duplM:
            docs.insert_one(nDoc)

            #check if was sucessfully inserted
            if moviesID == docs.find({"_id": moviesID},{"_id":1}):
              print("MovieScript: ", moviesID," added to database") #print a msg confirming that it was added to mongodb
              break
          
          else: #if the list is populated, it means that there is a moviescript for that film and a new moviescript should not be added to db
            print('MovieScript: ', fID, ' already exists in database')
            break

        else:
          print("***ERROR***: Film with id: ",fID, "does not exist in moviesdb")
          break

        
    except Exception as e:
      print('***ERROR***: ', e)
  
  cursor.close()
  myClient.close()
