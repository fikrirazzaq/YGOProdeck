
import 'dart:convert';

class Meta {
  int currentRows;
  int totalRows;
  int rowsRemaining;
  int totalPages;
  int pagesRemaining;
  String previousPage;
  int previousPageOffset;
  String nextPage;
  int nextPageOffset;

  Meta({
    this.currentRows,
    this.totalRows,
    this.rowsRemaining,
    this.totalPages,
    this.pagesRemaining,
    this.previousPage,
    this.previousPageOffset,
    this.nextPage,
    this.nextPageOffset,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentRows: json["current_rows"] == null ? null : json["current_rows"],
    totalRows: json["total_rows"] == null ? null : json["total_rows"],
    rowsRemaining:
    json["rows_remaining"] == null ? null : json["rows_remaining"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    pagesRemaining:
    json["pages_remaining"] == null ? null : json["pages_remaining"],
    previousPage:
    json["previous_page"] == null ? null : json["previous_page"],
    previousPageOffset: json["previous_page_offset"] == null
        ? null
        : json["previous_page_offset"],
    nextPage: json["next_page"] == null ? null : json["next_page"],
    nextPageOffset:
    json["next_page_offset"] == null ? null : json["next_page_offset"],
  );
}
