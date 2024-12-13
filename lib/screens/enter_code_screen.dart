import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:MovieNight/utils/app_state.dart';
import 'package:MovieNight/utils/http_helper.dart';
import 'package:MovieNight/utils/preference_helper.dart';
import 'package:MovieNight/screens/movie_selection_screen.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  String code = '';
  final int codeLength = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.indigo.shade900,
              Colors.purple.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Enter Code',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Icon(
                            Icons.keyboard_alt_outlined,
                            size: 80,
                            color: Colors.indigo.shade800,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Enter the Code from your Friend',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo.shade800,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade900,
                                letterSpacing: 12,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              maxLength: codeLength,
                              onChanged: (value) {
                                setState(() {
                                  code = value;
                                });
                              },
                              decoration: InputDecoration(
                                counterText: "",
                                hintText: "0000",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 40,
                                  letterSpacing: 12,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.indigo.shade200,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.indigo.shade800,
                                    width: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Container(
                            width: double.infinity,
                            height: 60,
                            margin: const EdgeInsets.symmetric(horizontal: 32),
                            child: ElevatedButton(
                              onPressed: code.length == codeLength
                                  ? () => _joinSession(context)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo.shade800,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 5,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.play_arrow, size: 28),
                                  SizedBox(width: 8),
                                  Text(
                                    "Join Session",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _joinSession(context) async {
    String? deviceId = Provider.of<AppState>(context, listen: false).deviceId;
    try {
      final response = await HttpHelper.joinSession(code, deviceId);
      String sessionId = response['data']['session_id'];
      Provider.of<AppState>(context, listen: false).setSessionId(sessionId);
      await PreferenceHelper.setSessionId(sessionId);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MovieSelectionScreen(),
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(
              'Cannot join session',
              style: TextStyle(
                color: Colors.indigo.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              '$e',
              style: TextStyle(
                color: Colors.indigo.shade900,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.indigo.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
