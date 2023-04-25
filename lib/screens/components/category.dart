import 'package:e_learning_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import '../../puzzle_lib/src/inject_dependencies.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.85,),
        itemBuilder: (context, index) => CategoryCard(
              product: products[index],
            ),
            
            );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
   injectDependencies();
              // ignore: use_build_context_synchronously
              Navigator.push( context, MaterialPageRoute(
                 builder: (context) =>  product.game,),);
                                
            },
        
        child:  Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: product.color, borderRadius: BorderRadius.circular(15.0),),
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${product.courses} courses',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
