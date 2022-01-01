import 'package:flutter/material.dart';
import '../widgets/pakets_list.dart';

class ResultScreen extends StatefulWidget {
  static const routeName = '/result';
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isLoading = false;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          _isLoading = false;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[50],
            elevation: 0,
            title: Text(
              "Result",
              style: TextStyle(
                color: Colors.pink[200],
              ),
            ),
          ),
          body: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const PaketsList()),
    );
  }
}
