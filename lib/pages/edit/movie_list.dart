import 'package:flutter/material.dart';
import 'package:http_request_flutter/pages/edit/movie_detail.dart';
import 'package:http_request_flutter/service/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List movies = [];
  HttpService? service;

  Future initialize() async {
    movies = [];
    movies = await service!.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 19, 126),
      appBar: AppBar(
        title: const Text('2031710008\nMochammad Rafly Herdianto'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView.builder(
            itemCount: (moviesCount == null) ? 0 : moviesCount,
            itemBuilder: (context, position) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  position == 0
                      ? const Text(
                          'Popular Movies',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => MovieDetail(
                          movie: movies[position],
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${movies[position].posterPath}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movies[position].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.asset('assets/images/star-vector.png',
                                      height: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    movies[position].voteAverage.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xffBABFC9),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
