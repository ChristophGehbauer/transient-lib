﻿within TransiEnt.Producer.Heat.Gas2Heat.SimpleGasBoiler.Base;
partial model PartialBoiler "Partial boiler model with setpoints, fluid ports and icon"



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





  extends TransiEnt.Basics.Icons.Model;

  // _____________________________________________
  //
  //                Parameters
  // _____________________________________________

  parameter Boolean useFluidPorts=true "True if fluid ports shall be used" annotation (Dialog(group="Configuration"),choices(checkBox=true));

  parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium=simCenter.fluid1 "Heat carrier medium to be used"
                         annotation(choicesAllMatching, Dialog(group="Fundamental Definitions", enable=useFluidPorts));
  parameter SI.HeatFlowRate Q_flow_n=360e6 annotation (Dialog(group="Nominal Values"));

  parameter SI.Efficiency eta=0.95 annotation (Dialog(group="Technical Specifications"));


  // _____________________________________________
  //
  //                Interfaces
  // _____________________________________________

  Basics.Interfaces.Thermal.FluidPortIn inlet(Medium=medium) if useFluidPorts annotation (Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{-108,-10},{-88,10}})));
  Basics.Interfaces.Thermal.FluidPortOut outlet(Medium=medium) if useFluidPorts annotation (Placement(transformation(extent={{90,40},{110,60}}), iconTransformation(extent={{90,-10},{110,10}})));
  TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateIn Q_flow_set "Setpoint for thermal heat"
    annotation (Placement(transformation(extent={{-114,-10},{-94,10}}),
        iconTransformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,100})));

  // _____________________________________________
  //
  //                Complex Components
  // _____________________________________________

public
  outer TransiEnt.SimCenter simCenter;
  outer TransiEnt.ModelStatistics modelStatistics;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-40,42},{40,-38}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(points={{-96,-2},{-76,-2},{-16,-2},{-4,14},{10,-14},{20,-2},{104,-2}},
                                                                               color={162,29,33})}),
                                  Diagram(graphics,
                                          coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Partial model of a gas boiler using TransiEnt interfaces and TransiEnt.Statistics. Gas Consumption is computed using a constant efficiency and constant heat of combustion.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>inlet: fluidPortIn</p>
<p>outlet: fluidPortOut</p>
<p>Q_flow_set: heat flow rate in W (setpoint for thermal heat)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end PartialBoiler;
