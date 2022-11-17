import 'package:flutter/material.dart';

class TrendingPage extends StatefulWidget {
   TrendingPage({Key? key,required this.filterData}) : super(key: key);

  List filterData;
  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          "Trending",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.filter_alt_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
              children: widget.filterData
                  .map((e) => allProduct(
                      img: e['image_url'],
                    description: e['item_description'],
                    name: e['item_name'],
                    price: e['price']))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget allProduct({img, name, description, price}) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(5),
      height: 280,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xffc1c1c1)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 185,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          img,
                        ),
                        fit: BoxFit.contain)),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(7)),
                child: const Icon(
                  Icons.bookmark_border_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.34,
                child: Text(
                  name,
                  style: const TextStyle(color: Color(0xff0E9444), overflow: TextOverflow.ellipsis),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(2),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff0E9444))),
                child: const CircleAvatar(
                  backgroundColor: Color(0xff0E9444),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              description,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Text(
                "\$ $price.00",
                style: const TextStyle(color: Colors.black),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(2),
                  height: 30,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffc1c1c1))),
                  child: const Text(
                    "ADD",
                    style: TextStyle(color: Color(0xff0E9444)),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
