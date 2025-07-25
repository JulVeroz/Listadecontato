import 'package:flutter/material.dart';
import 'package:listacontato/app_widget.dart';
import 'package:listacontato/features/contact/domain/presentation/controllers/contact_controller.dart';
import 'package:listacontato/features/contact/domain/repositories/contact_repository.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<ContactController>(
            create: (_) {
              final repository = ContactRepository();
              final controller = ContactController(repository);
              controller.loadContacts();
              return controller;
          }),
      ],
      child: AppWidget()
    );
  }
}