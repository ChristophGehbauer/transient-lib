﻿within TransiEnt.Producer.Gas.Electrolyzer;
package Systems



//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.3                             //
//                                                                                //
// Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
// Copyright 2021, Hamburg University of Technology.                              //
//________________________________________________________________________________//
//                                                                                //
// TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
// supported by the German Federal Ministry of Economics and Energy               //
// (FKZ 03ET4003, 03ET4048, 0324027 and 03EI1008).                                //
// The TransiEnt Library research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
// Institute of Energy Systems (Hamburg University of Technology),                //
// Institute of Electrical Power and Energy Technology                            //
// (Hamburg University of Technology)                                             //
// Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//




 extends TransiEnt.Basics.Icons.Package;

















  annotation (Icon(graphics={
      Ellipse(
        extent={{-66,6},{-20,-40}},
        lineColor={0,0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-56,2},{-54,-34}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{9,74},{43,36}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-59,74},{-25,36}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-42,74},{26,36}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-42,70},{26,40}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-42,66},{26,44}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-42,60},{26,50}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{22,-34},{70,-60}},
          lineColor={0,0,0},
          fillColor={255,255,170},
          fillPattern=FillPattern.VerticalCylinder),
        Rectangle(
          extent={{22,-12},{70,-46}},
          lineColor={0,0,0},
          fillColor={255,255,170},
          fillPattern=FillPattern.VerticalCylinder),
        Ellipse(
          extent={{22,0},{70,-24}},
          lineColor={0,0,0},
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{35,-5},{56,-16}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{35,-3},{56,-14}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-48,2},{-46,-34}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-40,2},{-38,-34}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-32,2},{-30,-34}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-56,-6},{-30,-26}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid)}));
end Systems;
