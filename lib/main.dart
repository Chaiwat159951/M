import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onlineapp_phoowain/showproduct.dart';
import 'package:onlineapp_phoowain/showproducttype.dart'; // Correct import
import 'addproduct.dart';

// Method หลักทีRun
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAXRBSiqOIBz2bG0KfJ0EZL-8k7z9xiWDc",
        authDomain: "onlinefirebase-d8df6.firebaseapp.com",
        databaseURL: "https://onlinefirebase-d8df6-default-rtdb.firebaseio.com",
        projectId: "onlinefirebase-d8df6",
        storageBucket: "onlinefirebase-d8df6.firebasestorage.app",
        messagingSenderId: "59581752902",
        appId: "1:59581752902:web:505fd69276e984a8f0cc47",
        measurementId: "G-RX8QHFEMH2",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

// Class stateless สั่งแสดงผลหนาจอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: Main(),
    );
  }
}

// Class stateful เรียกใช้การทํางานแบบโต้ตอบ
class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test app prototype'),
      ),
      body: Center(  // Centering the entire body content
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              // Add logo image here
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('assets/logo.png', height: 100), // Adjust the height as needed
              ),
              // Button to manage products
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addproduct()),
                  );
                },
                child: Text('จัดการข้อมูลสินค้า'),
              ),
              SizedBox(height: 20),
              // Button to manage locations
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowProduct()),
                  );
                },
                child: Text('แสดงข้อมูลสินค้า'),
              ),
              SizedBox(height: 20), // ระยะห่างระหว่างปุ่ม
              // ปุ่มแสดงประเภทสินค้า
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // ignore: prefer_const_constructors
                    MaterialPageRoute(builder: (context) => showproducttype()), // Navigate to ShowProductType
                  );
                },
                child: Text("แสดงประเภทสินค้า"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
