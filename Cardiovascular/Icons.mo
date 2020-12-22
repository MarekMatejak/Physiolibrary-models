within Cardiovascular;
package Icons

  model Runnable_System

    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-40},{
              20,40}}), graphics),
      Icon(coordinateSystem(extent={{-20,-40},{20,40}}, preserveAspectRatio=
              false), graphics={
          Text(
            extent={{-40,-42},{40,-50}},
            lineColor={0,0,255},
            textString="%name"),
          Ellipse(lineColor={75,138,73}, extent={{-20,-20},{20,20}}),
          Polygon(
            lineColor={0,0,255},
            fillColor={75,138,73},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{-8,12},{12,0},{-8,-12},{-8,12}})}),
      Documentation(info="<html>
<p>Architectural model of cardiovascular subsystems. The partial subsystems are meant to be redeclared by the implemented submodels.</p>
</html>"));
  end Runnable_System;

  model Runnable_Shallow
    annotation (
      Diagram(coordinateSystem(extent={{-280,-140},{280,180}},
            preserveAspectRatio=false), graphics),
      Icon(coordinateSystem(extent={{-280,-140},{280,180}},
            preserveAspectRatio=false), graphics={Ellipse(
                lineColor={75,138,73},
                  fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                extent={{-156,-140},{164,180}}),Polygon(
                lineColor={0,0,255},
                fillColor={75,138,73},
                pattern=LinePattern.None,
                fillPattern=FillPattern.Solid,
                  points={{-68,118},{104,16},{-68,-82},{-68,118}})}),
      experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
      Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
  end Runnable_Shallow;
end Icons;
