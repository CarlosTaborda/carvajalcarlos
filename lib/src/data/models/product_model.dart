


import 'package:carvajalcarlos/src/data/models/warehouse_model.dart';

enum ProductStatus{inactive, active}

class ProductModel{

  int? id;
  String? name;
  String? description;
  String? reference;
  ProductStatus? status;
  String? unit;
  double? unitCost;
  List<WarehouseModel>? warehouses = List.empty(growable: true);
  
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.reference,
    this.status,
    this.unit,
    this.unitCost
  });


  ProductModel.fromJson(Map apiResponse){
    id          = int.parse(apiResponse["id"]);
    name        = apiResponse["name"];
    description = apiResponse["description"];
    reference   = apiResponse["reference"];
    status      = apiResponse["status"] == "active"? ProductStatus.active : ProductStatus.inactive;
    unit        = apiResponse["unit"];
    unitCost    = double.parse(apiResponse["unitCost"]);


  }

  ProductModel.empty(){
    name        = "";
    description = "";
    reference   = "";
    status      = ProductStatus.active;
    unit        = "";
    unitCost    = 0;

  }

  Map<String, String> toMap(){
    Map<String, String> productMap = {
      "name": "$name",
      "description": "$description",
      "reference": "$reference",
      "status": "$status",
      "unit": "$unit",
      "unitCost": "$unitCost"
    };

    return productMap;
  }

  @override
  String toString() {
    return """
    id: $id,
    name: $name,
    description: $description,
    reference: $reference,
    status: $status,
    unit: $unit,
    unitCost: $unitCost
    """;
  }
}