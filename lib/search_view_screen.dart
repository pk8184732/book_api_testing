// import 'package:flutter/material.dart';
//
// import 'book_api_services.dart';
// import 'book_detalies_view.dart';
// import 'pdf_view_data.dart';
// import 'search_model.dart';
//
// class SearchViewScreen extends StatefulWidget {
//   const SearchViewScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SearchViewScreen> createState() => _SearchViewScreenState();
// }
//
// class _SearchViewScreenState extends State<SearchViewScreen> {
//   List<Book>? booksData;
//   List<Book>? value = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchBooks();
//   }
//
//   Future<void> fetchBooks() async {
//     final SearchModel data = await BookApiServices().getSearchData();
//     setState(() {
//       booksData = data.books;
//       value = booksData;
//     });
//   }
//
//   void filterSearchResults(String query) {
//     if (booksData != null) {
//       setState(() {
//         value = booksData!
//             .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 4,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 30),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const PdfViewData()),
//                 );
//               },
//               icon: const Icon(Icons.east_sharp, color: Colors.white),
//             ),
//           )
//         ],
//         title: const Text(
//           "Book Data View",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: RefreshIndicator(
//         onRefresh: fetchBooks,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextField(
//                 onChanged: filterSearchResults,
//                 decoration: const InputDecoration(
//                   labelText: 'Search',
//                   hintText: 'Search',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(25.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: value?.length ?? 0,
//                 itemBuilder: (context, index) {
//                   final Book? book = value?[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => BookDetaliesView(book: book),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         elevation: 5,
//                         color: Colors.white,
//                         shadowColor: Colors.black,
//                         child: ListTile(
//                           leading: Image.network("${book?.image}"),
//                           title: Text(
//                             "${book?.title}",
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 18),
//                           ),
//                           subtitle: Text(
//                             "${book?.subtitle}",
//                             style: const TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }