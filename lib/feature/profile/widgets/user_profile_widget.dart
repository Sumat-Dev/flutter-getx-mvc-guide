import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_guide/feature/profile/models/user_model.dart';

class UserProfileWidget extends StatelessWidget {
  final UserModel user;

  const UserProfileWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        const SizedBox(height: 16),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          user.email,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
