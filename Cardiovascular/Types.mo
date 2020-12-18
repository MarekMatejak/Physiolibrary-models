within Cardiovascular;
package Types
  package Constants
    block FrequencyControl "External signal of type Frequency"
      Physiolibrary.Types.RealIO.FrequencyOutput y
        "HydraulicCompliance constant" annotation (Placement(transformation(
              extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},
                {60,10}})));
      Physiolibrary.Types.RealIO.FrequencyInput c annotation (Placement(
            transformation(extent={{-40,-20},{0,20}}), iconTransformation(
              extent={{-40,-20},{0,20}})));
      parameter Physiolibrary.Types.Frequency k;
      //ignored for this component
      //TODO add switch between constant default signal and input control signal
    equation
      y = c;
      annotation (
        defaultComponentName="hydraulicCompliance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
               false), graphics={Rectangle(
                    extent={{-40,40},{40,-40}},
                    lineColor={0,0,0},
                    radius=10,
                    fillColor={236,236,236},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{-100,-44},{100,-64}},
                    lineColor={0,0,0},
                    fillColor={236,236,236},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}));
    end FrequencyControl;
  end Constants;

  type PulseShape = enumeration(
      pulseless,
      parabolic,
      square) "Reference shape of ECMO pulse";
  type CannulaPlacement = enumeration(
      ascendingAorta,
      aorticArch1,
      aorticArch2,
      thoracicAorta1,
      thoracicAorta2) "Location of inserted ECMO cannula";
  package IO "Real types as input and output connectors"
    import Physiolibrary.Types.*;

  end IO;
end Types;
