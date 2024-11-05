import 'dart:convert';

void main() {
  ListUtils listUtils = ListUtils();
  // listUtils.conversion();
  // listUtils.search(3);
  listUtils.searchUsingDataModel(35);
}

class ListUtils {
  List<double> priceInUSD = [10, 23, 37, 75, 49, 87];

  conversion() {
    double conversionRate = 125.4; // USD to BDT
    List<double> priceInBDT = priceInUSD
        .map((price) =>
            double.parse((price * conversionRate).toStringAsFixed(20)))
        .toList();
    print('price in BDT: $priceInBDT');
  }

  search(int factor) {
    List searchResult = priceInUSD.where((price) {
      return price % factor == 0;
    }).toList();
    print('search result: $searchResult');
  }

  searchUsingDataModel(int minAge) {
    String jsonString =
        '''{"data":[{"name":"আলিফ","age":25},{"name":"বিজয়","age":32},{"name":"সারা","age":28},{"name":"রাহুল","age":40},{"name":"নুসরাত","age":22},{"name":"ফারুক","age":36},{"name":"মিম","age":30}]}''';
    DataModel dataModel = DataModel.fromJson(jsonDecode(jsonString));
    DataModel filteredDataModel = DataModel(
      data: dataModel.data
          ?.where((datum) => datum.age != null && datum.age! >= minAge)
          .toList(),
    );
    print(jsonEncode(filteredDataModel));
  }
}

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  List<Datum>? data;

  DataModel({
    this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? name;
  int? age;

  Datum({
    this.name,
    this.age,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
      };
}
