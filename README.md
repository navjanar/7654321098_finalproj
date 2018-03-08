# Informatics Final Project
https://navjanar.shinyapps.io/7654321098_finalproj/

Naveen Janarthanan, Andy Tillotson, Camille Munro, Jose Santos

## Random Movie Generator

For our final project, we drew upon a dataset of movies in order to create a random movie generator to guide indecisive movie watchers to find a selection that they will enjoy.

**Guiding Questions:**

The central question we wanted to allow users to ask is simple: "What movie should I watch?" To answer that main question, we tried to provide the answers to these following questions with our app:

1. What are 10 randomly generated movies that I may be interested in based on language, genre, and rating?

2. What are the titles, release dates, plot summaries, and runtimes of those movies?

3. How successful were those movies, in terms of how much money was spent to produce them compared to how much revenue the films produced?

Below is a summary of the app we created to achieve these goals, as well as the dataset that we drew upon to create it.

# The Dataset

The dataset that we utilized for our project was a csv file titled "The Movies Dataset" that we obtained from Kaggle.com, which is a dataset containing metadata on over 45,000 movies and 26 million ratings from over 270,000 users.

## The Movies Dataset

This dataset was compiled by Rounak Banik by drawing upon data collected by GroupLens and TMBD. It consists of movies released on or before July 2017. Prominent data points of the dataset include cast, crew, plot keywords, budget, revenue, posters, release dates, languages, production companies, countries, TMDB vote counts and vote averages.

Banik's purpose behind assembling this dataset was to "narrate the history and the story of Cinema" and "build various types of Recommender Systems," which is what we have chosen to do with the data as well.

The dataset can be accessed by following the link below:

(https://www.kaggle.com/rounakbanik/the-movies-dataset)


# The App

When we set out to create this app, we wanted to allow users to ask one central question: "What movie should I watch?" In order to provide users a more specific answer this question, we allowed them to tailor results by filtering through the dataset based on the language, genre, and movie rating.

## Functions

Our app has several functions to assist users in finding a movie to watch.

* **Filters:** Located on the sidebar panel, there are dropdown menus allowing users to choose languages and genres, and a slider to allow users to select the range of ratings that the movies generated should fall within, on a scale from 1-10.

* **Results Table:** After the user selects their preferences with the sidebar options, a table of ten movies that meet their requirements is produced. The user can choose to sort these movies alphabetically based on title, or numerically based on release date or runtime. The table also displays a short summary of the plot of the movie to guide the user's decision.

* **Search Bar:** The app contains a search bar at the top right to allow the user to search through the movies generated for specific keywords in the titles or movie summaries to further specify their search.

* **Scatterplot:** Below the table, there is also a graph that compares the movies' budgets used versus revenues produced in an easily readable and accessible scatterplot. This gives users some further insight into how successful the individual movies were.

## Audience

Our target audience is broad, as this app could be useful for just about anyone who watches movies. However, there were a few more specific audiences that we targeted:

* Especially indecisive movie watchers- the nature of this app caters to the needs of indecisive movie watchers especially, as it randomly chooses a list of just ten movies so that the user doesn't have pages and pages of movies to scroll through before finally deciding on a film.

* Multilingual movie watchers or movie watchers around the world- by allowing users with a multitude of languages to choose between, our app is applicable to a larger audience.


# App Development

This app was created using the ShinyApps Platform. Data wrangling and manipulation was done using dplyr and basic R functions.
