
enum WharehouseStatus{inactive, active}
class WarehouseModel{
  
  int? id;
  String? name;
  String? observations;
  bool? isDefault;
  String? address;
  WharehouseStatus? status;
  int? initialQuantity;
  int? availableQuantity;
  int? minQuantity;
  int? maxQuantity;


  WarehouseModel({

    this.name,
    this.observations,
    this.isDefault,
    this.address,
    this.status,
    this.initialQuantity,
    this.availableQuantity,
    this.minQuantity,
    this.maxQuantity,

  });


  WarehouseModel.fromJson(Map apiResponse){
    id        = int.parse(apiResponse["id"]);
    name = apiResponse["name"];

  }

  WarehouseModel.empty(){
    name              = "";
    observations      = "";
    isDefault         = false;
    address           = "";
    status            = WharehouseStatus.inactive;
    initialQuantity   = 0;
    availableQuantity = 0;
    minQuantity       = 0;
    maxQuantity       = 0;


  }

  Map<String, String> toMap(){
    Map<String, String> warehouseMap = {
      "name":"$name",
      "observations":"$observations",

    };

    return warehouseMap;
  }

  @override
  String toString() {
    return """
    id: $id,
    name: $name,
    observations: $observations,
    isDefault: $isDefault
    """;
  }
}