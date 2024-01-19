import 'package:get_storage/get_storage.dart';

class DataStorage{
 final box = GetStorage();

 static final String urName = 'UserName';
 static final String urEmail = 'EmailAddress';
 static final String urPassword = 'Password';

 void setStorage(String key, String value){
  box.write(key, value);
 }
 String getStorage(String key){
 return box.read(key) ?? "";
 }

}