import 'dart:math';

import 'package:beproject/models/data_model.dart';
import 'package:beproject/screens/details_screen.dart';
import 'package:flutter/material.dart';

class CustomCarosal extends StatefulWidget {
  const CustomCarosal({Key? key}) : super(key: key);

  @override
  _CustomCarosalState createState() => _CustomCarosalState();
}

class _CustomCarosalState extends State<CustomCarosal> {
  late PageController _pageController;
  final int _currentPage = 0;

  // late List<Movie> movies;

  @override
  void initState() {
    super.initState();

    // fetchDta();

    // movies = moviesProvider.movies;

    // print(movies);

    // fetchData();

    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  // void fetchDta() {
  // final moviesProvider = Provider.of<PostsProvider>(context);
  // moviesProvider.fetchMovies();
  // }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   final moviesProvider = Provider.of<PostsProvider>(context);
  //   moviesProvider.fetchMovies();
  //   // Fetch data here or call methods that depend on provider initialization
  //   // fetchData();
  // }

  // void fetchData() async {
  //   try {
  //     final moviesProvider = Provider.of<PostsProvider>(context, listen: false);
  //     await moviesProvider.fetchMovies();
  //     setState(() {
  //       movies = moviesProvider
  //           .movies; // Update the movies list with data from the provider
  //     });
  //     print("Here is the list of moviews" + movies.toString());
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: Center(
              child: Text("Recent Posts",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 30)),
            ),
          ),
          AspectRatio(
            aspectRatio: 0.85,
            child: PageView.builder(
                itemCount: dataList.length,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return carouselView(index);
                }),
          ),
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
          // print("value $value index $index");
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(data: data),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                        data.imageName,
                      ),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black26)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            data.title,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "\$${data.price}",
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
