import 'package:flutter/material.dart';
import '../services/auth_api_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nikController = TextEditingController();
  final notelpController = TextEditingController();

  String jenisKelamin = 'L';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: 340,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: 'Nama'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nikController,
                    decoration:
                        const InputDecoration(labelText: 'NIK'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: notelpController,
                    decoration:
                        const InputDecoration(labelText: 'No Telp'),
                  ),
                  const SizedBox(height: 10),

                  DropdownButtonFormField(
                    value: jenisKelamin,
                    items: const [
                      DropdownMenuItem(
                        value: 'L',
                        child: Text('Laki-laki'),
                      ),
                      DropdownMenuItem(
                        value: 'P',
                        child: Text('Perempuan'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        jenisKelamin = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Jenis Kelamin',
                    ),
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration:
                        const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Password'),
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final success =
                            await AuthApiService.register(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          nik: nikController.text,
                          notelp: notelpController.text,
                          jenisKelamin: jenisKelamin,
                        );

                        if (success) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
