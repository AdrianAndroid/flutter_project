import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/authentication/authentication_bloc.dart';
import 'package:flutter_project/authentication/authentication_event.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (BuildContext context) {
              final userId = context.select(
                (AuthenticationBloc bloc) => bloc.state.user.id,
              );
              return Text('UserId:$userId');
            }),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
