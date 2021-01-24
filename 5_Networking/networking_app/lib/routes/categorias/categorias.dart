import 'package:flutter/material.dart';
import 'package:networking_app/api/http_client.dart';
import 'package:networking_app/api/models/categorias/categoria.dart';
import 'package:networking_app/api/parsers/json_parser.dart';

class Categorias extends StatefulWidget {
  const Categorias();
  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  Future<DataCategoria> dataReponse;

  @override
  void initState() {
    super.initState();

    dataReponse = RequestREST(api: "api/agrupacion/tipo/categorias")
        .executeGet<DataCategoria>(
      const CategoriaParser(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
      ),
      body: FutureBuilder<DataCategoria>(
        future: dataReponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // nullable
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
            final error = snapshot.error ?? "";
            return Center(
              child: Text("${error}"),
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
