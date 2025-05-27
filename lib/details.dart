import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.precio,
    required this.idC,
    required this.idP,
    required this.descripcion,
    required this.stock,
  }) : super(key: key);

  final String productName;
  final String productDescription;
  final String precio;
  final String idC;
  final String idP;
  final String descripcion;
  final String stock;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late List<Map<String, String>> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      {
        'title': widget.productName,
        'subtitle': widget.productDescription,
        'icon': 'bookmark'
      },
    ];
  }

  Icon getIcon(String iconType) {
    switch (iconType) {
      case 'bookmark':
        return const Icon(Icons.bookmark_added_rounded, color: Colors.blueAccent);
      case 'bag':
        return const Icon(Icons.shopping_bag_outlined, color: Colors.blueAccent);
      case 'chair':
        return const Icon(Icons.chair, color: Colors.blueAccent);
      default:
        return const Icon(Icons.category, color: Colors.blueAccent);
    }
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
        title: const Text(
          "Details", 
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título y descripción
            Text(
              widget.productName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 8),
            Text(
              widget.productDescription,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Mostrar los demás campos a, b, c, d, e
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Precio: ${widget.precio}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Categoria: ${widget.idC}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Proveedor: ${widget.idP}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Descripcion: ${widget.descripcion}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Stock: ${widget.stock}', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
