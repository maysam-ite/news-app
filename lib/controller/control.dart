import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  late bool theme;
  @override
  void onInit(){
    
    gettheme();
    super.onInit();
    
  }

   gettheme()async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      var k=pref.getBool("isligth");
      if(k==false){
        Get.changeTheme(ThemeData.dark());
        theme=true;
        update();
      }
      else{
       Get.changeTheme(ThemeData.light());
       theme=false;
        update();
      }
   }
 
  changetheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var k=pref.getBool("isligth");
    if(k==null){
      await pref.setBool("isligth",false);
      Get.changeTheme(ThemeData.dark());
    }
    else if(k==true){
      await pref.setBool("isligth",false);
      theme=true;
       Get.changeTheme(ThemeData.dark());
    }
    else{
      
       await pref.setBool("isligth",true);
       theme=false;
       Get.changeTheme(ThemeData.light());
    }
    update();
  }
   void l(){
    update();
  }

  
}

class SearchControler extends GetxController {
  List<String> last=[];
   @override
  void onInit(){
    getlastt();
    sub();
    super.onInit();
    
  }
  bool k=false;
  void press(){
    k=true;
    update();
  }
  void sub(){
   k=false;
    update();
  }
  void l(){
    update();
  }
  addse(String val)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isin =false;
    for(var x in last){
      if(val== x) {
       
        isin=true;
        break;
      }

    }if(!isin){last.add(val);}
    
    pref.setStringList("LastSearch",last);
    
  }
  
  getlastt()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    var k=await pref.getStringList("LastSearch");
    last=k!;
    
  }
}

