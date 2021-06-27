import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric( horizontal: 16 ),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: <Widget> [
              TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Palavra-passe'),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Confirme a Palavra-Passe'),
                obscureText: true,
              ),

              SizedBox(
                height: 44,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                  textColor: Colors.white,
                  onPressed: (){

                  },
                  child: const Text (
                      'Criar Conta',
                      style: TextStyle(
                        fontSize: 18
                      ) ,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}