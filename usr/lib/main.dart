import 'package:flutter/material.dart';

void main() {
  runApp(const CinefyApp());
}

class CinefyApp extends StatelessWidget {
  const CinefyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinefy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MovieListPage(),
    );
  }
}

class Movie {
  final String title;
  final String imageUrl;

  // Made the constructor const to allow usage in const lists
  const Movie({required this.title, required this.imageUrl});
}

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  final List<Movie> movies = const [
    Movie(title: 'Movie 1', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+1'),
    Movie(title: 'Movie 2', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+2'),
    Movie(title: 'Movie 3', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+3'),
    Movie(title: 'Movie 4', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+4'),
    Movie(title: 'Movie 5', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+5'),
    Movie(title: 'Movie 6', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+6'),
    Movie(title: 'Movie 7', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+7'),
    Movie(title: 'Movie 8', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+8'),
    Movie(title: 'Movie 9', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+9'),
    Movie(title: 'Movie 10', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+10'),
    Movie(title: 'Movie 11', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+11'),
    Movie(title: 'Movie 12', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+12'),
    Movie(title: 'Movie 13', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+13'),
    Movie(title: 'Movie 14', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+14'),
    Movie(title: 'Movie 15', imageUrl: 'https://via.placeholder.com/300x450?text=Movie+15'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinefy'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.65,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetailPage(movie: movie),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        movie.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Column(
        children: [
          Image.network(
            movie.imageUrl,
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Text(
            movie.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking functionality coming soon!')),
              );
            },
            child: const Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
