import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/cart_bloc/cart_bloc.dart';
import 'package:mini_project/application/cart_bloc/cart_event.dart';
import 'package:mini_project/application/cart_bloc/cart_state.dart';
import 'package:mini_project/presentation/screens/home/screen/home_screen.dart';
import 'package:mini_project/presentation/themes/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text(
              'My Cart',
              style: MyTextStyle.buttonText,
            ),
          ),
          body: state.productsQuantity.isNotEmpty? ListView.builder(
            itemCount: state.productsQuantity.length,
            itemBuilder: ((context, index) {
              final key = state.productsQuantity.keys.elementAt(index);
            return SizedBox(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: Image.network(state.productsImage[key],height: 50,width: 50,),
                      ),
                      SizedBox(
                        width: 200,
                        height: 20,
                        child: Text(key,style: MyTextStyle.commonText,)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton.filled(onPressed: (){
                        BlocProvider.of<CartBloc>(context).add(CartDecrementEvent(title: key));
                      }, icon: const Icon(Icons.remove)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(state.productsQuantity[key].toString(),style: MyTextStyle.buttonTextBlack,),
                      ),
                      IconButton.filled(onPressed: (){
                        BlocProvider.of<CartBloc>(context).add(CartIncrementEvent(title: key, price: state.productsPrice[key], image: state.productsImage[key]));
                      }, icon: const Icon(Icons.add))
                    ],
                  )
                ],
              ),
            );
          })):Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [const Text('Nothing In The Cart',style: MyTextStyle.buttonTextBlack,),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                  return const HomeScreen();
                }));
              }, child: const Text('Add Items',style: MyTextStyle.buttonTextBlack))],
            ),
          )
        );
      },
    );
  }
}
