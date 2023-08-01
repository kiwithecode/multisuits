import 'package:flutter/material.dart';


class ConsolidarView extends StatelessWidget {
  const ConsolidarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consolidar"),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   ConsolidarProvider consolidarProvider = Provider.of<ConsolidarProvider>(context);

  //   List<Widget> stepsScreens = [
  //     const Consolidacion_PedirCedula(),
  //     const Consolidacion_SeleccioneAdapte(),
  //     const Consolidacion_Bautizo_hoy(),
  //     const Consolidacion_DatosPersonales(),
  //     const Consolidacion_AsisteGrupoFamiliar(),
  //     const Consolidacion_SeleccionarLider(),
  //     const Consolidacion_QuieresSerParteCCG(),
  //     const Consolidacion_QuieresSerParteGrupoFamiliar(),
  //     // Consolidacion_DatosContacto(),
  //     // Consolidacion_DatosCCG(),
  //   ];

  //   consolidarProvider.steps = stepsScreens.map((e) {
  //     int index = stepsScreens.indexOf(e);
  //     return Step(
  //       state: consolidarProvider.step == index ? StepState.editing : consolidarProvider.step > index ? StepState.complete : StepState.disabled,
  //       title: const Text(""),
  //       isActive: consolidarProvider.step == index ? true : consolidarProvider.step > index ? true : false,
  //       // label: Text("General"),
  //       content: e,
  //     );
  //   }).toList();


  //   return Theme(
  //     data: getGlobalThemeDataTMP(),
  //     // data: getGlobalThemeData(),
  //     // data: ThemeData.light(),
  //     child: Scaffold(
  //       body: Stepper(
  //         physics: const ScrollPhysics(),
  //         elevation: 0,
  //         onStepTapped: (value) => consolidarProvider.step = value,
  //         type: StepperType.vertical,
  //         currentStep: consolidarProvider.step,
  //         controlsBuilder: (BuildContext context, ControlsDetails details) {
  //           return Container();
  //         },
  //         onStepContinue: () {
  //           consolidarProvider.next();
  //         },
  //         onStepCancel: () {},
  //         steps: consolidarProvider.steps,
  //       )
  //     ),
  //   );
  // }
}
