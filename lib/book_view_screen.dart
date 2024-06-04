
import 'package:book_api_testing/pdf_view_data.dart';
import 'package:flutter/material.dart';
import 'book_api_services.dart';
import 'book_detalies_view.dart';
import 'book_model.dart';

class BookViewScreen extends StatefulWidget {
  const BookViewScreen({Key? key}) : super(key: key);

  @override
  State<BookViewScreen> createState() => _BookViewScreenState();
}

class _BookViewScreenState extends State<BookViewScreen> {
  List<Book>? booksData;
  List<Book>? value = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final BookModel data = await BookApiServices().getBookData();
    setState(() {
      booksData = data.books;
      value = booksData;
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        value = booksData;
      });
    } else {
      setState(() {
        value = booksData!
            .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(
              builder: (context) => const PdfViewData(),));}, icon: const Icon(Icons.east_sharp,color: Colors.white,))
          )
        ],
        title: const Text(
          "Book Data View",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: RefreshIndicator(
        onRefresh: fetchBooks,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: filterSearchResults,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value?.length ?? 0,
                itemBuilder: (context, index) {
                  final Book? book = value?[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetaliesView(book: book),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        color: Colors.deepPurple,
                        shadowColor: Colors.black,
                        child: ListTile(
                          leading: Image.network("${book?.image}"),
                          title: Text(
                            "${book?.title}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          subtitle: Text(
                            "${book?.subtitle}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}








































// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SearchDemo(),
//     );
//   }
// }
//
// class SearchDemo extends StatefulWidget {
//   @override
//   _SearchDemoState createState() => _SearchDemoState();
// }
//
// class _SearchDemoState extends State<SearchDemo> {
//   List<String> items = [
//     "Item 1",
//     "Item 2",
//     "Item 3",
//     "Item 4",
//     "Item 5",
//   ];
//
//   List<String> filteredItems = [];
//
//   @override
//   void initState() {
//     filteredItems = items;
//     super.initState();
//   }
//
//   void filterSearchResults(String query) {
//     List<String> dummySearchList = items;
//     if(query.isNotEmpty) {
//       List<String> dummyListData = [];
//       dummySearchList.forEach((item) {
//         if(item.contains(query)) {
//           dummyListData.add(item);
//         }
//       });
//       setState(() {
//         filteredItems = [];
//         filteredItems.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         filteredItems = [];
//         filteredItems.addAll(items);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Demo'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: TextField(
//               onChanged: (value) {
//                 filterSearchResults(value);
//               },
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 hintText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(25.0),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredItems.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(filteredItems[index]),
//                   onTap: () {
//                     // Handle item click here
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text("Item Clicked"),
//                           content: Text("You clicked: ${filteredItems[index]}"),
//                           actions: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text("Close"),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//}