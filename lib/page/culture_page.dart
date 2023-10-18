import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_live_acs/ressouces/my_colors.dart';

import 'culture_details.dart';

class CulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    List culture = [
      {
        "name": "potatos",
        "image": "assets/potatos.png",
        "molecule": 200,
        "momth": "sep-dec",
        "water" : "1-2",
        "temp": "15-20",
        "light":"8-12" ,
        "text": '''
        
Voici un guide détaillé sur la culture de la pomme de terre, avec des pratiques exemplaires et des conditions adéquates :

Introduction

The potato (Solanum tuberosum) is a starchy tuber that is a staple food for over 1 billion people worldwide. It is a cool-season crop that prefers a temperate climate with cool nights. It can be grown in a variety of soil types, but it does best in well-drained, loamy soil.

Practices

Land preparation

The first step in potato cultivation is to prepare the land. This involves clearing the land of weeds and debris, and then tilling the soil to a depth of 10-15 centimeters. If the soil is poor, it may be necessary to add compost or manure to improve fertility.

Planting

Potatoes are planted from seed potatoes, which are small, whole potatoes that have been treated to prevent disease. The seed potatoes should be planted in rows that are 30-45 centimeters apart, with plants spaced 20-30 centimeters apart within the rows.

Fertilization

Potatoes are heavy feeders, so it is important to fertilize the crop regularly. A balanced fertilizer, such as 10-10-10, should be applied at a rate of 100-150 kilograms per hectare.

Weed control

Weeds can compete with potatoes for water and nutrients, so it is important to control them throughout the growing season. Weeds can be controlled by hand weeding, hoeing, or using herbicides.

Irrigation

Potatoes are a drought-tolerant crop, but they will produce higher yields if they are irrigated during periods of dry weather.

Pest and disease control

Potatoes are susceptible to a number of pests and diseases, including potato blight, early blight, and late blight. It is important to monitor the crop for pests and diseases and to take appropriate control measures if necessary.

Harvesting

Potatoes are ready to harvest 8-12 weeks after planting. The potatoes should be dug up with a shovel or fork, taking care not to damage the tubers. The potatoes should be washed and then stored in a cool, dark place.

Conditions

Potatoes are a cool-season crop that prefers a temperate climate with cool nights. It can be grown in a variety of soil types, but it does best in well-drained, loamy soil.

Best practices

Use high-quality seed potatoes

High-quality seed potatoes will produce stronger plants with higher yields. Seed potatoes should be treated to prevent disease.

Plant at the right time

Potatoes should be planted in the spring or fall, depending on the climate. Planting in the spring will produce a crop that is ready to harvest in the summer. Planting in the fall will produce a crop that is ready to harvest in the spring.

Fertilize regularly

Potatoes are heavy feeders, so it is important to fertilize the crop regularly. A balanced fertilizer, such as 10-10-10, should be applied at a rate of 100-150 kilograms per hectare.

Control weeds

Weeds can compete with potatoes for water and nutrients, so it is important to control them throughout the growing season. Weeds can be controlled by hand weeding, hoeing, or using herbicides.

Irrigate as needed

Potatoes are a drought-tolerant crop, but they will produce higher yields if they are irrigated during periods of dry weather.

Monitor for pests and diseases

Potatoes are susceptible to a number of pests and diseases, so it is important to monitor the crop for pests and diseases and to take appropriate control measures if necessary.

Harvesting at the right time

Potatoes are ready to harvest 8-12 weeks after planting. The potatoes should be dug up with a shovel or fork, taking care not to damage the tubers. The potatoes should be washed and then stored in a cool, dark place.

Additional tips

In addition to the above practices, there are a few additional tips that can help you improve the yield and quality of your potato crop:
Plant in a sunny location with well-drained soil.
Mulch around the plants to help retain moisture and suppress weeds.
Provide support for the plants, especially in windy areas.
Harvest the potatoes when they are firm and have a smooth skin.
        '''

      },
      {
        "name" : "plantain",
        "image" : "assets/plantain.png",
        "molecule" : 300,
        "momth": "jun-sep",
        "water" :"1-2",
        "temp": "25-30",
        "light":"8-12",
        "text": ''''
        Introduction

The plantain (Musa × paradisiaca) is a starchy fruit that is a staple food for over 100 million people worldwide. It is a tropical crop that prefers a warm, humid climate. It can be grown in a variety of soil types, but it does best in well-drained, sandy loam soil.

Practices

Land preparation

The first step in plantain cultivation is to prepare the land. This involves clearing the land of weeds and debris, and then tilling the soil to a depth of 10-15 centimeters. If the soil is poor, it may be necessary to add compost or manure to improve fertility.

Planting

Plantains are planted from suckers, which are young plants that grow from the roots of a mature plant. The suckers should be planted in rows that are 1-2 meters apart, with plants spaced 50-60 centimeters apart within the rows.

Fertilization

Plantains are heavy feeders, so it is important to fertilize the crop regularly. A balanced fertilizer, such as 10-10-10, should be applied at a rate of 100-150 kilograms per hectare.

Weed control

Weeds can compete with plantains for water and nutrients, so it is important to control them throughout the growing season. Weeds can be controlled by hand weeding, hoeing, or using herbicides.

Irrigation

Plantains are a drought-tolerant crop, but they will produce higher yields if they are irrigated during periods of dry weather.

Pest and disease control

Plantains are susceptible to a number of pests and diseases, including mealybugs, banana bunchy top virus, and black sigatoka. It is important to monitor the crop for pests and diseases and to take appropriate control measures if necessary.

Harvesting

Plantains are ready to harvest 10-12 months after planting. The bananas should be harvested when they are fully ripe, with a yellow skin. The bananas should be handled carefully to avoid bruising.

Conditions

Plantains are a tropical crop that prefers a warm, humid climate. It can be grown in a variety of soil types, but it does best in well-drained, sandy loam soil. Plantains are a drought-tolerant crop, but they will produce higher yields if they are irrigated during periods of dry weather.

Best practices

Use high-quality suckers

High-quality suckers will produce stronger plants with higher yields. Suckers should be taken from healthy, disease-free plants.

Plant at the right time

Plantains should be planted at the beginning or end of the rainy season. Planting during the rainy season will help to ensure that the crop has adequate water.

Fertilize regularly

Plantains are heavy feeders, so it is important to fertilize the crop regularly. A balanced fertilizer, such as 10-10-10, should be applied at a rate of 100-150 kilograms per hectare.

Control weeds

Weeds can compete with plantains for water and nutrients, so it is important to control them throughout the growing season. Weeds can be controlled by hand weeding, hoeing, or using herbicides.

Irrigate as needed

Plantains are a drought-tolerant crop, but they will produce higher yields if they are irrigated during periods of dry weather.

Monitor for pests and diseases

Plantains are susceptible to a number of pests and diseases, so it is important to monitor the crop for pests and diseases and to take appropriate control measures if necessary.

Harvest at the right time

Plantains are ready to harvest 10-12 months after planting. The bananas should be harvested when they are fully ripe, with a yellow skin. The bananas should be handled carefully to avoid bruising.

By following these practices and conditions, you can improve the yield and quality of your plantain crop.

Additional tips

In addition to the above practices, there are a few additional tips that can help you improve the yield and quality of your plantain crop:
Plant in a sunny location with well-drained soil.
Mulch around the plants to help retain moisture and suppress weeds.
Provide support for the plants, especially in windy areas.
Harvest the bananas when they are fully ripe for the best flavor and nutrition.

        '''''
      },
      {
        "name" : "casava",
        "image" : "assets/manioc.png",
        "molecule" : 400,
        "momth": "jun",
        "water" : "1-2",
        "temp": "25-30",
        "light":"8-12" ,
        "text": '''
        
Bien sûr, voici un guide détaillé sur la culture du manioc, avec des pratiques exemplaires et des conditions adéquates :

Introduction

Cassava (Manihot esculenta) is a starchy tuber crop that is a staple food for over 800 million people worldwide. It is a drought-tolerant crop that can be grown in a variety of soil types, making it a popular choice for farmers in developing countries.

Practices

Land preparation

The first step in cassava cultivation is to prepare the land. This involves clearing the land of weeds and debris, and then tilling the soil to a depth of 10-15 centimeters. If the soil is poor, it may be necessary to add compost or manure to improve fertility.

Planting

Cassava is planted from cuttings, which are 30-40 centimeters long pieces of the stem. The cuttings should be planted in rows that are 1-2 meters apart, with plants spaced 50-60 centimeters apart within the rows.

Fertilization

Cassava is a heavy feeder, so it is important to fertilize the crop regularly. A balanced fertilizer, such as 10-10-10, should be applied at a rate of 100-150 kilograms per hectare.

Weed control

Weeds can compete with cassava for water and nutrients, so it is important to control them throughout the growing season. Weeds can be controlled by hand weeding, hoeing, or using herbicides.

Irrigation

Cassava is a drought-tolerant crop, but it will produce higher yields if it is irrigated during periods of dry weather.

Pest and disease control

Cassava is susceptible to a number of pests and diseases, including mealybugs, cassava mosaic virus, and cassava bacterial blight. It is important to monitor the crop for pests and diseases and to take appropriate control measures if necessary.

Harvesting

Cassava is ready to harvest 8-12 months after planting. The roots should be harvested with a hoe or shovel, taking care not to damage the leaves. The roots should be washed and then peeled before use.

Conditions

Cassava is a tropical crop that prefers a warm, humid climate. It can be grown in a variety of soil types, but it does best in well-drained, sandy loam soil. Cassava is a drought-tolerant crop, but it will produce higher yields if it is irrigated during periods of dry weather.

Best practices

Use high-quality cuttings

High-quality cuttings will produce stronger plants with higher yields. Cuttings should be taken from healthy, disease-free plants.

Plant at the right time

Cassava should be planted at the beginning or end of the rainy season. Planting during the rainy season will help to ensure that the crop has adequate water.

Fertilize regularly

Cassava is a heavy feeder, so it is important to fertilize the crop regularly. A balanced fertilizer, such as 10-10-10, should be applied at a rate of 100-150 kilograms per hectare.

Control weeds

Weeds can compete with cassava for water and nutrients, so it is important to control them throughout the growing season. Weeds can be controlled by hand weeding, hoeing, or using herbicides.

Irrigate as needed

Cassava is a drought-tolerant crop, but it will produce higher yields if it is irrigated during periods of dry weather.

Monitor for pests and diseases

Cassava is susceptible to a number of pests and diseases, so it is important to monitor the crop for pests and diseases and to take appropriate control measures if necessary.

Harvest at the right time

Cassava roots are ready to harvest 8-12 months after planting. The roots should be harvested with a hoe or shovel, taking care not to damage the leaves. The roots should be washed and then peeled before use.

By following these practices and conditions, you can improve the yield and quality of your cassava crop.
        '''
      }
     ];
    // TODO: implement build
    return Scaffold(

        body:
            // Stack(
            //   children: [
            //     Container(
            //       width: 200,
            //       height: 200,
            //       color: Colors.blue,
            //     ),
            //     Positioned(
            //       top: 120,
            //       left: 50,
            //       child: Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.red,
            //       ),
            //     ),
            //   ],
            // )

            Stack(
                alignment: AlignmentDirectional.center,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Container(
                width: screenWidth,
                height: screenHeight,
              ),
              Positioned(
                bottom: 450,
                child: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.62,
                            image: AssetImage("assets/culture.png"),
                            fit: BoxFit.cover)))
                .animate()
                .slideY(duration: const Duration(milliseconds: 500), curve: Curves.easeOut),
              ),
              Positioned(
                top: 300,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(300, 80),
                          topRight: Radius.elliptical(280, 80))),
                  width: screenWidth,
                  height: screenHeight * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ListView.builder(
                        itemCount: 120,
                        itemBuilder: (context, index) {
                          return Center(
                              child: SizedBox(
                            width: screenWidth * 0.95,
                            //height: 480,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Culture",
                                        style: GoogleFonts.roboto(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500)),
                                    ...culture
                                        .map((e) => GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder( settings :RouteSettings(name: "details" , arguments: e) ,pageBuilder: (_, __, ___) => CultureDetails()));
                                          },
                                          child: SizedBox(child: SizedBox(
                                      height:110,
                                            child: Card(
                                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),

                                      color: Colors.black,
                                      child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                children: [
                                                Builder(builder: (context) {
                                                  var mediaQuery = MediaQuery.of(context);
                                                  double widgetnWidth = mediaQuery.size.width;
                                                  double widgetHeight = mediaQuery.size.height;
                                                  return SizedBox(
                                                    width: widgetnWidth * 0.420,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Image.asset(
                                                              e["image"],

                                                          ),
                                                        ),

                                                        Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                e["name"], style: GoogleFonts.roboto(
                                                                  color: Colors.white,
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.w500
                                                              ),

                                                              ),
                                                              Row(
                                                                  children: [
                                                                    Icon(Icons.water_drop_outlined, color: Color(0xFFBEBEBE),size: 15,),
                                                                    Text(
                                                                        "${e["molecule"]} mol", style: GoogleFonts.roboto(
                                                                        color: Color(0xFFBEBEBE)
                                                                    )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                    ),
                                                  );
                                                }),

                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                                      child: SizedBox(
                                                        height: 50,
                                                        child: CircleAvatar(
                                                          backgroundColor: Colors.white,
                                                          radius: 50,
                                                          child: Icon(Icons.water_drop_outlined, color: Colors.black,),
                                                        ),
                                                      ),
                                                    ),
                                                  )




                                              ]
                                            )
                                      ),
                                    )
                                            .animate()
                                            .slideY( duration: const Duration(milliseconds: 500,) ,curve: Curves.easeInOutCubicEmphasized ,),
                                          )),
                                        ))
                                  ],
                                ),
                              ),
                            )
                                .animate()
                                .slideX( duration: const Duration(milliseconds: 500,) ,curve: Curves.easeInOut ,),
                          ));
                        }),
                  ),
                  //child: Text("Culture"),
                ),
              )
            ]));
  }
}
