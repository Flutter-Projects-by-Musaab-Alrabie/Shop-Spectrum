import 'package:e_commerce_app_mvc/Screens/favorites.dart';
import 'package:e_commerce_app_mvc/Screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'product_card.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app_mvc/services/API_Methods.dart';
import 'package:e_commerce_app_mvc/Models/products.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  Products product = Products();
  bool isChecked = false;
  List<Product> products = [];

  getProducts() async {
    products = await CRUD.fetchProduct();
    setState(() {});
  }

  void initState() {
    super.initState();
    getProducts();
  }

  

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: 
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Products",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search_rounded,),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              //border: Border.all(none),
            ),
          ),
        ),

        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/Cart Icon.svg',)),  
          SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/Bell.svg',),),
          SizedBox(width: 10,),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
        
              SizedBox(height: 20,),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff4b3298),
                    borderRadius: BorderRadius.circular(15),
                  ),
        
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "A Summer Surprise",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            ),
                        ),
                    
                        SizedBox(height: 8),
                    
                        Text(
                          "Cashback 20%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
              SizedBox(height: 30,),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                  children: [
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xfffffecde),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: 
                            Padding(
                              padding: const EdgeInsets.all(13),
                              child: SvgPicture.asset('assets/icons/Flash Icon.svg',
                              color: Color(0xfffeda07a),
                              ),
                            )
                          ),
                      SizedBox(height: 8,),
                      Text("Flash\nDeal", textAlign: TextAlign.center),
                        ],
                      ),
                    ),
        
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xfffffecde),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: SvgPicture.asset('assets/icons/Bill Icon.svg',
                              color: Color(0xfffeda07a),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("Bill", textAlign: TextAlign.center),
                        ],
                      ),
                    ),
        
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xfffffecde),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: SvgPicture.asset('assets/icons/Game Icon.svg',
                              color: Color(0xfffeda07a),
                              ),
                            ),
                          ),
                      SizedBox(height: 8,),
                      Text("Game", textAlign: TextAlign.center),                      
                        ],
                      ),
                    ),
        
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xfffffecde),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: SvgPicture.asset('assets/icons/Gift Icon.svg',
                              color: Color(0xfffeda07a),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("Daily\nGift", textAlign: TextAlign.center),
                        ],
                      ),
                    ),
        
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xfffffecde),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: SvgPicture.asset('assets/icons/Discover.svg',
                              color: Color(0xfffeda07a),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("More", textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 20,),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  25),
                child: Row(
                  children: [
                    Text("Special for you",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    ),
                
                    SizedBox(width: 90,),
                
                
                    TextButton(onPressed: (){}, 
                    child: Text("See More", style: TextStyle(
                      color: Colors.grey
                    ),)
                    )
                  ],
                ),
              ),
        
              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.only(left: 25),
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  separatorBuilder: (context, index) => const SizedBox(width: 25),
                  itemBuilder: (context, index) {

                    final products = [
                      {
                        "title": "Smartphone",
                        "subtitle": "18 brands",
                        "image": "assets/images/Image Banner 2.png"
                      },
                      {
                        "title": "Smartphone",
                        "subtitle": "18 brands",
                        "image": "assets/images/Image Banner 3.png"
                      },
                    ];

                    return Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          height: 100,
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              products[index]["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index]["title"]!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                products[index]["subtitle"]!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
                      
              SizedBox(height: 20,),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  25),
                child: Row(
                  children: [
                    Text("Popular Products",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    ),
                
                    SizedBox(width: 66,),
                
                
                    TextButton(onPressed: (){}, 
                    child: Text("See More", style: TextStyle(
                      color: Colors.grey
                    ),)
                    )
                  ],
                ),
              ),

              Container(
                height: 150,
                padding: EdgeInsets.only(left: 35),
                child: FutureBuilder<List<Product>>(
                  future: CRUD.fetchProduct(), // call your API
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text("No products found"));
                    } else {
                      final products = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Container(
                            width: 160,
                            margin: EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product image
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      product.image ?? '',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Center(child: Icon(Icons.broken_image));
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                // Product title
                                Text(
                                  product.title ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),
                                ),

                                Row(
                                  children: [
                                    // Product price
                                    Text(
                                      '\$${product.price?.toStringAsFixed(2) ?? '0'}', 
                                      style: TextStyle(color: Color(0xfffb7a43), fontSize: 18, fontWeight: FontWeight.bold),
                                    ),

                                    Spacer(),
                                    IconButton(
                                      onPressed: (){
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                      },
                                      icon: isChecked
                                          ? SvgPicture.asset(
                                              'assets/icons/Heart Icon_2.svg',
                                              colorFilter: ColorFilter.mode(Color(0xffffe4949), BlendMode.srcIn),
                                            )
                                          : SvgPicture.asset(
                                              'assets/icons/Heart Icon.svg',
                                              colorFilter: ColorFilter.mode(Color(0xffffdbdee3), BlendMode.srcIn),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )

            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xfffb7a43),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        onTap: (index) {
          switch (index) {
            case 0: ;break;
            case 1: Navigator.pushNamed(context, '/Favorites') ;break;
            case 2: ;break;
            case 3: Navigator.pushNamed(context, '/Profile'); break;
          }
        },

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Shop Icon.svg',
            color: Color(0xfffeda07a),
            ),            
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Heart Icon.svg',
            color: Color(0xfffeda07a),
            ),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Chat bubble Icon.svg',
            color: Color(0xfffeda07a),
            ),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/User Icon.svg',
            color: Color(0xfffeda07a),
            ),
            label: " ",
          ),
        ],
      ),
    );
  }
}

Widget productList (String name, String imageUrl) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: 30,
    ),
    title: Text(name),
  );
}