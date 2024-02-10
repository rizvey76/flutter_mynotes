import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}):super(key: key);

 
  
  @override
_VerifyEmailView createState()=> _VerifyEmailView();
}

class _VerifyEmailView extends State<VerifyEmailView>{
 bool isEmailVerified=false;
 Timer? timer;
@override
 void initState(){
   super.initState();
   isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;

   if(!isEmailVerified){
      sendVerificationEmail();

      timer=Timer.periodic(
        Duration(seconds: 3), 
        (timer)=> checkEmailVerified(),
             
  );
  print('email verfication value--$isEmailVerified');
   }
 }

@override
 void dispose(){
timer?.cancel();
super.dispose();
 }


 Future checkEmailVerified() async{
  await FirebaseAuth.instance.currentUser!.reload();
   setState(() {
     isEmailVerified= FirebaseAuth.instance.currentUser!.emailVerified;
   });

   if(isEmailVerified){
   
    print('Email verification - $isEmailVerified');

     timer?.cancel();
   }
 }

 Future sendVerificationEmail() async{
  try{
   final user= FirebaseAuth.instance.currentUser!;
   await user.sendEmailVerification();
  }catch (e){
      print(e);
  }
 
 }

 

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text('Verify email'),
    ),
    body: Column(
      children: [
        // const Text('Please verify your email address:'),
        // TextButton(
        //   onPressed: sendVerificationEmail,

        // //      ()async{
        // //   final user=FirebaseAuth.instance.currentUser;
        // //   await user?.sendEmailVerification();
        // // } ,


        //  child: const Text('Send email verification')),
      ],
    ),
   );
  }
  
}