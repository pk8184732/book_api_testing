
// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  String error;
  String total;
  List<Book> books;

  SearchModel({
    required this.error,
    required this.total,
    required this.books,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    error: json["error"],
    total: json["total"],
    books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "total": total,
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}

class Book {
  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    title: json["title"],
    subtitle: json["subtitle"],
    isbn13: json["isbn13"],
    price: json["price"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "isbn13": isbn13,
    "price": price,
    "image": image,
    "url": url,
  };
}
