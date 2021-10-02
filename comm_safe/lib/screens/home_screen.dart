import 'package:comm_safe/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => (Navigator.pushReplacementNamed(context, 'login')),
          ),
          
          title: Text('CommSafe',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25)),
        ),
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionmode = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionmode.paginaActual,
      onTap: (i) => navegacionmode.paginaActual = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.public), label: ('noticias')),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_outlined), label: ('alerta')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: ('perfil'))
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionpage = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionpage.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        NewsScreen(),
        Container(color: Colors.amber),
        Container(color: Colors.tealAccent)
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
