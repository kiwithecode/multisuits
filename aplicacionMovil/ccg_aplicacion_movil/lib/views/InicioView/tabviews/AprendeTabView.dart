
import 'package:flutter/material.dart';

import '../../../components/cards/CustomCard.dart';

class AprendeTabView extends StatelessWidget {
  const AprendeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagenes = [
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254171/media_library_export-testingdeveloper-2023_06_08_14_48_20/parejasa-scaled_oymxxr.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254172/media_library_export-testingdeveloper-2023_06_08_14_48_20/pexels-askar-abayev-5638602-scaled_t2lotn.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254157/media_library_export-testingdeveloper-2023_06_08_14_48_20/100980512_chicas_xkuhmo.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254166/media_library_export-testingdeveloper-2023_06_08_14_48_20/donativos-scaled_drmmu2.jpg",
      
    ];
    return ListView(
      children:[
       
        CustomCard(
          imagen: imagenes[0],
          titulo: "Taller de pareja",
          subtitulo: "",
          onTap: ()=>{},
        
        ),
        CustomCard(
          imagen: imagenes[1],
          titulo: "Crecimiento y Cambio",
          subtitulo: "",
          onTap: ()=>{},
        
        ),
        CustomCard(
          imagen: imagenes[2],
          titulo: "Taller de Finanzas",
          subtitulo: "",
          onTap: ()=>{},
        
        ),
        CustomCard(
          imagen: imagenes[3],
          titulo: "Global University",
          subtitulo: "",
          onTap: ()=>{},
        
        ),
        
 
      ],
    );
  }
}