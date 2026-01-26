// void main(){
//   //typage classique
//   String hello = "Hello World";
//   print(hello);
//
//   //typage auto/inférence de type
//   var name = "Michel";
//   name = "Sylvain";
//   // name = 12; pas possible
//
//   //type équivalent à any, mixed
//   dynamic test = 12;
//   test = "Coucou";
//
//   //constante
//   const age  = 52;
//   // age = 456; pas possible
//
//   //gestion du null
//   String? city;
//   city ??= "Quimper";
//   print(city.toUpperCase());
//   // print(city?.toUpperCase() ?? "Quimper");
// }

void main(){
  displayMessage("Coucou", 2);
  displayMessage2("hello", number: 5);
  displayMessage3(message: "Salut");
}

void displayMessage3({required String message, int number = 3}) {
  for (int i = 0; i < number; i++) {
    print(message);
  }
}

void displayMessage2(String message, {int number = 3}) {
  for (int i = 0; i < number; i++) {
    print(message);
  }
}

void displayMessage(String message, int number){
  for(int i = 0; i < number; i++){
    print(message);
  }

  for(int age in [1,2,3,4]){}
}









