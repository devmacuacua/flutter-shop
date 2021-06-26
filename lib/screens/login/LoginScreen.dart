import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Enter'),
            centerTitle: true,
          ),
          body: Center(
            child:Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                          decoration: const InputDecoration(hintText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (email){
                              return null;
                          },
                        ),
                      const SizedBox(height: 16,),
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'Palavra-Passe'),
                        autocorrect: false,
                        obscureText: true,
                        validator: (password){
                          if(password != null && (password.isEmpty || password.length < 6))
                              return 'Palavra-Passe Invalida';
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: (){

                          },
                          padding: EdgeInsets.zero,
                          child: const Text(
                              'Esqueci a Minha Palavra-passe'
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: 44,
                        child: RaisedButton(
                            onPressed: (){

                            },
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: const Text(
                            'Enter',
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            )
          ),
        );
    }
}