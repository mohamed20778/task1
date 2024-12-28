import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task1/components/product_card.dart';
import 'package:task1/cubits/product_cubit/get_product_cubit.dart';
import 'package:task1/models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel>? productslist;

  @override
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProductCubit>(context).getProduct();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text('Our', style: TextStyle(color: Colors.orange)),

            Text('Products'),
          ],
        ),
      ),
      body: BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
          if (state is GetProductLoading) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        color: Colors.white,
                      ),
                    ),
              ),
            );
          } else if (state is GetProductSuccess) {
            return ListView.builder(
              itemCount: state.productlist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ProductCard(productModel: state.productlist[index]),
                );
              },
            );
          } else if (state is GetProductfailure) {
            return const Center(
              child: Text('SomeThing Went Wrong Please Try Again'),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(21.0),
              child: Center(child: Text('No Product Found')),
            );
          }
        },
      ),
    );
  }
}
