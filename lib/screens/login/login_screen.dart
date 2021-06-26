import 'package:flutter/material.dart';
import 'package:store/helpers/validator.dart';

class LoginScreen extends StatelessWidget{

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(hintText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (email){
                            if(!emailValid(email!))
                              return 'Email Nao Valido';
                            return null;
                            },
                        ),
                      const SizedBox(height: 16,),
                      TextFormField(
                        controller: passController,
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
                                if(formKey.currentState!.validate()){
                                  print(emailController.text);
                                }
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