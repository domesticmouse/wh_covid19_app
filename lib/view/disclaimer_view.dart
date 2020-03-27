import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../hard_data.dart';
import '../routes.dart';
import '../style.dart';

class DisclaimerView extends StatefulWidget {
  @override
  _DisclaimerViewState createState() => _DisclaimerViewState();
}

class _DisclaimerViewState extends State<DisclaimerView>
    with SingleTickerProviderStateMixin {
  final String _title = 'Disclaimer and conditions of use';

  // Content of the page
  final _content = Container(
    padding: const EdgeInsets.all(16),
    child: Text(
      disclaimerBody,
      style: AppStyles.textLegal,
      //textAlign: TextAlign.justify,
    ),
  );

  // Content to show at the bottom instead of [_agreedButton]
  final _agreedText = Container(
    height: 44,
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    child: const Text(
      'You have already agreed 👍',
      style: AppStyles.textH5,
      textAlign: TextAlign.center,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Bottom button to agree t&c
    final _agreeButton = Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      height: 44.0,
      child: RaisedButton(
        child: const Text(
          'I Agree',
          style: AppStyles.textH5,
        ),
        color: AppColors.green500,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        onPressed: () {
          _setAgreed();
          Navigator.pushNamed(context, Routes.home);
        },
      ),
    );

    return FutureBuilder<bool>(
      future: _checkAgreed(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: AppStyles.appBarIconTheme,
              automaticallyImplyLeading: snapshot.data,
              title: Text(
                _title,
                style: AppStyles.textH5,
              ),
            ),
            body: Theme(
              data: Theme.of(context).copyWith(
                accentColor: AppColors.green500,
                highlightColor: AppColors.green50,
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _content,
                      if (!snapshot.data) _agreeButton else _agreedText,
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<bool> _checkAgreed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('disclaimer_agreed') ?? false;
  }

  Future<void> _setAgreed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('disclaimer_agreed', true);
    await prefs.setBool('disclaimer_first_view', true);
  }
}