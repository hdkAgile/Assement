import 'dart:convert';

class RaffleAPIModel {
  String? search;
  //String? price;
  int offset;
  int limit;
  //int? categoryId;
  //int? ticketPriceId;
  //String? createdAt;
  // String? sort;

  RaffleAPIModel(
      {this.search,
      //this.price,
      //this.categoryId,
      //this.createdAt,
      //this.sort,
      //this.ticketPriceId,
      required this.limit,
      required this.offset});

  Map<String, dynamic> toJson() => {
        "search": search,
        //"price": price,
        "offset": offset,
        "limit": limit,
        //"created_at": createdAt,
        //"category_id": categoryId,
        //"ticket_price_id": ticketPriceId,
        //"sort": sort,
      };
}
