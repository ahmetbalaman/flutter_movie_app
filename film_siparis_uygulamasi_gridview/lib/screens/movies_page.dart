import 'package:film_siparis_uygulamasi_gridview/movies.dart';
import 'package:flutter/material.dart';

import 'movie_buy.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  Future<List<Movies>> getmovies() async {
    List<Movies> movieList = [];
    var m1 = Movies(
        movieName: "Anadoluda", moviePhoto: "anadolu.jpg", moviePrice: 15.99);
    var m2 =
        Movies(movieName: "Django", moviePhoto: "django.jpg", moviePrice: 9.99);
    var m3 = Movies(
        movieName: "Inception", moviePhoto: "inception.jpg", moviePrice: 15.99);
    var m4 = Movies(
        movieName: "Intersteller",
        moviePhoto: "intersteller.jpg",
        moviePrice: 15.99);

    movieList.add(m1);
    movieList.add(m2);
    movieList.add(m3);
    movieList.add(m4);

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    var ekranolcu = MediaQuery.of(context).size;
    var ekranyuksek = ekranolcu.height;
    var ekrangenis = ekranolcu.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Yemekler"),
        ),
        body: FutureBuilder<List<Movies>>(
            future: getmovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var movie = snapshot.data;

                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2 / 2.8),
                    itemCount: movie?.length,
                    itemBuilder: (context, index) {
                      var moviee = movie![index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieBuy(movieName: moviee.movieName, moviePrice: moviee.moviePrice, moviePhoto: moviee.moviePhoto)));
                        },
                        child: Card(
                            elevation: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: ekranyuksek / 4,
                                  width: ekrangenis/2,
                                  child: Image.asset(
                                      "moviesphoto/${moviee.moviePhoto}"),
                                ),
                                Text(moviee.movieName.toString()),
                                Text(moviee.moviePrice.toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
                              ],
                            )),
                      );
                    });
              } else {
                return const Center();
              }
            }));
  }
}
