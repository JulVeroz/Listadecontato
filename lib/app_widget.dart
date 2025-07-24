import 'package:flutter/material.dart';
import 'package:listacontato/features/contact/domain/presentation/pages/contact_page.dart';

class AppWidget  extends StatelessWidget{
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos',
      debugShowCheckedModeBanner: false,
      initialRoute: ContactPage.routeName,
      routes: {
        ContactPage.routeName: (context) => ContactPage(),
      },
    );
  }
}