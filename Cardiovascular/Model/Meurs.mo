within Cardiovascular.Model;
package Meurs
    extends Modelica.Icons.ExamplesPackage;
  model HemodynamicsMeurs_shallow
    extends Cardiovascular.Icons.Runnable_Shallow;

    Physiolibrary.Fluid.Components.ElasticVessel PulmonaryArteries(
      useV0Input=false,
      useComplianceInput=false,
      volume_start=0.000106,
      ZeroPressureVolume=5e-05,
      Compliance=3.2185142219537e-08,
      useExternalPressureInput=true,
      nPorts=1,
      ExternalPressure=101325 + (-533.28954966))
      annotation (Placement(transformation(extent={{-94,84},{-68,110}})));
    Physiolibrary.Fluid.Components.Conductor PulmonaryArteriesResistance(
        useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
        6.818059724437e-08)
      annotation (Placement(transformation(extent={{-56,85},{-22,111}})));
    Physiolibrary.Fluid.Components.ElasticVessel PulmonaryVeins(
      useV0Input=false,
      useComplianceInput=false,
      volume_start=0.000518,
      ZeroPressureVolume=0.00035,
      Compliance=1.6486353437088e-07,
      useExternalPressureInput=true,
      nPorts=1,
      ExternalPressure=101325 + (-533.28954966))
      annotation (Placement(transformation(extent={{-10,86},{14,110}})));
    Physiolibrary.Fluid.Components.Conductor PulmonaryVeinResistance(
        useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
        2.4999552322936e-06)
      annotation (Placement(transformation(extent={{26,86},{56,110}})));
    Physiolibrary.Fluid.Components.ElasticVesselElastance
                                                 LeftAtrium(
      useV0Input=false,
      volume_start=9.31e-05,
      ZeroPressureVolume=3e-05,
      useExternalPressureInput=true,
      useElastanceInput=true,
      nPorts=1,
      ExternalPressure=101325 + (-533.28954966))
      annotation (Placement(transformation(extent={{74,50},{102,78}})));
    Physiolibrary.Fluid.Components.ElasticVesselElastance
                                                 LeftVentricle(
      useV0Input=false,
      volume_start=0.000144,
      ZeroPressureVolume=6e-05,
      useExternalPressureInput=true,
      useElastanceInput=true,
      nPorts=1,
      ExternalPressure=101325 + (-533.28954966))
      annotation (Placement(transformation(extent={{148,48},{178,78}})));
    Physiolibrary.Fluid.Components.IdealValve ventricleArteryValve(
      _Gon(displayUnit="ml/(mmHg.s)") = 9.3757696980707e-07,
      _Goff(displayUnit="ml/(mmHg.s)") = 0,
      useLimitationInputs=false)
      annotation (Placement(transformation(extent={{184,76},{208,52}})));
    Parts.AtrialElastance atrialElastance(EMIN=15998686.4898, EMAX=
          37330268.4762)
      annotation (Placement(transformation(extent={{80,94},{118,126}})));
    Parts.VentricularElastance ventricularElastance(EMIN=11999014.86735,
        EMAX=533289549.66)
      annotation (Placement(transformation(extent={{164,92},{200,124}})));
    Physiolibrary.Fluid.Components.IdealValve atrioVentricleValve(
      _Gon(displayUnit="ml/(mmHg.s)") = 2.4999552322936e-06,
      useLimitationInputs=false,
      _Goff(displayUnit="ml/(mmHg.s)") = 0) annotation (Placement(visible=true,
          transformation(
          origin={127,64},
          extent={{-13,12},{13,-12}},
          rotation=0)));
    Physiolibrary.Fluid.Components.ElasticVessel IntraThoracicArteries(
      useV0Input=false,
      useComplianceInput=false,
      useExternalPressureInput=true,
      volume_start=0.000204,
      ZeroPressureVolume=0.00014,
      Compliance=5.2429304151611e-09,
      nPorts=1,
      ExternalPressure=101325 + (-533.28954966))
      annotation (Placement(transformation(extent={{168,6},{190,28}})));
    Physiolibrary.Fluid.Components.ElasticVessel ExtrathoracicArteries(
      volume_start(displayUnit="ml") = 0.000526,
      useV0Input=false,
      useExternalPressureInput=false,
      useComplianceInput=false,
      ZeroPressureVolume=0.00037,
      Compliance=1.3493607749463e-08,
      nPorts=1) annotation (Placement(transformation(extent={{58,6},{84,32}})));
    Physiolibrary.Fluid.Components.Inertia inertia(I=(93325.6711905)/1000,
        massFlow_start=0.021666666666667) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={134,18})));
    Physiolibrary.Fluid.Components.Conductor ArteryResistance(
        useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
        1.2526028316622e-07)
      annotation (Placement(transformation(extent={{94,8},{114,28}})));
    Physiolibrary.Fluid.Components.Conductor SystemicArterioralConductance(
        useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
        9.3757696980707e-09) annotation (Placement(transformation(
          extent={{11,-9},{-11,9}},
          rotation=0,
          origin={23,17})));
    Physiolibrary.Fluid.Components.Conductor SmallVenuleConductance(
        useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
        3.7503078792283e-08) annotation (Placement(transformation(
          extent={{14,-9},{-14,9}},
          rotation=0,
          origin={-60,17})));
    Physiolibrary.Fluid.Components.ElasticVessel PeripheralVessels(
      useV0Input=false,
      useExternalPressureInput=false,
      useComplianceInput=false,
      volume_start=0.000283,
      ZeroPressureVolume=0.000185,
      Compliance=2.8652352197304e-08,
      nPorts=1)
      annotation (Placement(transformation(extent={{-26,10},{-6,30}})));
    Physiolibrary.Fluid.Components.Conductor VeinsResistance(
        useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
        8.3256834918868e-08)
      annotation (Placement(transformation(extent={{-120,6},{-148,28}})));
    Physiolibrary.Fluid.Components.Conductor CentralVenousResistance(
        useConductanceInput=false, Conductance(displayUnit="ml/(mmHg.s)")=
        2.4999552322936e-06)
      annotation (Placement(transformation(extent={{-208,8},{-232,28}})));
    Physiolibrary.Fluid.Components.ElasticVessel IntraThoracicVeins(
      useV0Input=false,
      useComplianceInput=false,
      useExternalPressureInput=true,
      volume_start=0.00148,
      ZeroPressureVolume=0.00119,
      Compliance=4.1178380513927e-07,
      nPorts=1,
      ExternalPressure=101325 + (-533.28954966))
      annotation (Placement(transformation(extent={{-192,4},{-164,32}})));
    Physiolibrary.Fluid.Components.ElasticVessel ExtrathoracicVeins(
      useV0Input=false,
      useExternalPressureInput=false,
      useComplianceInput=false,
      volume_start=0.00153,
      ZeroPressureVolume=0.001,
      Compliance=4.4403645290063e-07,
      nPorts=1)
      annotation (Placement(transformation(extent={{-116,4},{-90,30}})));
    Physiolibrary.Fluid.Components.ElasticVesselElastance
                                                 RightAtrium(
      useV0Input=false,
      volume_start=0.000135,
      ZeroPressureVolume=3e-05,
      useExternalPressureInput=true,
      useElastanceInput=true,
      nPorts=1,
      ExternalPressure=101325 + (-533.28954966))
      annotation (Placement(transformation(extent={{-242,44},{-214,72}})));
    Physiolibrary.Fluid.Components.ElasticVesselElastance
                                                 rightVentricle(
      useV0Input=false,
      volume_start=0.000131,
      ZeroPressureVolume=4e-05,
      useExternalPressureInput=true,
      useElastanceInput=true,
      nPorts=1,
      ExternalPressure=101325 + (-533.28954966))
      annotation (Placement(transformation(extent={{-168,42},{-138,72}})));
    Physiolibrary.Fluid.Components.IdealValve ventricleArteryValve1(
      _Goff(displayUnit="ml/(mmHg.s)") = 0,
      useLimitationInputs=false,
      _Gon(displayUnit="ml/(mmHg.s)") = 2.4999552322936e-06)
      annotation (Placement(transformation(extent={{-132,70},{-108,46}})));
    Parts.AtrialElastance atrialElastance1(EMIN=6666119.37075, EMAX=
          19998358.11225)
      annotation (Placement(transformation(extent={{-244,86},{-206,118}})));
    Parts.VentricularElastance ventricularElastance1(EMIN=7599376.082655,
        EMAX=65327969.83335)
      annotation (Placement(transformation(extent={{-180,88},{-150,122}})));
    Physiolibrary.Fluid.Components.IdealValve atrioVentricleValve1(
      _Gon(displayUnit="ml/(mmHg.s)") = 2.497705047566e-06,
      _Goff=0,
      useLimitationInputs=false) annotation (Placement(visible=true,
          transformation(
          origin={-189,58},
          extent={{-13,12},{13,-12}},
          rotation=0)));
    replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(
          displayUnit="1/min") = 1.2) annotation (Placement(visible=true,
          transformation(
          origin={-243,128.5},
          extent={{-11,-6.5},{11,6.5}},
          rotation=0)));
    Physiolibrary.Types.Constants.PressureConst IntraThoracicPressure(k=101325
           + (-533.28954966)) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=0,
          origin={-123,118})));
  equation
    connect(PulmonaryArteries.q_in[1], PulmonaryArteriesResistance.q_in)
      annotation (Line(
        points={{-81.13,97},{-68.5,97},{-68.5,98},{-56,98}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in[1])
      annotation (Line(
        points={{-22,98},{1.88,98}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(PulmonaryVeins.q_in[1], PulmonaryVeinResistance.q_in) annotation (
        Line(
        points={{1.88,98},{26,98}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(LeftAtrium.q_in[1], atrioVentricleValve.q_in) annotation (Line(
        points={{87.86,64},{114,64}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(LeftVentricle.q_in[1], atrioVentricleValve.q_out) annotation (Line(
        points={{162.85,63},{151.5,63},{151.5,64},{140,64}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(LeftVentricle.q_in[1], ventricleArteryValve.q_in) annotation (Line(
        points={{162.85,63},{173.5,63},{173.5,64},{184,64}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(PulmonaryVeinResistance.q_out, LeftAtrium.q_in[1]) annotation (Line(
        points={{56,98},{74,98},{74,64},{87.86,64}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(ArteryResistance.q_in, ExtrathoracicArteries.q_in[1]) annotation (
        Line(
        points={{94,18},{80,18},{80,19},{70.87,19}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(ArteryResistance.q_out, inertia.q_out) annotation (Line(
        points={{114,18},{124,18}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(inertia.q_in, IntraThoracicArteries.q_in[1]) annotation (Line(
        points={{144,18},{162,18},{162,17},{178.89,17}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(IntraThoracicArteries.q_in[1], ventricleArteryValve.q_out)
      annotation (Line(
        points={{178.89,17},{216,17},{216,64},{208,64}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(SystemicArterioralConductance.q_out, PeripheralVessels.q_in[1])
      annotation (Line(
        points={{12,17},{-2,17},{-2,20},{-16.1,20}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(PeripheralVessels.q_in[1], SmallVenuleConductance.q_in) annotation (
       Line(
        points={{-16.1,20},{-32,20},{-32,17},{-46,17}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(SystemicArterioralConductance.q_in, ExtrathoracicArteries.q_in[1])
      annotation (Line(
        points={{34,17},{70.87,17},{70.87,19}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in[1])
      annotation (Line(
        points={{-208,18},{-178.14,18}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(IntraThoracicVeins.q_in[1], VeinsResistance.q_out) annotation (Line(
        points={{-178.14,18},{-164,18},{-164,17},{-148,17}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in[1]) annotation (Line(
        points={{-120,17},{-103.13,17}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(ExtrathoracicVeins.q_in[1], SmallVenuleConductance.q_out)
      annotation (Line(
        points={{-103.13,17},{-74,17}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(RightAtrium.q_in[1], atrioVentricleValve1.q_in) annotation (Line(
        points={{-228.14,58},{-202,58}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(rightVentricle.q_in[1], atrioVentricleValve1.q_out) annotation (
        Line(
        points={{-153.15,57},{-164.5,57},{-164.5,58},{-176,58}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(rightVentricle.q_in[1], ventricleArteryValve1.q_in) annotation (
        Line(
        points={{-153.15,57},{-142.5,57},{-142.5,58},{-132,58}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(CentralVenousResistance.q_out, RightAtrium.q_in[1]) annotation (
        Line(
        points={{-232,18},{-250,18},{-250,58},{-228.14,58}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(ventricleArteryValve1.q_out, PulmonaryArteries.q_in[1]) annotation (
       Line(
        points={{-108,58},{-92,58},{-92,97},{-81.13,97}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));

    connect(HeartRate.y, atrialElastance1.HR) annotation (Line(
        points={{-229.25,128.5},{-225,128.5},{-225,114.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(ventricularElastance1.HR, HeartRate.y) annotation (Line(
        points={{-165,118.6},{-165,128.5},{-229.25,128.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(atrialElastance.HR, HeartRate.y) annotation (Line(
        points={{99,122.8},{99,128.5},{-229.25,128.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(ventricularElastance.HR, HeartRate.y) annotation (Line(
        points={{182,120.8},{182,128.5},{-229.25,128.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, PulmonaryArteries.externalPressure)
      annotation (Line(
        points={{-111.75,118},{-73.2,118},{-73.2,108.7}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, PulmonaryVeins.externalPressure)
      annotation (Line(
        points={{-111.75,118},{9.2,118},{9.2,108.8}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(LeftAtrium.externalPressure, LeftVentricle.externalPressure)
      annotation (Line(
        points={{96.4,76.6},{96.4,84},{172,84},{172,76.5}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(LeftAtrium.externalPressure, PulmonaryVeins.externalPressure)
      annotation (Line(
        points={{96.4,76.6},{96.4,84},{76,84},{76,120},{9.2,120},{9.2,108.8}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(IntraThoracicPressure.y, rightVentricle.externalPressure)
      annotation (Line(
        points={{-111.75,118},{-104,118},{-104,76},{-144,76},{-144,70.5}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(RightAtrium.externalPressure, rightVentricle.externalPressure)
      annotation (Line(
        points={{-219.6,70.6},{-219.6,78},{-144,78},{-144,70.5}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(IntraThoracicVeins.externalPressure, rightVentricle.externalPressure)
      annotation (Line(
        points={{-169.6,30.6},{-169.6,78},{-144,78},{-144,70.5}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(IntraThoracicArteries.externalPressure, LeftVentricle.externalPressure)
      annotation (Line(
        points={{185.6,26.9},{185.6,84},{172,84},{172,76.5}},
        color={0,190,190},
        smooth=Smooth.None));
    connect(atrialElastance1.Et, RightAtrium.elastance) annotation (Line(points
          ={{-202.39,101.84},{-194,101.84},{-194,80},{-226,80},{-226,74},{
            -225.2,74},{-225.2,70.6}}, color={0,0,127}));
    connect(ventricularElastance1.Et, rightVentricle.elastance) annotation (
        Line(points={{-147.15,108.91},{-126,108.91},{-126,80},{-150,80},{-150,
            70.5}}, color={0,0,127}));
    connect(LeftAtrium.elastance, atrialElastance.Et) annotation (Line(points={
            {90.8,76.6},{90.8,88},{132,88},{132,109.84},{121.61,109.84}}, color
          ={0,0,127}));
    connect(ventricularElastance.Et, LeftVentricle.elastance) annotation (Line(
          points={{203.42,111.68},{212,111.68},{212,86},{166,86},{166,76.5}},
          color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(extent={{-280,-140},{280,180}},
            preserveAspectRatio=false)),
      Icon(coordinateSystem(extent={{-280,-140},{280,180}},
            preserveAspectRatio=false), graphics),
      experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
      Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
  end HemodynamicsMeurs_shallow;

  model HemodynamicsMeurs
    extends Cardiovascular.System(
      redeclare Parts.Pulmonary pulmonaryCirculation,
      redeclare Parts.Heart heart,
      redeclare Parts.Systemic systemicCirculation);
      extends Cardiovascular.Icons.Runnable_System;

    annotation (experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
        Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
  end HemodynamicsMeurs;

  package Parts
    extends Modelica.Icons.UtilitiesPackage;
    model Pulmonary
      extends Cardiovascular.Interfaces.Pulmonary;
      Physiolibrary.Fluid.Components.ElasticVesselElastance PulmonaryArteries(
        useV0Input=false,
        useExternalPressureInput=false,
        useElastanceInput=false,
        volume_start=0.000106,
        ZeroPressureVolume=5e-05,
        Elastance=31064116.267695,
        nPorts=1,
        ExternalPressure=101325 + (-533.28954966))
        annotation (Placement(transformation(extent={{-82,-12},{-58,12}})));
      Physiolibrary.Fluid.Components.Resistor PulmonaryArteriesResistance(
          useResistanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") =
          14665462.61565)
        annotation (Placement(transformation(extent={{-38,-14},{-10,14}})));
      Physiolibrary.Fluid.Components.ElasticVesselElastance PulmonaryVeins(
        useV0Input=false,
        useExternalPressureInput=false,
        useElastanceInput=false,
        volume_start=0.000518,
        ZeroPressureVolume=0.00035,
        Elastance=6066168.6273825,
        nPorts=1,
        ExternalPressure=101325 + (-533.28954966))
        annotation (Placement(transformation(extent={{8,-12},{32,12}})));
      Physiolibrary.Fluid.Components.Resistor PulmonaryVeinResistance(
          useResistanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") =
          399967.162245)
        annotation (Placement(transformation(extent={{46,-12},{70,12}})));
    equation
      connect(q_in, PulmonaryArteries.q_in[1]) annotation (Line(
          points={{-100,0},{-84,0},{-84,2.22045e-16},{-70,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PulmonaryArteries.q_in[1], PulmonaryArteriesResistance.q_in)
        annotation (Line(
          points={{-70,0},{-38,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PulmonaryArteriesResistance.q_out, PulmonaryVeins.q_in[1])
        annotation (Line(
          points={{-10,0},{4,0},{4,2.22045e-16},{20,2.22045e-16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PulmonaryVeins.q_in[1], PulmonaryVeinResistance.q_in) annotation (
         Line(
          points={{20,0},{46,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PulmonaryVeinResistance.q_out, q_out) annotation (Line(
          points={{70,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Meurs")}));
    end Pulmonary;

    model Systemic
      extends Cardiovascular.Interfaces.Systemic;
      Physiolibrary.Fluid.Components.ElasticVesselElastance
        IntraThoracicArteries(
        useV0Input=false,
        useExternalPressureInput=false,
        useElastanceInput=false,
        volume_start=0.000204,
        ZeroPressureVolume=0.00014,
        Elastance=190651014.00345,
        nPorts=1,
        ExternalPressure=101325 + (-533.28954966))
        annotation (Placement(transformation(extent={{78,-6},{92,8}})));
      Physiolibrary.Fluid.Components.Inertia inertia(I=(93325.6711905)/1000,
          massFlow_start=0.021666666666667) annotation (Placement(
            transformation(
            extent={{-6,-5},{6,5}},
            rotation=180,
            origin={70,1})));
      Physiolibrary.Fluid.Components.Resistor ArteryResistance(
          useResistanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") =
          7999343.2449) annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=0,
            origin={55,1})));
      Physiolibrary.Fluid.Components.ElasticVesselElastance
        ExtrathoracicArteries(
        volume_start(displayUnit="ml") = 0.000526,
        useV0Input=false,
        useExternalPressureInput=false,
        useElastanceInput=false,
        ZeroPressureVolume=0.00037,
        Elastance=74127247.40274,
        nPorts=1)
        annotation (Placement(transformation(extent={{38,-22},{54,-6}})));
      Physiolibrary.Fluid.Components.Resistor SystemicArterioralResistance(
          useResistanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") =
          106657909.932) annotation (Placement(transformation(
            extent={{9,-8},{-9,8}},
            rotation=0,
            origin={27,-14})));
      Physiolibrary.Fluid.Components.ElasticVesselElastance PeripheralVessels(
        useV0Input=false,
        useExternalPressureInput=false,
        useElastanceInput=false,
        volume_start=0.000283,
        ZeroPressureVolume=0.000185,
        Elastance=34930465.50273,
        nPorts=1)
        annotation (Placement(transformation(extent={{2,-36},{16,-22}})));
      Physiolibrary.Fluid.Components.Resistor SmallVenuleResistance(
          useResistanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") =
          26664477.483) annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=0,
            origin={-7,-29})));
      Physiolibrary.Fluid.Components.ElasticVesselElastance ExtrathoracicVeins(
        useV0Input=false,
        useExternalPressureInput=false,
        useElastanceInput=false,
        volume_start=0.00153,
        ZeroPressureVolume=0.001,
        Elastance=2253148.3473135,
        nPorts=1)
        annotation (Placement(transformation(extent={{-32,-22},{-14,-6}})));
      Physiolibrary.Fluid.Components.Resistor VeinsResistance(
          useResistanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") =
          11999014.86735)
        annotation (Placement(transformation(extent={{-32,-22},{-48,-6}})));
      Physiolibrary.Fluid.Components.ElasticVesselElastance IntraThoracicVeins(
        useV0Input=false,
        useExternalPressureInput=false,
        useElastanceInput=false,
        volume_start=0.00148,
        ZeroPressureVolume=0.00119,
        Elastance=2426467.450953,
        nPorts=1,
        ExternalPressure=101325 + (-533.28954966))
        annotation (Placement(transformation(extent={{-66,-8},{-48,8}})));
      Physiolibrary.Fluid.Components.Resistor CentralVenousResistance(
          useResistanceInput=false, Resistance(displayUnit="(mmHg.s)/ml") =
          399967.162245)
        annotation (Placement(transformation(extent={{-74,-8},{-90,8}})));
    equation
      connect(VeinsResistance.q_in, ExtrathoracicVeins.q_in[1]) annotation (
          Line(
          points={{-32,-14},{-23.09,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inertia.q_in, IntraThoracicArteries.q_in[1]) annotation (Line(
          points={{76,1},{84.93,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ArteryResistance.q_in, inertia.q_out) annotation (Line(
          points={{62,1},{64,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ExtrathoracicArteries.q_in[1], SystemicArterioralResistance.q_in)
        annotation (Line(
          points={{45.92,-14},{36,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(q_out, CentralVenousResistance.q_out) annotation (Line(
          points={{-100,0},{-90,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(CentralVenousResistance.q_in, IntraThoracicVeins.q_in[1])
        annotation (Line(
          points={{-74,0},{-57.09,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(IntraThoracicVeins.q_in[1], VeinsResistance.q_out) annotation (
          Line(
          points={{-57.09,0},{-48,0},{-48,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(q_in, q_in) annotation (Line(
          points={{100,0},{95,0},{95,0},{100,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(q_in, IntraThoracicArteries.q_in[1]) annotation (Line(
          points={{100,0},{92,0},{92,1},{84.93,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SmallVenuleResistance.q_out, ExtrathoracicVeins.q_in[1])
        annotation (Line(
          points={{-14,-29},{-14,-14},{-23.09,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ExtrathoracicArteries.q_in[1], ArteryResistance.q_out)
        annotation (Line(
          points={{45.92,-14},{45.92,1},{48,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(SmallVenuleResistance.q_in, PeripheralVessels.q_in[1])
        annotation (Line(
          points={{0,-29},{8.93,-29}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(PeripheralVessels.q_in[1], SystemicArterioralResistance.q_out)
        annotation (Line(
          points={{8.93,-29},{8.93,-14},{18,-14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
              Text(   extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Meurs")}));
    end Systemic;

    model Heart
      extends Cardiovascular.Interfaces.Heart;
      Physiolibrary.Fluid.Components.ElasticVesselElastance
                                                   rightAtrium(
        useV0Input=false,
        useExternalPressureInput=false,
        volume_start=0.000135,
        ZeroPressureVolume=3e-05,
        useElastanceInput=true,
        nPorts=1,
        ExternalPressure=101325 + (-533.28954966))
        annotation (Placement(transformation(extent={{-68,8},{-40,36}})));
      Physiolibrary.Fluid.Components.IdealValveResistance atrioVentricleValve1(
        _Roff=Modelica.Constants.inf,
        _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245) annotation (Placement(
            visible=true, transformation(
            origin={-14,22},
            extent={{-12,12},{12,-12}},
            rotation=0)));
      Physiolibrary.Fluid.Components.ElasticVesselElastance
                                                   rightVentricle(
        useV0Input=false,
        useExternalPressureInput=false,
        volume_start=0.000131,
        ZeroPressureVolume=4e-05,
        useElastanceInput=true,
        nPorts=1,
        ExternalPressure=101325 + (-533.28954966))
        annotation (Placement(transformation(extent={{8,8},{36,36}})));
      Physiolibrary.Fluid.Components.IdealValveResistance ventricleArteryValve1
        (
        useResistanceInputs=false,
        _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245,
        _Roff=Modelica.Constants.inf)
        annotation (Placement(transformation(extent={{42,34},{66,10}})));
      VentricularElastance ventricularElastance1(EMIN=7599376.082655, EMAX=
            65327969.83335)
        annotation (Placement(transformation(extent={{-20,54},{10,88}})));
      AtrialElastance atrialElastance1(EMIN=6666119.37075, EMAX=
            19998358.11225)
        annotation (Placement(transformation(extent={{-94,54},{-56,86}})));
      replaceable Physiolibrary.Types.Constants.FrequencyConst HeartRate(k(
            displayUnit="1/min") = 1.2) annotation (Placement(visible=true,
            transformation(
            origin={59,92},
            extent={{-7,-6},{7,6}},
            rotation=180)));
      Physiolibrary.Fluid.Components.ElasticVesselElastance
                                                   leftAtrium(
        useV0Input=false,
        useExternalPressureInput=false,
        volume_start=9.31e-05,
        ZeroPressureVolume=3e-05,
        useElastanceInput=true,
        nPorts=1,
        ExternalPressure=101325 + (-533.28954966))
        annotation (Placement(transformation(extent={{50,-86},{78,-58}})));
      AtrialElastance atrialElastance(EMIN=15998686.4898, EMAX=
            37330268.4762)
        annotation (Placement(transformation(extent={{8,-50},{46,-18}})));
      Physiolibrary.Fluid.Components.IdealValveResistance atrioVentricleValve(
        useResistanceInputs=false,
        _Ron(displayUnit="(mmHg.s)/ml") = 399967.162245,
        _Roff=Modelica.Constants.inf) annotation (Placement(visible=true,
            transformation(
            origin={24,-72},
            extent={{-12,12},{12,-12}},
            rotation=180)));
      Physiolibrary.Fluid.Components.ElasticVesselElastance
                                                   leftVentricle(
        useV0Input=false,
        useExternalPressureInput=false,
        volume_start=0.000144,
        ZeroPressureVolume=6e-05,
        useElastanceInput=true,
        nPorts=1,
        ExternalPressure=101325 + (-533.28954966))
        annotation (Placement(transformation(extent={{-30,-86},{-2,-58}})));
      VentricularElastance ventricularElastance(EMIN=11999014.86735, EMAX=
            533289549.66) annotation (Placement(transformation(extent={{-66,
                -46},{-30,-14}})));
      Physiolibrary.Fluid.Components.IdealValveResistance ventricleArteryValve(
        useResistanceInputs=false,
        _Ron(displayUnit="(mmHg.s)/ml") = 1066579.09932,
        _Roff=Modelica.Constants.inf) annotation (Placement(transformation(
            extent={{-12,12},{12,-12}},
            rotation=180,
            origin={-58,-72})));
    equation
      connect(rightHeartInflow, rightAtrium.q_in[1]) annotation (Line(
          points={{-100,40},{-70,40},{-70,22},{-54.14,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightAtrium.q_in[1], atrioVentricleValve1.q_in) annotation (Line(
          points={{-54.14,22},{-26,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(atrioVentricleValve1.q_out, rightVentricle.q_in[1]) annotation (
          Line(
          points={{-2,22},{21.86,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightVentricle.q_in[1], ventricleArteryValve1.q_in) annotation (
          Line(
          points={{21.86,22},{42,22}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ventricleArteryValve1.q_out, rightHeartOutflow) annotation (
          Line(
          points={{66,22},{82,22},{82,40},{100,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeartInflow, leftAtrium.q_in[1]) annotation (Line(
          points={{100,-20},{82,-20},{82,-72},{63.86,-72}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftAtrium.q_in[1], atrioVentricleValve.q_in) annotation (Line(
          points={{63.86,-72},{36,-72}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(atrioVentricleValve.q_out, leftVentricle.q_in[1]) annotation (
          Line(
          points={{12,-72},{-16.14,-72}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftVentricle.q_in[1], ventricleArteryValve.q_in) annotation (
          Line(
          points={{-16.14,-72},{-46,-72}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ventricleArteryValve.q_out, leftHeartOutflow) annotation (
          Line(
          points={{-70,-72},{-84,-72},{-84,-20},{-100,-20}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(atrialElastance1.HR, HeartRate.y) annotation (Line(
          points={{-75,82.8},{-75,92},{50.25,92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance1.HR, HeartRate.y) annotation (Line(
          points={{-5,84.6},{-5,92},{50.25,92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ventricularElastance.HR, HeartRate.y) annotation (Line(
          points={{-48,-17.2},{-48,-12},{36,-12},{36,92},{50.25,92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrialElastance.HR, HeartRate.y) annotation (Line(
          points={{27,-21.2},{27,-12},{36,-12},{36,92},{50.25,92}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(atrialElastance1.Et, rightAtrium.elastance) annotation (Line(
            points={{-52.39,69.84},{-51.2,34.6}}, color={0,0,127}));
      connect(ventricularElastance1.Et, rightVentricle.elastance) annotation (
          Line(points={{12.85,74.91},{24.8,74.91},{24.8,34.6}}, color={0,0,127}));
      connect(leftVentricle.elastance, ventricularElastance.Et) annotation (
          Line(points={{-13.2,-59.4},{-13.2,-26.32},{-26.58,-26.32}}, color={0,
              0,127}));
      connect(leftAtrium.elastance, atrialElastance.Et) annotation (Line(points
            ={{66.8,-59.4},{66.8,-34.16},{49.61,-34.16}}, color={0,0,127}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}})),           Icon(graphics={
              Text(   extent={{-100,60},{100,100}},
              lineColor={0,0,0},
              textString="Meurs")}));
    end Heart;

    model AtrialElastance
      extends HeartIntervals;

      Physiolibrary.Types.RealIO.HydraulicElastanceOutput Et "elasticity"
        annotation (Placement(transformation(extent={{100,-10},{120,10}}),
            iconTransformation(extent={{100,-20},{138,18}})));
      parameter Physiolibrary.Types.HydraulicElastance EMIN
        "Diastolic elastance";
      parameter Boolean useEs_extInput=false
        "=true, if external elastance/compliance value is used" annotation (
        Evaluate=true,
        HideResult=true,
        choices(__Dymola_checkBox=true),
        Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.HydraulicElastance EMAX
        "Maximum systolic elastance"
        annotation (Dialog(enable=not useEs_extInput));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/
            Ees) = 1/es_int if useEs_extInput annotation (Placement(
            transformation(extent={{60,60},{100,100}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-80,80})));
    protected
      Physiolibrary.Types.HydraulicElastance es_int;
    equation
      if not useEs_extInput then
        es_int = EMAX;
      end if;
      if time - T0 < Tas then
        Et = EMIN + (es_int - EMIN)*sin(Modelica.Constants.pi*(time - T0)/
          Tas);
      else
        Et = EMIN;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Rectangle(
                      extent={{-100,82},{100,-100}},
                      pattern=LinePattern.None,
                      lineThickness=1,
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,255}),Text(
                      extent={{-98,82},{98,24}},
                      lineColor={0,0,255},
                      lineThickness=1,
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
                      textString="Atrial elastance"),Line(
                      points={{-78,-34},{-76,-26},{-70,-14},{-58,6},{-36,36},
                {-14,14},{-6,-10},{0,-32},{6,-34},{88,-34},{94,-34}},
                      color={0,0,255},
                      smooth=Smooth.Bezier),Text(
                      extent={{-220,-102},{200,-120}},
                      lineColor={0,0,255},
                      lineThickness=1,
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
                      textString="%name"),Text(
                      extent={{72,4},{102,-8}},
                      lineColor={0,0,255},
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
              textString="Et")}),         Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end AtrialElastance;

    model VentricularElastance
      extends HeartIntervals;

      Modelica.Blocks.Interfaces.RealOutput Et0
        "normalized ventricular elasticity (0..1)" annotation (Placement(
            transformation(extent={{100,-24},{120,-4}}), iconTransformation(
              extent={{100,-40},{138,-2}})));
      Physiolibrary.Types.RealIO.TimeOutput HeartInterval "eapsed time"
        annotation (Placement(transformation(extent={{102,-42},{122,-22}}),
            iconTransformation(extent={{100,-98},{138,-60}})));
      Physiolibrary.Types.RealIO.HydraulicElastanceOutput Et
          "ventricular elasticity" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                4},{138,42}})));
      parameter Physiolibrary.Types.HydraulicElastance EMIN
        "Diastolic elastance ";
      constant Real Kn=0.57923032735652;
      //Kn is always = 0.5792303273565197
      //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
      //Equation to calculate normalized elastance ET0 was:
      //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
      parameter Boolean useEs_extInput=false
        "=true, if external elastance/compliance value is used" annotation (
        Evaluate=true,
        HideResult=true,
        choices(__Dymola_checkBox=true),
        Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.HydraulicElastance EMAX
        "Maximum systolic elastance"
        annotation (Dialog(enable=not useEs_extInput));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/
            EMAX) = 1/es_int if useEs_extInput annotation (Placement(
            transformation(extent={{60,60},{100,100}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-80,80})));
    protected
      Physiolibrary.Types.HydraulicElastance es_int;
    equation
      if not useEs_extInput then
        es_int = EMAX;
      end if;
      HeartInterval = time - T0;
      Et = EMIN + (es_int - EMIN)*Et0;
      if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
        Et0 = (HeartInterval - (Tas + Tav))/Tvs*sin(Modelica.Constants.pi*(
          HeartInterval - (Tas + Tav))/Tvs)/Kn;
      else
        Et0 = 0;
      end if;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Rectangle(
                      extent={{-98,82},{100,-100}},
                      pattern=LinePattern.None,
                      lineThickness=1,
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
                      lineColor={0,0,255}),Text(
                      extent={{-82,82},{80,24}},
                      lineColor={0,0,255},
                      lineThickness=1,
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
                      textString="Ventricular elastance"),Line(
                      points={{-72,-34},{-62,-34},{-52,-34},{-44,8},{-18,38},
                {-12,14},{-6,-10},{0,-32},{6,-34},{88,-34},{94,-34}},
                      color={0,0,255},
                      smooth=Smooth.Bezier),Text(
                      extent={{-220,-102},{200,-120}},
                      lineColor={0,0,255},
                      lineThickness=1,
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
                      textString="%name"),Text(
                      extent={{96,-32},{68,-8}},
                      lineColor={0,0,255},
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
                      textString="Et0"),Text(
                      extent={{42,-72},{88,-84}},
                      lineColor={0,0,255},
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
                      textString="Heart interval"),Text(
                      extent={{62,30},{96,8}},
                      lineColor={0,0,255},
                      lineThickness=1,
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid,
              textString="Et")}),         Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end VentricularElastance;

    model HeartIntervals
      discrete Physiolibrary.Types.Time Tas;
      discrete Physiolibrary.Types.Time T0;
      discrete Physiolibrary.Types.Time Tvs;
      parameter Physiolibrary.Types.Time Tav(displayUnit="s") = 0.01
        "atrioventricular delay";
      discrete Modelica.SIunits.Time HP(start=0) "heart period";
      Boolean b(start=false);
      Physiolibrary.Types.RealIO.FrequencyInput HR "heart rate" annotation (
         Placement(transformation(extent={{-12,68},{28,108}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,80})));
    equation
      b = time - pre(T0) >= pre(HP) "true if new pulse occurs";
      when {initial(),b} then
        T0 = time "start time of cardiac cycle";
        HP = 1/HR "update heart period per heart rate";
        Tas = 0.03 + 0.09*HP "duration of atrial systole";
        Tvs = 0.16 + 0.2*HP "duration of ventricular systole";
      end when;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Text(
                      extent={{-64,102},{-6,78}},
                      lineColor={0,0,255},
                      textString="HR")}));
    end HeartIntervals;
  end Parts;

  model HemodynamicsMeursBVControl
    extends Cardiovascular.Interfaces.Controlled.System(
      redeclare replaceable ControlledParts.PulmonaryControl
        pulmonaryCirculation,
      redeclare replaceable ControlledParts.HeartControl heart,
      redeclare replaceable ControlledParts.SystemicControl systemicCirculation,
      redeclare replaceable ControlledParts.Baroreflex shortTermControl,
      redeclare replaceable Cardiovascular.Model.Control.BloodVolumeControl
        longTermControl);

  /*    redeclare CardiovascularDevel.Model.Meurs.Variants.Parts.Stenosis
      stenosisControl(aorticstenosis(InitialResistance(displayUnit="(mmHg.s)/ml")=
             1066579.09932, FinalResistance(displayUnit="(mmHg.s)/ml") = 1066579.09932),
        AVBackFlowConductance(k=1.2501026264094e-15)),*/
      extends Cardiovascular.Icons.Runnable_System;
    annotation (experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
        Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
  end HemodynamicsMeursBVControl;

  package ControlledParts
    extends Modelica.Icons.UtilitiesPackage;
    model PulmonaryControl
      extends Parts.Pulmonary;
      extends Interfaces.Controlled.Pulmonary;
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-26,26})));
    equation
      connect(PulmonaryArteries.fluidVolume, add.u1) annotation (Line(
          points={{-62.8,-12},{-62,-12},{-62,-26},{-6,-26},{-6,20},{-14,20}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(PulmonaryVeins.fluidVolume, add.u2) annotation (Line(
          points={{27.2,-12},{28,-12},{28,-24},{34,-24},{34,32},{-14,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, busConnector.pulmonaryBloodVolume) annotation (Line(
          points={{-37,26},{-58,26},{-58,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end PulmonaryControl;

    model SystemicControl
      extends Parts.Systemic(
        SmallVenuleResistance(useResistanceInput= true),
        IntraThoracicArteries(
          useV0Input=false,
          useExternalPressureInput=false,
          useElastanceInput= false),
        IntraThoracicVeins(useElastanceInput= true));
      extends Interfaces.Controlled.Systemic;
      Modelica.Blocks.Math.Sum sum1(nin=5) annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=180,
            origin={-61,-39})));
      Cardiovascular.Model.Control.MeanAortaPressureMeasurement aortaPressureMeasurement
        annotation (Placement(transformation(extent={{70,10},{90,30}})));
    equation
      connect(IntraThoracicVeins.fluidVolume, sum1.u[1]) annotation (Line(
          points={{-48,-6.4},{-55,-6.4},{-55,-38.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sum1.y, busConnector.systemicBloodVolume) annotation (Line(
          points={{-66.5,-39},{-68,-39},{-68,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(aortaPressureMeasurement.q_in, inertia.q_in) annotation (Line(
          points={{76,14},{76,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ExtrathoracicVeins.fluidVolume, sum1.u[2]) annotation (Line(
          points={{-14,-20.4},{-16,-20.4},{-16,-38.6},{-55,-38.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(PeripheralVessels.fluidVolume, sum1.u[3]) annotation (Line(
          points={{16,-34.6},{14,-34.6},{14,-39},{-55,-39}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ExtrathoracicArteries.fluidVolume, sum1.u[4]) annotation (Line(
          points={{54,-20.4},{52,-20.4},{52,-39.4},{-55,-39.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(IntraThoracicArteries.fluidVolume, sum1.u[5]) annotation (Line(
          points={{92,-4.6},{88,-4.6},{88,-40},{-55,-40},{-55,-39.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure)
        annotation (Line(
          points={{87,23},{96,23},{96,34},{-80,34}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(SmallVenuleResistance.resistance, busConnector.peripheralresistance)
        annotation (Line(points={{-7,-24.8},{-7,34},{-80,34}}, color={0,0,127}),
          Text(
          string="%second",
          index=1,
          extent={{-3,6},{-3,6}},
          horizontalAlignment=TextAlignment.Right));
      connect(busConnector.venacavaelastance, IntraThoracicVeins.elastance)
        annotation (Line(
          points={{-80,34},{-55.2,34},{-55.2,7.2}},
          color={0,0,255},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,6},{-3,6}},
          horizontalAlignment=TextAlignment.Right));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}})));
    end SystemicControl;

    model HeartControl
      extends Parts.Heart(
        ventricularElastance1(useEs_extInput=true),
        ventricularElastance(useEs_extInput=true),
        redeclare Types.Constants.FrequencyControl HeartRate,
        ventricleArteryValve(useResistanceInputs=false));
      extends Interfaces.Controlled.Heart;
      Modelica.Blocks.Math.Sum sum1(nin=4)
        annotation (Placement(transformation(extent={{-80,-8},{-94,6}})));
    equation
      connect(rightAtrium.fluidVolume, sum1.u[1]) annotation (Line(
          points={{-40,10.8},{-64,10.8},{-64,-2.05},{-78.6,-2.05}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(rightVentricle.fluidVolume, sum1.u[2]) annotation (Line(
          points={{36,10.8},{32,10.8},{32,-1.35},{-78.6,-1.35}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftVentricle.fluidVolume, sum1.u[3]) annotation (Line(
          points={{-2,-83.2},{-6,-83.2},{-6,-0.65},{-78.6,-0.65}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftAtrium.fluidVolume, sum1.u[4]) annotation (Line(
          points={{78,-83.2},{72,-83.2},{72,0.05},{-78.6,0.05}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sum1.y, busConnector.heartBloodVolume) annotation (Line(
          points={{-94.7,-1},{-98,-1},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(ventricularElastance1.Es_ext, busConnector.rvcompliance)
        annotation (Line(
          points={{-17,84.6},{-68,84.6},{-68,88},{-98,88},{-98,86},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));

      connect(ventricularElastance.Es_ext, busConnector.lvcompliance)
        annotation (Line(
          points={{-62.4,-17.2},{-62.4,-14},{-62,-14},{-62,-10},{-98,-10},{
              -98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(HeartRate.c, busConnector.heartrate) annotation (Line(
          points={{62.5,92},{74,92},{74,102},{-98,102},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end HeartControl;

    model Baroreflex
      extends Model.Control.Baroreflex(baroreceptor(
          activationDelay=1,
          PAOmedia=12974.201470097,
          HR0Param=1.2,
          EV0right=65327969.83335,
          EV0left=533289549.66,
          EV0venacava=4.1215883592719e-07,
          RS0=26664477.483));
    end Baroreflex;

    model AorticValveStenosisScenario
      extends Model.Scenario.StenosisControl(
        venacavastenosis(InitialElastance=2426467.450953, FinalElastance=
              2426467.450953),
        aorticstenosis(InitialResistance(displayUnit="(mmHg.s)/ml")=
            1066579.09932, FinalResistance(displayUnit="(mmHg.s)/ml")=
            1066579.09932),
        mitralvalvestenosis(InitialResistance=399967.162245,
            FinalResistance=399967.162245));

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics));
    end AorticValveStenosisScenario;

    model AorticValveHeartControl
      extends HeartControl(ventricleArteryValve(useResistanceInputs=true));
    equation
      connect(ventricleArteryValve.Ron, busConnector.avoutflowresistance)
        annotation (Line(
          points={{-50.8,-60},{-50.8,-54},{-98,-54},{-98,86}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(busConnector.avbackflowresistance, ventricleArteryValve.Roff)
        annotation (Line(
          points={{-98,86},{-98,-54},{-65.2,-54},{-65.2,-60}},
          color={0,0,255},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}})));
    end AorticValveHeartControl;
  end ControlledParts;

  model StenosisAorticValve
    extends HemodynamicsMeursBVControl(redeclare
        ControlledParts.AorticValveStenosisScenario scenarioControl(
          aorticstenosis(FinalResistance(displayUnit="(mmHg.s)/ml")=
            10665790.9932)), redeclare
        ControlledParts.AorticValveHeartControl heart);
      extends Cardiovascular.Icons.Runnable_System;
    annotation (experiment(StopTime=120, __Dymola_NumberOfIntervals=5000));
  end StenosisAorticValve;

  model Bleeding
    extends HemodynamicsMeursBVControl(redeclare
        Scenario.BleedingTransfusionScenario scenarioControl(
        BloodTrans=0,
        Tbd=300,
        BloodLoss=0.0005,
        Tts=1200,
        Ttd=600), longTermControl(redeclare
          Control.BloodVolume.PlasmaBleeding plasma(hemorrhage(
              useSolutionFlowInput=true)), redeclare
          Control.BloodVolume.RBCBleeding redBloodCells));
    annotation (experiment(StopTime=3600, __Dymola_NumberOfIntervals=5000));
  end Bleeding;
  annotation (Documentation(info="<html>
<p>Model as presented in [1], reimplemented an extended.</p>
<p>[1]	van Meurs W. Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology. 1 edition. McGraw-Hill Education; 2011.</p>
</html>"));
end Meurs;
