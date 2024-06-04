import 'package:book_api_testing/book_api_services.dart';
import 'package:flutter/material.dart';

class PdfViewData extends StatefulWidget {
  const PdfViewData({Key? key}) : super(key: key);

  @override
  State<PdfViewData> createState() => _PdfViewDataState();
}

class _PdfViewDataState extends State<PdfViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Pdf Data",style: TextStyle(fontSize: 20,color: Colors.white)),
      ),
      body: FutureBuilder(
        future: BookApiServices().getPdfDetail(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: SizedBox(height: 200,
                  child: Card(color: Colors.deepPurpleAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Title: ${data.title}",style: const TextStyle(color: Colors.white,fontSize: 22)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Subtitle: ${data.subtitle}",style: const TextStyle(color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Authors: ${data.authors}",style: const TextStyle(color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Language: ${data.language}",style: const TextStyle(color: Colors.white)),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}



































// import 'package:flutter/material.dart';
//
// import 'book_api_service.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//    appBar: AppBar(
//      title: Text("Search List"),
//    ),
//       body: FutureBuilder(
//         future: NewBookDetail().getPdfDetail(),
//         builder: (context, snapshot) {
//           var data = snapshot.data;
//           return ListView.builder(
//            itemCount: data?.length,
//             itemBuilder: (context, index) {
//
//             return Column(
//               children: [
//                 Text("Title: ${data?.title}"),
//                 Text("Subtitle: ${data?.subtitle}"),
//                 Text("Authors: ${data?.authors}"),
//                 Text("Language: ${data?.language}"),
//
//               ],
//             );
//           },);
//         },
//       ),
//     );
//   }
// }
