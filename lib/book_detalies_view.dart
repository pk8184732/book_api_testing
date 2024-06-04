import 'package:book_api_testing/book_model.dart';
import 'package:flutter/material.dart';

import 'book_api_services.dart';
import 'books_details_model.dart';

class BookDetaliesView extends StatefulWidget {
  const BookDetaliesView({Key? key, required this.book}) : super(key: key);

  final Book? book;

  @override
  State<BookDetaliesView> createState() => _BookDetaliesViewState();
}

class _BookDetaliesViewState extends State<BookDetaliesView> {
  late Future<BooksDetailsModel> _bookDetailsFuture;

  @override
  void initState() {
    super.initState();
    _bookDetailsFuture = BookApiServices().getBookDetaliesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Book Details View",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: RefreshIndicator(
            child: FutureBuilder<BooksDetailsModel>(
              future: _bookDetailsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else {
                  var book = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      elevation: 5,
                      color: Colors.deepPurple,
                      shadowColor: Colors.black,
                      child:
                        Column(
                          children: [
                          Text(
                              "${book?.title}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${book?.subtitle}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${book?.publisher}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${book?.price}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${book?.desc}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${book?.isbn13}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${book?.isbn10}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${book?.pages}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${book?.pdf}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      // ListTile(
                      //   leading: Image.network("${book?.image}"),
                      //   title: Text(
                      //     "${book?.title}",
                      //     style: const TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //       fontSize: 18,
                      //     ),
                      //   ),
                      //   subtitle: Text(
                      //     "${book?.subtitle}",
                      //     style: const TextStyle(color: Colors.white),
                      //   ),
                      // ),
                    ),
                  );
                }
              },
            ),
            onRefresh: () async {
              setState(() {
                _bookDetailsFuture = BookApiServices().getBookDetaliesData();
              });
            },
            ),
        );
    }
}