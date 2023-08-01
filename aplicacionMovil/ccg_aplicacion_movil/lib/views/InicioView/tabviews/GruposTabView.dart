


import 'package:flutter/material.dart';

import '../../../components/cards/CustomCard.dart';
import '../../template/TemplateGrupos/TemplateA.dart';
import '../../template/TemplateGrupos/TemplateF.dart';
import '../../template/TemplateGrupos/TemplateGA.dart';
import '../../template/TemplateGrupos/TemplateJ.dart';
import '../../template/TemplateGrupos/TemplateJA.dart';
import '../../template/TemplateGrupos/TemplateN.dart';

class GruposTabView extends StatelessWidget {
  const GruposTabView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagenes = [
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254171/media_library_export-testingdeveloper-2023_06_08_14_48_20/ni%C3%B1os/341188432_559742062930393_4870644772663594919_n_whqa1l.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254159/media_library_export-testingdeveloper-2023_06_08_14_48_20/345190301_895355541532170_4208964079348621589_n_drygrs.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254157/media_library_export-testingdeveloper-2023_06_08_14_48_20/350779327_1414950782627803_8715759350094241419_n_zys1eg.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254159/media_library_export-testingdeveloper-2023_06_08_14_48_20/44937854_2346417578733361_3936124367557099520_n_ozknuc.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254172/media_library_export-testingdeveloper-2023_06_08_14_48_20/pexels-elina-fairytale-3807571-scaled_tgcrks.jpg",
      "https://res.cloudinary.com/doneqqziy/image/upload/v1686254171/media_library_export-testingdeveloper-2023_06_08_14_48_20/pexels-andrea-piacquadio-3755440-scaled_tmu8go.jpg"
      
    ];
    return ListView(
      children:[
        CustomCard(
          imagen: imagenes[0],
          titulo: "Niños",
          subtitulo: "",
          onTap: ()=>{
             Navigator.push(
               context,
              MaterialPageRoute(builder: (context) => TemplateN()),
    )
          },
        
        ),
        CustomCard(
          imagen: imagenes[1],
          titulo: "Adolecentes",
          subtitulo: "",
          onTap: ()=>{
             Navigator.push(
               context,
              MaterialPageRoute(builder: (context) => TemplateA()),
    )
          },
        
        ),
        CustomCard(
          imagen: imagenes[2],
          titulo: "Jóvenes",
          subtitulo: "",
          onTap: ()=>{Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => TemplateJ()),)},
        
        ),
        
        CustomCard(
          imagen: imagenes[3],
          titulo: "Jóvenes adultos",
          subtitulo: "",
          onTap: ()=>{Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => TemplateJA()),)},
        
        ),

        CustomCard(
          imagen: imagenes[4],
          titulo: "Familia",
          subtitulo: "",
          onTap: ()=>{Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => TemplateF()),)},
        
        ),
        CustomCard(
          imagen: imagenes[5],
          titulo: "Grupos de Apoyo",
          subtitulo: "",
          onTap: ()=>{Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => TemplateGA()),)},
        
        ),

      ],
    );
  }
}