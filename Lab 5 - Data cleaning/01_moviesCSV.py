# 1. Create a CSV file called “Movies.csv” with details of 10 movies Movie Name, Language, Genre, Rating, Review.
# a. Read CSV file into a dataframe and find the movie with the highest rating.
# b. Write the details of all “Hindi movies into a file “HindiMovies.csv”.

import pandas as pd

data = {
    'Movie Name': ['Movie1', 'Movie2', 'Movie3', 'Movie4', 'Movie5', 'Movie6', 'Movie7', 'Movie8', 'Movie9', 'Movie10'],
    'Language': ['English', 'Hindi', 'French', 'German', 'Japanese', 'Hindi', 'English', 'Hindi', 'English', 'Hindi'],
    'Genre': ['Action', 'Comedy', 'Drama', 'Romance', 'Thriller', 'Drama', 'Action', 'Comedy', 'Drama', 'Action'],
    'Rating': [10, 6, 2, 9, 7, 5, 4, 3, 2, 1],
    'Review': ['Good', 'Average', 'Poor', 'Good', 'Average', 'Poor', 'Good', 'Average', 'Poor', 'Good']
}

df = pd.DataFrame(data)
print(df)

df.to_csv('Movies.csv', index=False)

movies = pd.read_csv('Movies.csv')
print('\nMovies:\n', movies)

highest_rating = movies['Rating'].idxmax()
print('Movie with highest rating:', movies['Movie Name'][highest_rating])

hindi_movies = movies[movies['Language'] == 'Hindi']
hindi_movies.to_csv('HindiMovies.csv', index=False)
print('\nHindi Movies:\n', hindi_movies)


