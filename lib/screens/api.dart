import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Login'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchuser,
          child: const Icon(Icons.refresh),
        ),
        body: users.isEmpty
            ? const Center(child: Text('No user Found'))
            : ListView.builder(itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      
                      title: Text(users[index]['name']['first']+' '+users[index]['name']['last'],style: TextStyle(color: Colors.blue),),
                      subtitle: Text(users[index]['email']),
                      tileColor: Color.fromARGB(255, 252, 169, 196),
                     
                      leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/snacks.png'),
            radius: 35,
          ),
                    
                    ),
                    const Divider(height: 0,thickness: 1,color: Colors.white,)
                  ],
                );
              
              }));
  }

  void fetchuser() async {
    print('userfetched');
    const url = 'https://randomuser.me/api/?results=5000';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results'];
    });
    print('userfetched completed');
  }
}