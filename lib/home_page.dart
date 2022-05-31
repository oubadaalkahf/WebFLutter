import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'package:mini_hps/cubit/app_cubit.dart';
import 'package:mini_hps/cubit/app_states.dart';
import 'package:mini_hps/model/model.dart';



class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valuefirst = false;

  final _formkey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>( listener: (context, state) {}
    ,builder: (context,state)=>Scaffold(
          appBar:  AppBar(
            title: const Text("Portal"),
          ),

          body: Row(
            children: [
              Expanded(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                   const   SizedBox(height: 30,),
                      Padding(
                        padding:const EdgeInsets.all(15),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "the Title must not be empty";
                            }
                          },
                          controller: _titleController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                            hintText: 'Enter Title Her',
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.all(15),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "the Title must not be empty";
                            }
                            return null;
                          },
                          controller: _messageController,

                          decoration:const  InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Message',
                            hintText: 'Enter Message Her',
                          ),
                        ),
                      ),


                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Send'),
                        onPressed: (){
                          if (_formkey.currentState!.validate())
                           print(_titleController.text);
                          print(_messageController.text);
                          post(title: _titleController.text, message: _messageController.text);},

                      )
                    ],
                  ),
                ),
              ),
              Expanded(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    const   SizedBox(height: 10,),
                      const Text(
                        'Choose Users',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                     const  SizedBox(height: 20,),
                      Expanded(

                        child: SingleChildScrollView(
                          child: Container(
                            width: 390,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: CheckboxGroup(
                              labels: AppCubit.get(context).users,
                                onSelected: (List<String> checked) => print(checked.toString())
                            ),
                          ),
                        ),
                      ),


                      Expanded(
                        child:Container(),
                      ),

                    ],)

              ),




            ],
          ),
        ));
  }
}


