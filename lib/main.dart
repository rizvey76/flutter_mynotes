import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_notes_projects/views/login_view.dart';
import 'package:flutter_notes_projects/views/register_view.dart';
import 'package:flutter_notes_projects/views/verify_email_view.dart';
import 'firebase_options.dart';
void main() async{
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
   WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const HomePage(),
      routes: {
        '/login/':(context) => const LoginView(),
        '/register/':(context) => const RegisterView(),
//xtra

         '/verify/':(context) => const VerifyEmailView(),
      },
    )
  );
}

class HomePage extends StatelessWidget{
  const HomePage({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
  return  FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context,snapshot){
        switch(snapshot.connectionState){
            case ConnectionState.done:
              final user= FirebaseAuth.instance.currentUser;

              if(user == null ){
                //  return const VerifyEmailView();
              //   print('This is user= $user');
              //    if(user.emailVerified){
              //       print('Email is verified');
              //    }  else{
              //  return const VerifyEmailView();
              // }
              return LoginView(); 
           } 
           else{
               print("user found");
              }
              return const Text('Done');

              default:
                return const CircularProgressIndicator();
        
        }
      },
    );
  
  }
  
}