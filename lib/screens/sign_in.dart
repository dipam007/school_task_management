import 'package:flutter/material.dart';
import 'package:school_task_management_app/services/mongo_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // List users = [];
  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  // void loadUsers() async {
  //   final data = await MongoDatabase.getUsers();
  //   print("****************************************");
  //   print(data);
  //   print("****************************************");
  //   setState(() => users = data);
  // }
  // void saveUser() async {
  //   // final name = nameController.text;
  //   // final email = emailController.text;
  //   const name = "Dipam";
  //   const email = "dip@gmail.co.in";
  //   if (name.isNotEmpty && email.isNotEmpty) {
  //     await MongoDatabase.addUser(name, email);
  //     loadUsers();
  //     nameController.clear();
  //     emailController.clear();
  //   }
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   loadUsers();
  // }

  final _formKey = GlobalKey<FormState>();
  final _uidController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      final uid = _uidController.text.trim();
      final password = _passwordController.text.trim();

      // TODO: Add authentication logic here
      print('Signing in with UID: $uid and Password: $password');
    }
  }

  @override
  void dispose() {
    _uidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SIGN IN')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 32),
              TextFormField(
                controller: _uidController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'School UID Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your UID number';
                  }
                  if (value.length != 18) {
                    return 'UID must be 18 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password more than 6 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _signIn,
                  child: const Text('Sign In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
