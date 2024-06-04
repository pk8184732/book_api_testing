// To parse this JSON data, do
//
//     final booksDetailsModel = booksDetailsModelFromJson(jsonString);

import 'dart:convert';

BooksDetailsModel booksDetailsModelFromJson(String str) => BooksDetailsModel.fromJson(json.decode(str));

String booksDetailsModelToJson(BooksDetailsModel data) => json.encode(data.toJson());

class BooksDetailsModel {
  String error;
  String title;
  String subtitle;
  String authors;
  String publisher;
  String language;
  String isbn10;
  String isbn13;
  String pages;
  String year;
  String rating;
  String desc;
  String price;
  String image;
  String url;
  Pdf pdf;

  BooksDetailsModel({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    required this.pdf,
  });

  factory BooksDetailsModel.fromJson(Map<String, dynamic> json) => BooksDetailsModel(
    error: json["error"],
    title: json["title"],
    subtitle: json["subtitle"],
    authors: json["authors"],
    publisher: json["publisher"],
    language: json["language"],
    isbn10: json["isbn10"],
    isbn13: json["isbn13"],
    pages: json["pages"],
    year: json["year"],
    rating: json["rating"],
    desc: json["desc"],
    price: json["price"],
    image: json["image"],
    url: json["url"],
    pdf: Pdf.fromJson(json["pdf"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "title": title,
    "subtitle": subtitle,
    "authors": authors,
    "publisher": publisher,
    "language": language,
    "isbn10": isbn10,
    "isbn13": isbn13,
    "pages": pages,
    "year": year,
    "rating": rating,
    "desc": desc,
    "price": price,
    "image": image,
    "url": url,
    "pdf": pdf.toJson(),
  };
}

class Pdf {
  String chapter2;
  String chapter5;

  Pdf({
    required this.chapter2,
    required this.chapter5,
  });

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
    chapter2: json["Chapter 2"],
    chapter5: json["Chapter 5"],
  );

  Map<String, dynamic> toJson() => {
  "Chapter 2": chapter2,
  "Chapter 5": chapter5,
  };
}
