import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/pakets.dart';

class ResultDetailScreen extends StatefulWidget {
  static const routeName = '/result-detail';
  const ResultDetailScreen({Key? key}) : super(key: key);
  @override
  State<ResultDetailScreen> createState() => _ResultDetailScreenState();
}

class _ResultDetailScreenState extends State<ResultDetailScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  late Paket paket;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final paketid = ModalRoute.of(context)?.settings.arguments as String;
      if (paketid != "null") {
        paket = await Provider.of<Pakets>(context, listen: false)
            .getPaketById(paketid);
      }
      setState(() {
        _isLoading = false;
      });
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var priceFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.pink[200], //change your color here
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[50],
          elevation: 0,
          title: Text(
            'Detail Paket',
            style: TextStyle(
              color: Colors.pink[200],
            ),
          ),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            paket.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(paket.nama,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[900],
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LogoList(
                        text: priceFormat.format(paket.harga),
                        icon: Icons.wallet_travel,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LogoList(
                        text: paket.tamu.toString() + " Orang",
                        icon: Icons.wallet_travel,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Deskripsi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(paket.detail,
                          style: TextStyle(
                            color: Colors.indigo[900],
                          )),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class LogoList extends StatelessWidget {
  const LogoList({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.pink[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.indigo[900],
            ),
          ),
        ),
      ],
    );
  }
}
