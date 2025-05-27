import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _idProducto = TextEditingController();
  final _nombre = TextEditingController();
  final _precio = TextEditingController();
  final _idCategoria = TextEditingController();
  final _idProveedores = TextEditingController();
  final _descripcion = TextEditingController();
  final _cantstock = TextEditingController();


  @override
  void dispose() {
    _idProducto.dispose();
    _nombre.dispose();
    _precio.dispose();
    _idCategoria.dispose();
    _idProveedores.dispose();
    _descripcion.dispose();
    _cantstock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue.shade300,
            title: const Text("Demon's", style: TextStyle(color: Colors.white),),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              MyTextField(
                  myController: _idProducto,
                  fieldName: "idProducto",
                  myIcon: Icons.key,
                  prefixIconColor: Colors.blue.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _nombre,
                  fieldName: "Nombre",
                  myIcon: Icons.sell_outlined,
                  prefixIconColor: Colors.blue.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _precio,
                  fieldName: "Precio",
                  myIcon: Icons.payments_outlined,
                  prefixIconColor: Colors.blue.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _idCategoria,
                  fieldName: "idCategoria",
                  myIcon: Icons.key,
                  prefixIconColor: Colors.blue.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _idProveedores,
                  fieldName: "idProveedores",
                  myIcon: Icons.key,
                  prefixIconColor: Colors.blue.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _descripcion,
                  fieldName: "Descripcion",
                  myIcon: Icons.description,
                  prefixIconColor: Colors.blue.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _cantstock,
                  fieldName: "Cant-stock",
                  myIcon: Icons.pin_outlined,
                  prefixIconColor: Colors.blue.shade300),
              const SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  // Botón que pasa los datos a la pantalla de detalles
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              productName: _idProducto.text,
              productDescription: _nombre.text,
              precio: _precio.text,
              idC: _idCategoria.text,
              idP: _idProveedores.text,
              descripcion: _descripcion.text,
              stock: _cantstock.text,
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }
}

// Custom Widget con ícono de borrar
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            myController.clear();
          },
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.blue),
      ),
    );
  }
}
