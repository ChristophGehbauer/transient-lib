﻿within TransiEnt.Components.Electrical.Machines;
model InductionMotorComplex_L1E "Model of Induction Motor for ComplexPowerPort"



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





  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Components.Electrical.Machines.Base.PartialInductionMotor(
    P_n=4670,
    N_pp=1,
    f_rot_n=2874/60,
    tau_bd=30.02,
    slip_bd=0.143,
    slip_n=0.042);

  // _____________________________________________
  //
  //        Constants and  Hidden Parameters
  // _____________________________________________

  // _____________________________________________
  //
  //                  Outer
  // _____________________________________________

  // _____________________________________________
  //
  //                   Parameters
  // _____________________________________________

  parameter Modelica.Units.SI.Reactance x_model=1.98 "Reactance for modeling reactive power";
  //x_model can be calculated with help of cosphin_n, v_n and P_n

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  // _____________________________________________
  //
  //                   Variables
  // _____________________________________________

equation

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  //new simple electrical equations

  S.re=if mpp.tau>0 then (0.999-slip)*P_mech else (1/(0.999-slip))*P_mech; //This equation is modified for numerical reasons. There is a (small) error compared to the real equation.

  S.im=epp.v^2*(slip/x_model);

  S.re=epp.P;

  S.im=epp.Q;

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  annotation (Icon(graphics,
                   coordinateSystem(preserveAspectRatio=false)), Diagram(graphics,
                                                                         coordinateSystem(preserveAspectRatio=false)),Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model for asynchronous, induction motor for use with the ComplexPowerPort, simpl</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p>L1E (defined in the CodingConventions): Models are based on characteristic lines, gains or efficiencies.</p>
<p>Simplified electrical part of model, without stator inductance and resistor</p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- Mechanical connection is stiff</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Not all losses are regarded. Reactive power consuption simplified.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">epp (ComplexPowerPort)</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Mechanical power port mpp</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Modelica RealInput: frequency in [Hz]</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Formula of Kloss(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">use this model for auxillary </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p>Tested in check model &quot;TransiEnt.Components.Electrical.Machines.Check.CheckAsynchronousMotor_L1E&quot;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no references)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Jan-Peter Heckel (jan.heckel@tuhh.de) in April 2018 </span></p>
</html>"));
end InductionMotorComplex_L1E;
