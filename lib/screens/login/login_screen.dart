import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/helpers/validator.dart';
import 'package:store/models/user_detail.dart';
import 'package:store/models/user_manager.dart';

class LoginScreen extends StatelessWidget{

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

    @override
    Widget build(BuildContext context){
        return Scaffold(
          key:scafoldKey,
          appBar: AppBar(
            title: const Text('Enter'),
            centerTitle: true,
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                      Navigator.of(context).pushReplacementNamed('/signup');
                  },
                  textColor: Colors.white,
                  child: const Text(
                      'CRIAR CONTA',
                      style: TextStyle(fontSize: 14),
                  )
              )
            ],
          ),
          body: Center(
            child:Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formKey,
                  child: Consumer<UserManager>(
                   builder: (_, userManager, __){
                     return ListView(
                       padding: const EdgeInsets.all(16),
                       shrinkWrap: true,
                       children: <Widget>[
                         TextFormField(
                           controller: emailController,
                           enabled: !userManager.loading,
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
                           enabled: !userManager.loading,
                           decoration: const InputDecoration(hintText: 'Palavra-Passe'),
                           autocorrect: false,
                           obscureText: true,
                           validator: (password){
                             if(password != null && (password.isEmpty || password.length < 6))
                               return 'Palavra-Passe Invalida';
                             return null;
                           },
                         ),
                         //child,
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
                             onPressed: userManager.loading ? null :  () async {
                               if(formKey.currentState!.validate()){

                                 userManager.signIn(
                                     user: UserDetail(
                                         email:emailController.text,
                                         password:passController.text,
                                         name: '',
                                         confirmPassword: ''
                                     ),
                                     onFail: (e){
                                       //print(e);
                                       scafoldKey.currentState!.showSnackBar(
                                           SnackBar(
                                             content: Text('Falha ao Entrar : $e'),
                                             backgroundColor: Colors.red,
                                           )
                                       );
                                     },
                                     onSuccess: (){
                                       print('sucesso');
                                       //TODO: Fechar a tela de login
                                     }
                                 );
                               }
                             },
                             color: Theme.of(context).primaryColor,
                             disabledColor: Theme.of(context).primaryColor
                                 .withAlpha(100),
                             textColor: Colors.white,
                             child: userManager.loading ?
                             CircularProgressIndicator(
                               valueColor: AlwaysStoppedAnimation(Colors.white),
                             ) :
                             const Text(
                               'Enter',
                               style: TextStyle(
                                   fontSize: 18
                               ),
                             ),
                           ),
                         )
                       ],
                     );
                   },
//                   child: Align(
//                      alignment: Alignment.centerRight,
//                      child: FlatButton(
//                        onPressed: (){
//
//                        },
//                        padding: EdgeInsets.zero,
//                        child: const Text(
//                            'Esqueci a Minha Palavra-passe'
//                        ),
//                      ),
//                    ),
                  )
                ),
            )
          ),
        );
    }
}