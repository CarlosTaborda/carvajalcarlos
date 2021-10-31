
enum Gender{ male, female }

class UserModel{
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? address;
  Gender? gender;//true men, false women
  String? password;
  String? passwordconfirm;

  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.address,
    this.gender,
    this.password
  });


  UserModel.fromJson(Map apiResponse){
    id        = apiResponse["id"];
    firstname = apiResponse["firstname"];
    lastname  = apiResponse["lastname"];
    email     = apiResponse["email"];
    address   = apiResponse["address"];
    gender    = apiResponse["gender"]==true?Gender.male:Gender.female;

  }

  UserModel.empty(){
    firstname = "";
    lastname  = "";
    email     = "";
    address   = "";
    gender    = Gender.male;
    password  = "";
    passwordconfirm = "";

  }

  Map<String, String> toMap(){
    Map<String, String> userMap = {
      "id"       :"$firstname",
      "firstname":"$firstname",
      "lastname" :"$lastname",
      "email"    :"$email",
      "address"  :"$address",
      "gender"   :"$gender",
      "password" :"$password",
    };

    return userMap;
  }

  @override
  String toString() {
    return """
    id: $id,
    firstname: $firstname,
    lastname: $lastname,
    email: $email,
    address: $address,
    gender: $gender,
    password: $password
    """;
  }
}