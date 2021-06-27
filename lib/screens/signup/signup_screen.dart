import 'package:flutter/material.dart';
import 'package:store/helpers/validator.dart';
import 'package:store/models/user_detail.dart';

class SignUpScreen extends StatelessWidget{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final UserDetail user =UserDetail(email: '', name: '', password: '', confirmPassword: '');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric( horizontal: 16 ),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget> [
                TextFormField(
                    decoration: const InputDecoration(hintText: 'Nome Completo'),
                    validator: (name){
                      if(name!.isEmpty)
                        return 'Campo Obrigatorio';
                      else if (name.trim().split(' ').length <= 1)
                        return 'Preencha seu Nome Completo';
                      return null;
                    },
                  onSaved: (name)=>user.name=name!,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email){
                    if(email!.isEmpty)
                      return 'Campo Obrigatorio';
                    else if (!emailValid(email))
                      return 'E-Mail Invalid';
                    return null;
                  },
                  onSaved: (email)=> user.email = email!,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Palavra-passe'),
                  obscureText: true,
                  validator: (pass){
                    if(pass!.isEmpty)
                      return 'Password Obrigatorio';
                    else if(pass.length<6)
                      return 'Senha Muita Curta';
                    return null;
                  },
                  onSaved: (pass)=>user.password=pass!,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Confirme a Palavra-Passe'),
                  obscureText: true,
                  validator: (confirmPassword){
                    if(confirmPassword!.isEmpty)
                      return 'Password Obrigatorio';
                    else if(confirmPassword.length<6)
                      return 'Senha Muita Curta';
                    return null;
                  },
                  onSaved: (confirmPassword)=>user.confirmPassword=confirmPassword!,
                ),

                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    onPressed: (){
                        if(formKey.currentState!.validate()){
                            formKey.currentState!.save();

                            if(user.password !=user.confirmPassword){
                                  scaffoldKey.currentState!.showSnackBar(
                                    SnackBar(
                                      content: const Text('Senhas nao Coincidem'),
                                      backgroundColor: Colors.red ,
                                    ),
                                  );
                              return;
                            }

                            //
                        }
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
      ),
    );
  }
}