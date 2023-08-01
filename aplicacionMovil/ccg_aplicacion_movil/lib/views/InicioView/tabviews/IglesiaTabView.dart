
import 'package:ccg_aplicacion_movil/views/InicioView/tabviews/iglesiaTabViewPages/CultoEnLinea.dart';
import 'package:flutter/material.dart';

import '../../../components/cards/CustomCard.dart';
import '../../template/TemplateIglesia/TemplateRenace.dart';

class IglesiaTabView extends StatelessWidget {
  const IglesiaTabView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagenes = [
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254166/media_library_export-testingdeveloper-2023_06_08_14_48_20/dplnews_padres_hijos_as090719-696x391-1_snue0f.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254167/media_library_export-testingdeveloper-2023_06_08_14_48_20/gentee1_bzpmtj.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254164/media_library_export-testingdeveloper-2023_06_08_14_48_20/biblia-en-eBooks_i3jbq4.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254165/media_library_export-testingdeveloper-2023_06_08_14_48_20/cyc_ayucz7.jpg",
      "https://www.signupgenius.com/cms/socialMediaImages/get-to-know-you-questions-small-groups-article-1200x800.jpg",
    ];
    return ListView(
      children: [
        CustomCard(
          imagen: imagenes[0],
          titulo: "Culto en linea",
          subtitulo: "",
          onTap: ()=>{
          },
        
        ),
       
        CustomCard(
          imagen: imagenes[1],
          titulo: "Oracion",
          subtitulo: "",
          onTap: ()=>{},
        
        ),
        
        CustomCard(
          imagen: imagenes[2],
          titulo: "Devocional",
          subtitulo: "",
          onTap: ()=>{},
        
        ),

        CustomCard(
          imagen: imagenes[3],
          titulo: "Renace",
          subtitulo: "",
          onTap: ()=>{
            Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => TemplateRenace()),)
          },
        
        ),

        CustomCard(
          imagen: imagenes[4],
          titulo: "Grupos pequeños",
          subtitulo: "",
          onTap: ()=>{},
        
        ),
      ],
    );
  }
}