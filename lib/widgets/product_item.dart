import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Screens/product_details_screen.dart';
import 'package:shopapp/providers/cart.dart';
import '../providers/product.dart';


class ProductItem extends StatelessWidget {
//  final String id;
 // final String title;
  // final String imageUrl;
//  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product= Provider.of<Product>(context,listen: false );
    final cart =Provider.of<Cart>(context,listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routName,arguments: product.id,);
            },
            child: Image.network(
              product. imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer <Product>(
         builder: (ctx ,product,child)=>IconButton(
              icon: Icon(product.isFavorite ?Icons.favorite:Icons.favorite_border),
              onPressed: () {
                product.voidtoggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
            ),),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),


    );
  }
}