import 'dart:convert';

import 'package:book_api_testing/pdf_model.dart';
import 'package:http/http.dart' as http;

import 'book_model.dart';
import 'books_details_model.dart';

class BookApiServices{

  Future<BookModel> getBookData()async{


    var response = await http.get(Uri.parse("https://api.itbook.store/1.0/search/mongodb"));
    if(response.statusCode == 200){

      var data = json.decode(response.body);
      var getBooks = BookModel.fromJson(data);
      print(response);
      return getBooks;
    }
    else{
      return getBookData();

    }
  }


  Future<BooksDetailsModel> getBookDetaliesData() async {

    var response = await http.get(Uri.parse("https://api.itbook.store/1.0/books/9781617294136"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var bookDetails = BooksDetailsModel.fromJson(data); // Assuming your model is correct
      return bookDetails;
    } else {
      throw Exception('Failed to load book details');
    }
  }


  Future<BooksDetailsModel> getSearchData() async {

    var response = await http.get(Uri.parse("https://api.itbook.store/1.0/new"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var bookDetails = BooksDetailsModel.fromJson(data); // Assuming your model is correct
      return bookDetails;
    } else {
      throw Exception('Failed Search details');
    }
  }


  Future getPdfData() async {

    var response = await http.get(Uri.parse("https://itbook.store/files/9781617294136/chapter2.pdf"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var pdf = BooksDetailsModel.fromJson(data);
      print("response");
      return pdf;
    } else {
      throw Exception('Failed to load pdf details');
    }
    }



Future<PdfModel> getPdfDetail() async {
  String _Base_Url = 'https://api.itbook.store/1.0/';
  String endPoints = "new";
  var pdfEndPoints = "/books/9781617294136";
  final response = await http.get(Uri.parse('$_Base_Url$pdfEndPoints'));
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    return PdfModel.fromJson(responseData);
  } else {
    throw Exception('Failed Prosses PDF');
  }
  }
}