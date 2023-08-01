import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../pages/LoginPage.dart';
import '../../providers/mainprovider.dart';
 

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Obteniendo el proveedor de autenticación
    final mainProvider = Provider.of<MainProvider>(context);

    return AppBar(
      title: const Text("Centro Cristiano Guayaquil"),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {},
        ),
        if (mainProvider.isAuth)
          IconButton(
  icon: const Icon(Icons.close, color: Colors.white),
  onPressed: () async {
    await mainProvider.logout();
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
  },
)
        else
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.routeName);
            },
          ),
      ],
    );
  }
}
