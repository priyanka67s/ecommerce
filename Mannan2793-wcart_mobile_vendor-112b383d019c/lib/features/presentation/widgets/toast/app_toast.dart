import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

showSuccessSnackBar( String message) {
  Future.delayed(Duration.zero, () {                  
toastification.show(            
            title: const Text("Success",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),
            ),
            description: Text(message,style:const TextStyle(fontSize:13,fontWeight: FontWeight.w600,),),
            showProgressBar: true,
            progressBarTheme: ProgressIndicatorThemeData(color: Colors.green, strokeWidth: 1),
            padding: EdgeInsets.symmetric(vertical:  5, horizontal: 10),
            autoCloseDuration: const Duration(seconds: 5),
            style: ToastificationStyle.minimal,
            type: ToastificationType.success,
            alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 15, right: 15)
          );
          },);
}


//error toast
showFailureSnackBar( String message) {
  Future.delayed(Duration.zero, () {                  
toastification.show(            
        title: const Text("Failure",
        style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
            description: Text(message,style:const TextStyle(fontSize:13,fontWeight: FontWeight.w600,),),
            showProgressBar: true,
            progressBarTheme: ProgressIndicatorThemeData(color: Colors.red, strokeWidth: 1),
            autoCloseDuration: const Duration(seconds: 5),
            padding: EdgeInsets.symmetric(vertical:  5, horizontal: 10),
            style: ToastificationStyle.minimal,
            type: ToastificationType.error,
      margin: const EdgeInsets.only(top: 10, right: 15, left: 15)
          );
          },);
}


showWarningSnackBar(String message){
  Future.delayed(Duration.zero, () {                  
toastification.show(            
      title: const Text(
        "Warning",
        style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
            description: Text(message,style:const TextStyle(fontSize:13,fontWeight: FontWeight.w600,),),
            showProgressBar: true,
            progressBarTheme: ProgressIndicatorThemeData(color: Colors.blue, strokeWidth: 1),
            autoCloseDuration: const Duration(seconds: 5),
            padding: EdgeInsets.symmetric(vertical:  5, horizontal: 10),
            style: ToastificationStyle.minimal,
            type: ToastificationType.info,
      margin: const EdgeInsets.only(top: 15, right: 15,)
          );
          },);
}

showInfoSnackBar(String message){
  Future.delayed(Duration.zero, () {                  
toastification.show(            
      title: const Text(
        "Info",
        style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
            description: Text(message,style:const TextStyle(fontSize:13,fontWeight: FontWeight.w600),),
            showProgressBar: true,
            progressBarTheme: ProgressIndicatorThemeData(color: Colors.orange, strokeWidth: 1),
            padding: EdgeInsets.symmetric(vertical:  5, horizontal: 10),
            autoCloseDuration: const Duration(seconds: 5),
            style: ToastificationStyle.minimal,
            type: ToastificationType.warning,
      margin: const EdgeInsets.only(top: 15, right: 15, left: 15)
          );
          },);
}


//! show loading
showLoadingSnackBar( String title){
    Future.delayed(Duration.zero, () {                  
toastification.show(
            
        title:  Text(title,
        style:const TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
            autoCloseDuration: const Duration(seconds: 10),
            style: ToastificationStyle.fillColored,
            type: ToastificationType.warning,
      margin: const EdgeInsets.only(top: 40, right: 15, left: 15)
          );
          },);
}