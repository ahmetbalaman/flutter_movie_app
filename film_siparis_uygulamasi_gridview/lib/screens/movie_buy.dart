import 'package:flutter/material.dart';

class MovieBuy extends StatelessWidget {
  String? movieName;
  double? moviePrice;
  var moviePhoto;

  MovieBuy(
      {required this.movieName,
      required this.moviePrice,
      required this.moviePhoto});

  @override
  Widget build(BuildContext context) {
    var ekranolcu = MediaQuery.of(context).size;
    var ekranyuksek = ekranolcu.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: ekranyuksek / 2,
              child: Image.asset("moviesphoto/$moviePhoto"),
            ),
            Text(moviePrice.toString(),style: TextStyle(fontSize: 30,color: Colors.blue),),
            SizedBox(
              width: ekranyuksek/4,
              height: ekranyuksek/12,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$movieName Şipariş Edildi!")),
                  );
                },
                child: const Text("Şipariş Ver!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
