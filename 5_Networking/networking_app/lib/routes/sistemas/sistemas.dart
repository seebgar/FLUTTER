import 'package:flutter/material.dart';
import 'package:networking_app/api/http_client.dart';
import 'package:networking_app/api/models/sistemas/sistema.dart';
import 'package:networking_app/api/parsers/sistema_parser.dart';

class Sistemas extends StatefulWidget {
  const Sistemas();

  @override
  _SistemasState createState() => _SistemasState();
}

class _SistemasState extends State<Sistemas> {
  Future<DataSistema> dataReponse;

  @override
  void initState() {
    super.initState();

    dataReponse = RequestREST(api: "api/agrupacion/tipo/sistemas")
        .executeGet<DataSistema>(
      const SistemaParser(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistemas"),
      ),
      body: FutureBuilder<DataSistema>(
        future: dataReponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data?.data ?? [];
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Text('${data[index].nombre}'),
                );
              },
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("error"),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
