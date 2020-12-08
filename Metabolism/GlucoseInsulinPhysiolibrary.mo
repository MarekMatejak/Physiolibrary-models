within Metabolism;
package GlucoseInsulinPhysiolibrary
  package Components

    model InsulinProductionRate
      extends Physiolibrary.Icons.Pancreas;
      Physiolibrary.Types.RealIO.ConcentrationInput glucoseConcentration
        annotation (Placement(transformation(extent={{-90,52},{-50,92}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-10,46})));

      constant Modelica.SIunits.MolarMass glucoseMolarMass = 0.180156; //glucoseMolarMass = 0.180156 kg/mol;
      Physiolibrary.Types.MassConcentration glucoseMassConcentration;
      parameter Real Fi=0.51; //glucoseConcentrationTreshold in mg/ml;
      Physiolibrary.Types.MassConcentration glucoseConcentrationTreshold=Fi; //mg/ml = kg/m3
      parameter Real B=1430; //insulinProductionCoefficient in ml*mU/mg/hour
      Real insulinProductionCoefficient=B*0.001/3600; //in m3*U/kg/sec
      Physiolibrary.Types.MolarFlowRate insulinProduction;
      Physiolibrary.Obsolete.ObsoleteChemical.Interfaces.ChemicalPort_b
        insulinOutflow annotation (Placement(transformation(extent={{-362,-12},
                {-342,8}}), iconTransformation(extent={{72,46},{92,66}})));
    equation

      glucoseMassConcentration = glucoseConcentration*glucoseMolarMass;
      insulinProduction = if (glucoseMassConcentration>glucoseConcentrationTreshold)
            then (insulinProductionCoefficient*(glucoseMassConcentration-glucoseConcentrationTreshold))
     else
         0;
      insulinOutflow.q=-insulinProduction;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                              Text(
              extent={{-176,-100},{158,-136}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid,
              textString="%name"), Rectangle(extent={{-100,100},{100,-100}},
                lineColor={28,108,200})}),
                                     Diagram(coordinateSystem(preserveAspectRatio=false)));
    end InsulinProductionRate;

    model GlucoseRenalExcretion
      extends Physiolibrary.Icons.Kidney;
      Physiolibrary.Obsolete.ObsoleteChemical.Interfaces.ChemicalPort_a
        glucoseInflowPort annotation (Placement(transformation(extent={{-90,-4},
                {-70,16}}), iconTransformation(extent={{8,-12},{32,12}})));
      parameter Physiolibrary.Types.VolumeFlowRate glomerularFlowRate = 120;//[ml/sec]; mu =7200 ml/min = 7200/60 = 120 [ml/sec]
      parameter Modelica.SIunits.MolarMass molarMass = 0.180156; //glucoseMolarMass = 0.180156 kg/mol;
      parameter Real theta=2.5; //theta = 2.5  Glucose threshod concentration in [mg/ml]
                      // Conversion to SI [mg/ml]-> [kg/m3]:
                      //                    1 [mg] = 10E-6 [kg]
                      //                    1 [ml] = 10E-6 [m3]
                      //                    1 [mg/ml] = 1 [kg/m3]
                      //                    2.5 [mg/ml] = 2.5 [kg/m3] = theta
      Physiolibrary.Types.MassConcentration glucoseMassTresholdConcentration = theta; //Glucose threshod concentration in [kg/m3] SI
      Physiolibrary.Types.Concentration glucoseTresholdConcentration = theta/molarMass;
      Physiolibrary.Types.Concentration glucosePlasmaConcentration;
    equation
      glucosePlasmaConcentration = glucoseInflowPort.conc;
      glucoseInflowPort.q = if (glucosePlasmaConcentration > glucoseTresholdConcentration)
                            then glomerularFlowRate*(glucosePlasmaConcentration - glucoseTresholdConcentration)
                            else 0;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                              Text(
              extent={{-178,-110},{178,-144}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid,
              textString="%name"), Rectangle(extent={{-100,100},{100,-100}},
                lineColor={28,108,200})}),
                                     Diagram(coordinateSystem(preserveAspectRatio=false)));
    end GlucoseRenalExcretion;

    model GlucoseInsulinDependendUtilisation
    extends Physiolibrary.Icons.Cell;

      Physiolibrary.Obsolete.ObsoleteChemical.Interfaces.ChemicalPort_a
        glucoseInflow annotation (Placement(transformation(extent={{-88,54},{-68,
                74}}), iconTransformation(extent={{-8,-14},{12,6}})));
      Physiolibrary.Types.RealIO.ConcentrationInput insulinConcentration
        annotation (Placement(transformation(extent={{-98,-26},{-58,14}}),
            iconTransformation(extent={{-112,-62},{-72,-22}})));
      parameter Real Nu = 139000; //insulin receptor sensitivity parameter in [ml*ml/mU/hour]
      Real insulinReceptorSensitivity = Nu * 1e-9/3600; // //insulin receptor sensitivity parameter in [m3*m3/U/sec]

      Physiolibrary.Types.MassConcentration glucoseMassConcentration;
      Physiolibrary.Types.MassFlowRate glucoseMassInflow;
      constant Modelica.SIunits.MolarMass glucoseMolarMass = 0.180156; //glucoseMolarMass = 0.180156 kg/mol;
    equation
       glucoseMassConcentration = glucoseInflow.conc*glucoseMolarMass;
       glucoseMassInflow=glucoseMassConcentration*insulinConcentration*insulinReceptorSensitivity;
       glucoseInflow.q=glucoseMassInflow/glucoseMolarMass;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
              extent={{-280,-108},{286,-142}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid,
              textString="%name"), Rectangle(extent={{-100,100},{98,-100}},
                lineColor={28,108,200})}),
                                     Diagram(coordinateSystem(preserveAspectRatio=false)));
    end GlucoseInsulinDependendUtilisation;

    model MassToMolarConcentration
      Physiolibrary.Types.RealIO.MassConcentrationInput massConcentration
        annotation (Placement(transformation(extent={{-118,-20},{-78,20}}),
            iconTransformation(extent={{-124,-20},{-84,20}})));
      Physiolibrary.Types.RealIO.ConcentrationOutput concentration annotation (
          Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{84,-16},{122,22}})));
      parameter Modelica.SIunits.MolarMass molarMass = 0.180156; //glucoseMolarMass = 0.180156 kg/mol;

    equation
        concentration = massConcentration/molarMass;

      annotation (Icon(graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid), Text(
              extent={{-220,-102},{220,-122}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.None,
              textString="%name")}));
    end MassToMolarConcentration;

    model MolarToMassConcentration
    extends Modelica.Icons.RotationalSensor;
      Physiolibrary.Types.RealIO.ConcentrationInput concentration
        annotation (Placement(transformation(extent={{-186,16},{-146,56}}),
            iconTransformation(extent={{-116,-18},{-76,22}})));
      Physiolibrary.Types.RealIO.MassConcentrationOutput massConcentration annotation (
          Placement(transformation(extent={{-304,76},{-284,96}}),
            iconTransformation(extent={{84,-16},{122,22}})));
      parameter Modelica.SIunits.MolarMass molarMass = 0.180156; //glucoseMolarMass = 0.180156 kg/mol;

    equation
        concentration = massConcentration/molarMass;
      annotation (Icon(graphics={             Text(
              extent={{-320,-100},{320,-120}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.None,
              textString="%name")}));
    end MolarToMassConcentration;

    model MassToMolarFlow
      parameter Modelica.SIunits.MolarMass molarMass = 0.180156; //glucoseMolarMass = 0.180156 kg/mol;

      Physiolibrary.Types.RealIO.MassFlowRateInput massflowrate annotation (
          Placement(transformation(extent={{-380,-8},{-340,32}}),
            iconTransformation(extent={{-124,-18},{-84,22}})));
      Physiolibrary.Types.RealIO.MolarFlowRateOutput molarflowrate annotation (
          Placement(transformation(extent={{-368,14},{-348,34}}),
            iconTransformation(extent={{90,-10},{116,16}})));
    equation
        molarflowrate = massflowrate/molarMass;

      annotation (Icon(graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid), Text(
              extent={{-220,-102},{220,-122}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.None,
              textString="%name")}));
    end MassToMolarFlow;

    model MolarToMassFlow
    extends Modelica.Icons.RotationalSensor;
      Physiolibrary.Types.RealIO.MolarFlowRateInput molarFlow
        annotation (Placement(transformation(extent={{-186,16},{-146,56}}),
            iconTransformation(extent={{-116,-18},{-76,22}})));
      Physiolibrary.Types.RealIO.MassFlowRateOutput massFlow annotation (
          Placement(transformation(extent={{-304,76},{-284,96}}),
            iconTransformation(extent={{84,-16},{122,22}})));
      constant Modelica.SIunits.MolarMass glucoseMolarMass = 0.180156; //glucoseMolarMass = 0.180156 kg/mol;

    equation
        molarFlow = massFlow/glucoseMolarMass;
      annotation (Icon(graphics={             Text(
              extent={{-320,-100},{320,-120}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.None,
              textString="%name")}));
    end MolarToMassFlow;

    model GlucoseIndependentDependendUtilisation
    extends Physiolibrary.Icons.Cell;

      Physiolibrary.Obsolete.ObsoleteChemical.Interfaces.ChemicalPort_a
        glucoseInflow annotation (Placement(transformation(extent={{-88,54},{-68,
                74}}), iconTransformation(extent={{-8,-14},{12,6}})));
      parameter Real Lambda = 2470; //clearance in [ml/hour]
      Physiolibrary.Types.VolumeFlowRate glucoseClearance = Lambda*1e-6/3600; // glucose clearance in SI [m3/sec]

      Physiolibrary.Types.MassConcentration glucoseMassConcentration;
      Physiolibrary.Types.MassFlowRate glucoseMassInflow;
      constant Modelica.SIunits.MolarMass glucoseMolarMass = 0.180156; //glucoseMolarMass = 0.180156 kg/mol;
    equation
       glucoseMassConcentration = glucoseInflow.conc*glucoseMolarMass;
       glucoseMassInflow=glucoseMassConcentration*glucoseClearance;
       glucoseInflow.q=glucoseMassInflow/glucoseMolarMass;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
              extent={{-280,-108},{286,-142}},
              lineColor={28,108,200},
              fillColor={255,255,0},
              fillPattern=FillPattern.Solid,
              textString="%name"), Rectangle(extent={{-100,100},{98,-100}},
                lineColor={28,108,200})}),
                                     Diagram(coordinateSystem(preserveAspectRatio=false)));
    end GlucoseIndependentDependendUtilisation;
  end Components;

  package Models
    model Glucose_insulin_model
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Substance insulin(
          useNormalizedVolume=false, solute_start=0.851)
        annotation (Placement(transformation(extent={{-22,-50},{-2,-30}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Substance glucose(
          useNormalizedVolume=false, solute_start=0.0675248)
        "1 mmol  = 180156mg; initial 12165 mg = 12165/180156 = 67.5248 mmol"
        annotation (Placement(transformation(extent={{-8,28},{12,48}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst GlucoceInputFlowRate(k=0.0084/
            0.180156/3600)
        annotation (Placement(transformation(extent={{-74,52},{-58,62}})));
      Physiolibrary.Types.Constants.VolumeConst ECF_Volume(k(displayUnit="ml")=
          0.015) annotation (Placement(transformation(extent={{-44,68},{-30,78}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sources.UnlimitedSolutePump
        glucoseInput(useSoluteFlowInput=true)
        annotation (Placement(transformation(extent={{-46,28},{-26,48}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Clearance
        insulinDestructionRate(Clearance=7600e-6/3600, useSolutionFlowInput=
            false)
        annotation (Placement(transformation(extent={{44,-50},{64,-30}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.ConcentrationMeasure
        molarGlucoseConcentration
        annotation (Placement(transformation(extent={{20,28},{38,48}})));
      Components.GlucoseRenalExcretion glucoseRenalExcretion annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={68,70})));
      Components.GlucoseInsulinDependendUtilisation
        glucoseInsulinDependendUtilisation
        "Nu insulin receptor sesitivity [ml ml/mU/hour] - decrease in diabetes type 2"
        annotation (Placement(transformation(extent={{58,0},{78,20}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.ConcentrationMeasure
        molarGlucoseConcentration1 annotation (Placement(transformation(
            extent={{-9,-10},{9,10}},
            rotation=180,
            origin={23,-40})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Clearance
        insulinIndependentUtilisation(
        Clearance(displayUnit="m3/s") = 2470e-6/3600,
        K=1/0.180156,
        useSolutionFlowInput=false)
        annotation (Placement(transformation(extent={{60,26},{84,50}})));
      Components.InsulinProductionRate insulinProductionRate
        "B - insulin production rate coefficient [ml mU/mg/hour] - decrease in diabetes type 1"
        annotation (Placement(transformation(extent={{-76,-56},{-56,-36}})));
    equation
      connect(glucoseInput.q_out,glucose. q_out) annotation (Line(
          points={{-26,38},{2,38}},
          color={107,45,134},
          thickness=1));
      connect(glucoseInput.soluteFlow, GlucoceInputFlowRate.y)
        annotation (Line(points={{-32,42},{-32,57},{-56,57}},    color={0,0,127},
          smooth=Smooth.Bezier));

      connect(insulin.q_out,insulinDestructionRate. q_in) annotation (Line(
          points={{-12,-40},{44,-40}},
          color={107,45,134},
          thickness=1));
      connect(glucose.q_out, molarGlucoseConcentration.q_in) annotation (Line(
          points={{2,38},{29,38}},
          color={107,45,134},
          thickness=1));
      connect(insulin.q_out, molarGlucoseConcentration1.q_in) annotation (Line(
          points={{-12,-40},{23,-40}},
          color={107,45,134},
          thickness=1));
      connect(molarGlucoseConcentration1.concentration,
        glucoseInsulinDependendUtilisation.insulinConcentration) annotation (
          Line(points={{23,-32},{23,5.8},{58.8,5.8}}, color={0,0,127},
          smooth=Smooth.Bezier));
      connect(insulin.q_out, insulinProductionRate.insulinOutflow) annotation (
          Line(
          points={{-12,-40},{-57.8,-40},{-57.8,-40.4}},
          color={107,45,134},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(glucose.solutionVolume, ECF_Volume.y) annotation (Line(
          points={{-2,42},{-2,42},{-2,60},{-2,73},{-28.25,73}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(insulin.solutionVolume, ECF_Volume.y) annotation (Line(
          points={{-16,-36},{-16,-36},{-16,64},{-16,73},{-28.25,73}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(molarGlucoseConcentration.concentration, insulinProductionRate.glucoseConcentration)
        annotation (Line(
          points={{29,30},{29,8},{-67,8},{-67,-41.4}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(molarGlucoseConcentration.q_in, insulinIndependentUtilisation.q_in)
        annotation (Line(
          points={{29,38},{60,38}},
          color={107,45,134},
          thickness=1));
      connect(glucose.q_out, insulinIndependentUtilisation.q_in) annotation (
          Line(
          points={{2,38},{60,38}},
          color={107,45,134},
          thickness=1));
      connect(glucoseRenalExcretion.glucoseInflowPort,
        insulinIndependentUtilisation.q_in) annotation (Line(
          points={{70,70},{44,70},{44,38},{60,38}},
          color={107,45,134},
          thickness=1));
      connect(glucoseInsulinDependendUtilisation.glucoseInflow,
        insulinIndependentUtilisation.q_in) annotation (Line(
          points={{68.2,9.6},{44,9.6},{44,38},{60,38}},
          color={107,45,134},
          thickness=1));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false)),
        Diagram(coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=1000,
          __Dymola_NumberOfIntervals=5000,
          __Dymola_Algorithm="Dassl"));
    end Glucose_insulin_model;
  end Models;

  package Test

    model MassToMolarTest
      Components.MassToMolarConcentration massToMolarConcentration
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Physiolibrary.Types.Constants.MassConcentrationConst massConcentration(k(
            displayUnit="g/l") = 0.811)
        annotation (Placement(transformation(extent={{-68,-4},{-60,4}})));
      Components.MolarToMassConcentration molarToMassConcentration
        annotation (Placement(transformation(extent={{0,30},{20,50}})));
    equation
      connect(massConcentration.y, massToMolarConcentration.massConcentration)
        annotation (Line(points={{-59,0},{-0.4,0}}, color={0,0,127}));
      connect(massToMolarConcentration.concentration, molarToMassConcentration.concentration)
        annotation (Line(points={{20.3,0.3},{40,0.3},{40,18},{-20,18},{-20,40.2},
              {0.4,40.2}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end MassToMolarTest;

    model glucoseInsulinDependentUtilisationTest
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k(
            displayUnit="mmol/ml") = 56.7)
        annotation (Placement(transformation(extent={{-12,-44},{-4,-36}})));
      Components.GlucoseInsulinDependendUtilisation
        glucoseInsulinDependendUtilisation(Nu=139000)
        annotation (Placement(transformation(extent={{70,-6},{90,14}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.ConcentrationMeasure
        molarGlucoseConcentration annotation (Placement(transformation(
            extent={{-9,-10},{9,10}},
            rotation=180,
            origin={49,4})));
      Components.MolarToMassConcentration glucoseMassConcentration
        annotation (Placement(transformation(extent={{56,26},{76,46}})));
      Physiolibrary.Types.Constants.VolumeConst ECF_Volume(k(displayUnit="ml")=
             0.015)
                 annotation (Placement(transformation(extent={{-82,46},{-68,56}})));
      Physiolibrary.Types.Constants.MassFlowRateConst glucoseInflow(k(
            displayUnit="kg/s") = 0.0064/3600)
        annotation (Placement(transformation(extent={{-108,20},{-92,32}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        molarFlowMeasure1
        annotation (Placement(transformation(extent={{-8,-6},{12,14}})));
      Components.MassToMolarFlow massToMolarFlow
        annotation (Placement(transformation(extent={{-78,14},{-58,34}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Substance Glucose1(
          useNormalizedVolume=false, solute_start=0.0675248)
        "1 mmol  = 180156mg; initial 12165 mg = 12165/180156 = 67.5248 mmol"
        annotation (Placement(transformation(extent={{-44,-6},{-24,14}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sources.UnlimitedSolutePump
        unlimitedSolutePump(useSoluteFlowInput=true)
        annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
    equation
      connect(concentration.y, glucoseInsulinDependendUtilisation.insulinConcentration)
        annotation (Line(points={{-3,-40},{64,-40},{64,-0.2},{70.8,-0.2}},
            color={0,0,127}));
      connect(molarGlucoseConcentration.concentration, glucoseMassConcentration.concentration)
        annotation (Line(points={{49,12},{49,36.2},{56.4,36.2}}, color={0,0,127}));
      connect(molarGlucoseConcentration.q_in,
        glucoseInsulinDependendUtilisation.glucoseInflow) annotation (Line(
          points={{49,4},{64,4},{64,3.6},{80.2,3.6}},
          color={107,45,134},
          thickness=1));
      connect(molarFlowMeasure1.q_out, molarGlucoseConcentration.q_in)
        annotation (Line(
          points={{12,4},{49,4}},
          color={107,45,134},
          thickness=1));
      connect(Glucose1.q_out, molarFlowMeasure1.q_in) annotation (Line(
          points={{-34,4},{-8,4}},
          color={107,45,134},
          thickness=1));
      connect(ECF_Volume.y, Glucose1.solutionVolume) annotation (Line(points={{
              -66.25,51},{-38,51},{-38,8}}, color={0,0,127}));
      connect(glucoseInflow.y, massToMolarFlow.massflowrate) annotation (Line(
            points={{-90,26},{-84,26},{-84,24.2},{-78.4,24.2}}, color={0,0,127}));
      connect(massToMolarFlow.molarflowrate, unlimitedSolutePump.soluteFlow)
        annotation (Line(points={{-57.7,24.3},{-66,24.3},{-66,-6}}, color={0,0,
              127}));
      connect(unlimitedSolutePump.q_out, Glucose1.q_out) annotation (Line(
          points={{-60,-10},{-48,-10},{-48,4},{-34,4}},
          color={107,45,134},
          thickness=1));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
    end glucoseInsulinDependentUtilisationTest;

    model glucoseUtilisationTest
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k(
            displayUnit="mmol/ml") = 56.7)
        annotation (Placement(transformation(extent={{-12,-44},{-4,-36}})));
      Components.GlucoseInsulinDependendUtilisation
        glucoseInsulinDependendUtilisation
        annotation (Placement(transformation(extent={{70,-6},{90,14}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Substance Glucose(
          useNormalizedVolume=false, solute_start=0.0675248)
        "1 mmol  = 180156mg; initial 12165 mg = 12165/180156 = 67.5248 mmol"
        annotation (Placement(transformation(extent={{-28,-6},{-8,14}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.ConcentrationMeasure
        molarGlucoseConcentration annotation (Placement(transformation(
            extent={{-9,-10},{9,10}},
            rotation=180,
            origin={49,4})));
      Components.MolarToMassConcentration glucoseMassConcentration
        annotation (Placement(transformation(extent={{56,26},{76,46}})));
      Physiolibrary.Types.Constants.VolumeConst ECF_Volume(k(displayUnit="ml")=
             0.015)
                 annotation (Placement(transformation(extent={{-56,62},{-42,72}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sources.UnlimitedSolutePump
        GlucoseInput(useSoluteFlowInput=true)
        annotation (Placement(transformation(extent={{-88,-6},{-68,14}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst GlucoceInputFlowRate(k=0.0084/
            0.180156/3600)
        annotation (Placement(transformation(extent={{-96,58},{-80,68}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        molarFlowMeasure
        annotation (Placement(transformation(extent={{-54,-6},{-34,14}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        insulinDependentMolarFlowMeasure
        annotation (Placement(transformation(extent={{8,-4},{28,16}})));
      Components.GlucoseRenalExcretion glucoseRenalExcretion annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={60,86})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        insulinIndependentMolarFlowMeasure
        annotation (Placement(transformation(extent={{10,52},{30,72}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        kidneyMolarFlowMeasure
        annotation (Placement(transformation(extent={{10,80},{30,100}})));
      Components.MolarToMassFlow molarToMassFlowIndIndependent
        annotation (Placement(transformation(extent={{28,36},{48,56}})));
      Components.MolarToMassFlow molarToMassFlowKidney
        annotation (Placement(transformation(extent={{22,64},{42,84}})));
      Components.MolarToMassFlow molarToMassFlowInsDependent
        annotation (Placement(transformation(extent={{22,-28},{42,-8}})));
      Components.GlucoseIndependentDependendUtilisation
        glucoseIndependentDependendUtilisation(Lambda=2470)
        annotation (Placement(transformation(extent={{56,52},{76,72}})));
    equation
      connect(concentration.y, glucoseInsulinDependendUtilisation.insulinConcentration)
        annotation (Line(points={{-3,-40},{64,-40},{64,-0.2},{70.8,-0.2}},
            color={0,0,127}));
      connect(molarGlucoseConcentration.concentration, glucoseMassConcentration.concentration)
        annotation (Line(points={{49,12},{49,36.2},{56.4,36.2}}, color={0,0,127}));
      connect(ECF_Volume.y, Glucose.solutionVolume) annotation (Line(points={{
              -40.25,67},{-22,67},{-22,8}}, color={0,0,127}));
      connect(GlucoseInput.soluteFlow, GlucoceInputFlowRate.y)
        annotation (Line(points={{-74,8},{-74,63},{-78,63}}, color={0,0,127}));
      connect(molarGlucoseConcentration.q_in,
        glucoseInsulinDependendUtilisation.glucoseInflow) annotation (Line(
          points={{49,4},{64,4},{64,3.6},{80.2,3.6}},
          color={107,45,134},
          thickness=1));
      connect(GlucoseInput.q_out, molarFlowMeasure.q_in) annotation (Line(
          points={{-68,4},{-54,4}},
          color={107,45,134},
          thickness=1));
      connect(molarFlowMeasure.q_out, Glucose.q_out) annotation (Line(
          points={{-34,4},{-18,4}},
          color={107,45,134},
          thickness=1));
      connect(insulinDependentMolarFlowMeasure.q_out, molarGlucoseConcentration.q_in)
        annotation (Line(
          points={{28,6},{40,6},{40,4},{49,4}},
          color={107,45,134},
          thickness=1));
      connect(Glucose.q_out, insulinDependentMolarFlowMeasure.q_in) annotation (
         Line(
          points={{-18,4},{-6,4},{-6,6},{8,6}},
          color={107,45,134},
          thickness=1));
      connect(Glucose.q_out, insulinIndependentMolarFlowMeasure.q_in)
        annotation (Line(
          points={{-18,4},{-18,60},{10,60},{10,62}},
          color={107,45,134},
          thickness=1));
      connect(kidneyMolarFlowMeasure.q_in, insulinIndependentMolarFlowMeasure.q_in)
        annotation (Line(
          points={{10,90},{-18,90},{-18,60},{10,60},{10,62}},
          color={107,45,134},
          thickness=1));
      connect(kidneyMolarFlowMeasure.q_out, glucoseRenalExcretion.glucoseInflowPort)
        annotation (Line(
          points={{30,90},{46,90},{46,86},{62,86}},
          color={107,45,134},
          thickness=1));
      connect(molarToMassFlowIndIndependent.molarFlow,
        insulinIndependentMolarFlowMeasure.molarFlowRate) annotation (Line(
            points={{28.4,46.2},{20,46.2},{20,54}}, color={0,0,127}));
      connect(molarToMassFlowKidney.molarFlow, kidneyMolarFlowMeasure.molarFlowRate)
        annotation (Line(points={{22.4,74.2},{22.4,79.1},{20,79.1},{20,82}},
            color={0,0,127}));
      connect(molarToMassFlowInsDependent.molarFlow,
        insulinDependentMolarFlowMeasure.molarFlowRate) annotation (Line(points=
             {{22.4,-17.8},{18,-17.8},{18,-2}}, color={0,0,127}));
      connect(insulinIndependentMolarFlowMeasure.q_out,
        glucoseIndependentDependendUtilisation.glucoseInflow) annotation (Line(
          points={{30,62},{48,62},{48,61.6},{66.2,61.6}},
          color={107,45,134},
          thickness=1));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
    end glucoseUtilisationTest;

    model glucoseUtilisationTestWithClearance
      Components.GlucoseInsulinDependendUtilisation
        glucoseInsulinDependendUtilisation
        annotation (Placement(transformation(extent={{70,-6},{90,14}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Substance Glucose(
          useNormalizedVolume=false, solute_start=0.0675248)
        "1 mmol  = 180156mg; initial 12165 mg = 12165/180156 = 67.5248 mmol"
        annotation (Placement(transformation(extent={{-28,-8},{-8,12}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.ConcentrationMeasure
        molarGlucoseConcentration annotation (Placement(transformation(
            extent={{-9,-10},{9,10}},
            rotation=180,
            origin={49,4})));
      Components.MolarToMassConcentration glucoseMassConcentration
        annotation (Placement(transformation(extent={{56,26},{76,46}})));
      Physiolibrary.Types.Constants.VolumeConst ECF_Volume(k(displayUnit="ml")=
             0.015)
                 annotation (Placement(transformation(extent={{-56,62},{-42,72}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sources.UnlimitedSolutePump
        GlucoseInput(useSoluteFlowInput=true)
        annotation (Placement(transformation(extent={{-88,-6},{-68,14}})));
      Physiolibrary.Types.Constants.MolarFlowRateConst GlucoceInputFlowRate(k=0.0084/
            0.180156/3600)
        annotation (Placement(transformation(extent={{-96,58},{-80,68}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        molarFlowMeasure
        annotation (Placement(transformation(extent={{-54,-6},{-34,14}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        insulinDependentMolarFlowMeasure
        annotation (Placement(transformation(extent={{8,-4},{28,16}})));
      Components.GlucoseRenalExcretion glucoseRenalExcretion annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={60,86})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        insulinIndependentMolarFlowMeasure
        annotation (Placement(transformation(extent={{10,52},{30,72}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        kidneyMolarFlowMeasure
        annotation (Placement(transformation(extent={{10,80},{30,100}})));
      Components.MolarToMassFlow molarToMassFlowIndIndependent
        annotation (Placement(transformation(extent={{28,36},{48,56}})));
      Components.MolarToMassFlow molarToMassFlowKidney
        annotation (Placement(transformation(extent={{22,64},{42,84}})));
      Components.MolarToMassFlow molarToMassFlowInsDependent
        annotation (Placement(transformation(extent={{22,-28},{42,-8}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Clearance
        InsulinIndependentUtilisation(
        Clearance(displayUnit="m3/s") = 2470e-6/3600,
        K=1/0.180156,
        useSolutionFlowInput=false)
        annotation (Placement(transformation(extent={{54,50},{78,74}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Substance Insulin(
          useNormalizedVolume=false, solute_start=0.851)
        annotation (Placement(transformation(extent={{-34,-76},{-14,-56}})));
      Components.InsulinProductionRate insulinProductionRate
        annotation (Placement(transformation(extent={{-76,-82},{-56,-62}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Components.Clearance
        InsulinDestructionRate(Clearance=7600e-6/3600, useSolutionFlowInput=
            false)
        annotation (Placement(transformation(extent={{60,-80},{80,-60}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.ConcentrationMeasure
        insulinConcentration annotation (Placement(transformation(
            extent={{-9,-10},{9,10}},
            rotation=180,
            origin={23,-70})));
      Physiolibrary.Types.Constants.ConcentrationConst concentration(k(
            displayUnit="mmol/ml") = 56.7)
        annotation (Placement(transformation(extent={{14,-48},{22,-40}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        insulinInflow
        annotation (Placement(transformation(extent={{-52,-76},{-32,-56}})));
      Physiolibrary.Obsolete.ObsoleteChemical.Sensors.MolarFlowMeasure
        insulinOutflow
        annotation (Placement(transformation(extent={{34,-80},{54,-60}})));
    equation
      connect(molarGlucoseConcentration.concentration, glucoseMassConcentration.concentration)
        annotation (Line(points={{49,12},{49,36.2},{56.4,36.2}}, color={0,0,127}));
      connect(ECF_Volume.y, Glucose.solutionVolume) annotation (Line(points={{-40.25,
              67},{-22,67},{-22,6}},        color={0,0,127}));
      connect(GlucoseInput.soluteFlow, GlucoceInputFlowRate.y)
        annotation (Line(points={{-74,8},{-74,63},{-78,63}}, color={0,0,127}));
      connect(molarGlucoseConcentration.q_in,
        glucoseInsulinDependendUtilisation.glucoseInflow) annotation (Line(
          points={{49,4},{64,4},{64,3.6},{80.2,3.6}},
          color={107,45,134},
          thickness=1));
      connect(GlucoseInput.q_out, molarFlowMeasure.q_in) annotation (Line(
          points={{-68,4},{-54,4}},
          color={107,45,134},
          thickness=1));
      connect(molarFlowMeasure.q_out, Glucose.q_out) annotation (Line(
          points={{-34,4},{-28,4},{-28,2},{-18,2}},
          color={107,45,134},
          thickness=1));
      connect(insulinDependentMolarFlowMeasure.q_out, molarGlucoseConcentration.q_in)
        annotation (Line(
          points={{28,6},{40,6},{40,4},{49,4}},
          color={107,45,134},
          thickness=1));
      connect(Glucose.q_out, insulinDependentMolarFlowMeasure.q_in) annotation (
         Line(
          points={{-18,2},{-6,2},{-6,6},{8,6}},
          color={107,45,134},
          thickness=1));
      connect(Glucose.q_out, insulinIndependentMolarFlowMeasure.q_in)
        annotation (Line(
          points={{-18,2},{-18,60},{10,60},{10,62}},
          color={107,45,134},
          thickness=1));
      connect(kidneyMolarFlowMeasure.q_in, insulinIndependentMolarFlowMeasure.q_in)
        annotation (Line(
          points={{10,90},{-18,90},{-18,60},{10,60},{10,62}},
          color={107,45,134},
          thickness=1));
      connect(kidneyMolarFlowMeasure.q_out, glucoseRenalExcretion.glucoseInflowPort)
        annotation (Line(
          points={{30,90},{46,90},{46,86},{62,86}},
          color={107,45,134},
          thickness=1));
      connect(molarToMassFlowIndIndependent.molarFlow,
        insulinIndependentMolarFlowMeasure.molarFlowRate) annotation (Line(
            points={{28.4,46.2},{20,46.2},{20,54}}, color={0,0,127}));
      connect(molarToMassFlowKidney.molarFlow, kidneyMolarFlowMeasure.molarFlowRate)
        annotation (Line(points={{22.4,74.2},{22.4,79.1},{20,79.1},{20,82}},
            color={0,0,127}));
      connect(molarToMassFlowInsDependent.molarFlow,
        insulinDependentMolarFlowMeasure.molarFlowRate) annotation (Line(points=
             {{22.4,-17.8},{18,-17.8},{18,-2}}, color={0,0,127}));
      connect(insulinIndependentMolarFlowMeasure.q_out,
        InsulinIndependentUtilisation.q_in) annotation (Line(
          points={{30,62},{54,62}},
          color={107,45,134},
          thickness=1));
      connect(Insulin.solutionVolume, Glucose.solutionVolume) annotation (Line(
            points={{-28,-62},{-28,-22},{-32,-22},{-32,68},{-30,68},{-30,67},{
              -22,67},{-22,6}}, color={0,0,127}));
      connect(insulinProductionRate.glucoseConcentration,
        glucoseMassConcentration.concentration) annotation (Line(points={{-67,
              -67.4},{-67,18},{49,18},{49,36.2},{56.4,36.2}}, color={0,0,127}));
      connect(Insulin.q_out, insulinConcentration.q_in) annotation (Line(
          points={{-24,-66},{0,-66},{0,-70},{23,-70}},
          color={107,45,134},
          thickness=1));
      connect(insulinProductionRate.insulinOutflow, insulinInflow.q_in)
        annotation (Line(
          points={{-57.8,-66.4},{-54,-66.4},{-54,-66},{-52,-66}},
          color={107,45,134},
          thickness=1));
      connect(Insulin.q_out, insulinInflow.q_out) annotation (Line(
          points={{-24,-66},{-32,-66}},
          color={107,45,134},
          thickness=1));
      connect(insulinConcentration.q_in, insulinOutflow.q_in) annotation (Line(
          points={{23,-70},{34,-70}},
          color={107,45,134},
          thickness=1));
      connect(insulinOutflow.q_out, InsulinDestructionRate.q_in) annotation (
          Line(
          points={{54,-70},{60,-70}},
          color={107,45,134},
          thickness=1));
      connect(insulinConcentration.concentration,
        glucoseInsulinDependendUtilisation.insulinConcentration) annotation (
          Line(points={{23,-62},{23,-48},{60,-48},{60,-0.2},{70.8,-0.2}}, color=
             {0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
    end glucoseUtilisationTestWithClearance;
  end Test;

  package Types
    replaceable type InsulinUnit = Real (quantity "InsulinUnit", unit = "IU", displayUnit = "mIU", nominal = 1e-3);
    replaceable type InsulinConcentration =
                      Real (quantity "InsulinConcentration", unit = "IU/m3", displayUnit = "mIU/l", nominal = 1);
  end Types;
  annotation ();
end GlucoseInsulinPhysiolibrary;
