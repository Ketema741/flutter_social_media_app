import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: ((context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // error
          else if (snapshot.hasError) {
            return Text("error: ${snapshot.error}");
          }

          // data received
          else if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("No Data");
          } else if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> user =
                snapshot.data!.data() as Map<String, dynamic>;
            String email = user['email'];
            String username = user['username'];

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 25.0,
                  ),
                  child: Row(
                    children: [
                      BackButton(),
                    ],
                  ),
                ),
                // profile pics

                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.all(25),
                  child: const Icon(
                    Icons.person,
                    size: 64,
                  ),
                ),
                const SizedBox(height: 25),

                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  username,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            );
          } else {
            return const Text("No Data");
          }
        }),
      ),
    );
  }
}
