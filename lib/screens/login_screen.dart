import 'dart:async';

import 'package:carbud/components/decorated_text_field.dart';
import 'package:carbud/components/error_snack_bar.dart';
import 'package:carbud/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool _redirecting = false;

  late final TextEditingController _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authStateSubscription;

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await supabase.auth.signInWithOtp(
        email: _emailController.text.trim(),
        emailRedirectTo: kIsWeb ? null : 'io.carbud.app://login-callback/',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Check your email for a login link!')));
        _emailController.clear();
      }
    } on AuthException catch (error) {
      ErrorSnackBar(message: error.message);
    } catch (error) {
      const ErrorSnackBar(message: 'Unexpected error occurred');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((event) {
      if (_redirecting) return;

      final session = event.session;

      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/garage');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            children: [
              const Text(
                '👋 Welcome.',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 18),
              const Text(
                  'Please sign in via your email. A magic link will be sent to sign you in.'),
              const SizedBox(height: 18),
              DecoratedTextField(
                controller: _emailController,
                label: 'Email',
                hintText: 'john.doe@example.com',
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: _isLoading ? null : _signIn,
                child: Text(_isLoading ? 'Loading' : 'Send Magic Link'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
