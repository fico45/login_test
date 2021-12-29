import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLoading, {Key? key}) : super(key: key);
  final bool isLoading;
  final void Function(
    String username,
    String password,
    BuildContext ctx,
  ) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userPassword = '';
  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 30,
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: const ValueKey('username'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'Email address'),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(labelText: 'Password'),
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),
                  widget.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: _trySubmit,
                          child: const Text('Login'),
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
