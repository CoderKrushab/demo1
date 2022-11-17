import 'package:demo/Helper/helperclass.dart';
import 'package:demo/pages/trending.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
late Future<List> allData;

  @override
  void initState() {

allData = ApiHelper.apiHelper.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,)),
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: allData,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
            List   allProductList =   snapshot.data;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: List.generate(allProductList.length, (index) => allProduct(img: allProductList[index]['category_info']['image_url'],name: allProductList[index]['category_info']['category_name'],allProductList: allProductList)).toList(),
                  ),
                ),
              );
            }
          else
            {
              return const Center(child:  CircularProgressIndicator());
            }
        },
      ),
    );
  }

  Widget allProduct({img, name,allProductList}) {
    return InkWell(
      onTap: () {
        List allFilterData = [];
        for(int i = 0; i < allProductList.length;i++)
          {
            if(name == allProductList[i]['category_info']['category_name'])
              {
                allFilterData.add(allProductList[i]);
              }
          }
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TrendingPage(filterData: allFilterData,);},));
      },
      child: Container(
        margin: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.017,
        ),
        height: MediaQuery.of(context).size.width * 0.29,
        width: MediaQuery.of(context).size.width * 0.29,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: MediaQuery.of(context).size.width * 0.115,
              backgroundImage: NetworkImage(img),
            ),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }


}
