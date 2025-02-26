﻿within TransiEnt.Components.Gas.GasCleaning.Check;
model TestDryer_L1



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




  extends TransiEnt.Basics.Icons.Checkmodel;
  parameter TransiEnt.Basics.Media.Gases.VLE_VDIWA_SG6_var vle_sg;
  parameter TILMedia.VLEFluidTypes.TILMedia_SplineWater water;

  TransiEnt.Components.Boundaries.Gas.BoundaryRealGas_Txim_flow source(
    medium=vle_sg,
    variable_m_flow=true,
    variable_T=true,
    variable_xi=true) annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
  TransiEnt.Components.Boundaries.Gas.BoundaryRealGas_pTxi sink_syngas(
    medium=vle_sg,
    variable_p=true,
    p_const=100000) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={26,0})));
  Boundaries.FluidFlow.BoundaryVLE_pTxi                    sink_water(               variable_p=true,
    medium=water,
    boundaryConditions(showData=false))                                                               annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={0,26})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-1,
    offset=-1,
    duration=1000,
    startTime=1000)
                  annotation (Placement(transformation(extent={{-68,44},{-48,64}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    duration=1000,
    startTime=3000,
    height=50,
    offset=273.15) annotation (Placement(transformation(extent={{-68,14},{-48,34}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0.05,0.10,0.60,0.02,0.10; 5000,0.05,0.10,0.60,0.02,0.10; 6000,0.10,0.50,0.30,0.10,0; 12000,0.10,0.50,0.30,0.10,0])                                                               annotation (Placement(transformation(extent={{-68,-16},{-48,4}})));
  Modelica.Blocks.Sources.Ramp ramp2(
    offset=30e5,
    duration=1000,
    startTime=7000,
    height=-20e5)  annotation (Placement(transformation(extent={{66,-4},{46,16}})));
  TransiEnt.Components.Gas.GasCleaning.Dryer_L1 dryer(
    medium_gas=vle_sg,
    medium_water=water,
    pressureLoss=20000)                                                   annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Ramp ramp3(
    duration=1000,
    height=-4e5,
    offset=5e5,
    startTime=9000)
                   annotation (Placement(transformation(extent={{40,34},{20,54}})));

  Modelica.Units.SI.MassFlowRate m_flow_CH4_in=dryer.gasPortIn.m_flow*inStream(dryer.gasPortIn.xi_outflow[1]);
  Modelica.Units.SI.MassFlowRate m_flow_CH4_out=-(dryer.gasPortOut.m_flow*dryer.gasPortOut.xi_outflow[1]);
  Modelica.Units.SI.MassFlowRate m_flow_CO2_in=dryer.gasPortIn.m_flow*inStream(dryer.gasPortIn.xi_outflow[2]);
  Modelica.Units.SI.MassFlowRate m_flow_CO2_out=-(dryer.gasPortOut.m_flow*dryer.gasPortOut.xi_outflow[2]);
  Modelica.Units.SI.MassFlowRate m_flow_H2O_in=dryer.gasPortIn.m_flow*inStream(dryer.gasPortIn.xi_outflow[3]);
  Modelica.Units.SI.MassFlowRate m_flow_H2O_out=-(dryer.gasPortOut.m_flow*dryer.gasPortOut.xi_outflow[3] + dryer.fluidPortOut.m_flow);
  Modelica.Units.SI.MassFlowRate m_flow_H2_in=dryer.gasPortIn.m_flow*inStream(dryer.gasPortIn.xi_outflow[4]);
  Modelica.Units.SI.MassFlowRate m_flow_H2_out=-(dryer.gasPortOut.m_flow*dryer.gasPortOut.xi_outflow[4]);
  Modelica.Units.SI.MassFlowRate m_flow_CO_in=dryer.gasPortIn.m_flow*inStream(dryer.gasPortIn.xi_outflow[5]);
  Modelica.Units.SI.MassFlowRate m_flow_CO_out=-(dryer.gasPortOut.m_flow*dryer.gasPortOut.xi_outflow[5]);
  Modelica.Units.SI.MassFlowRate m_flow_N2_in=dryer.gasPortIn.m_flow*(1 - sum(inStream(dryer.gasPortIn.xi_outflow)));
  Modelica.Units.SI.MassFlowRate m_flow_N2_out=-(dryer.gasPortOut.m_flow*(1 - sum(dryer.gasPortOut.xi_outflow)));

  inner SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
equation
  connect(combiTimeTable.y, source.xi) annotation (Line(points={{-47,-6},{-47,-6},{-38,-6}}, color={0,0,127}));
  connect(ramp2.y, sink_syngas.p) annotation (Line(points={{45,6},{45,6},{38,6}}, color={0,0,127}));
  connect(ramp.y, source.m_flow) annotation (Line(points={{-47,54},{-42,54},{-42,6},{-38,6}}, color={0,0,127}));
  connect(ramp1.y, source.T) annotation (Line(points={{-47,24},{-44,24},{-44,0},{-38,0}}, color={0,0,127}));
  connect(ramp3.y, sink_water.p) annotation (Line(points={{19,44},{-6,44},{-6,36}}, color={0,0,127}));
  connect(source.gasPort, dryer.gasPortIn) annotation (Line(
      points={{-16,0},{-13,0},{-10,0}},
      color={255,255,0},
      thickness=1.5));
  connect(sink_syngas.gasPort, dryer.gasPortOut) annotation (Line(
      points={{16,0},{13,0},{10,0}},
      color={255,255,0},
      thickness=1.5));
  connect(dryer.fluidPortOut, sink_water.fluidPortIn) annotation (Line(
      points={{0,10},{0,14},{0,16},{-1.83187e-015,16}},
      color={175,0,0},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-20},{100,100}}),  graphics={Text(
          extent={{-40,98},{38,78}},
          lineColor={0,140,72},
          textString="1000-2000 s mass flow from 1 to 2 kg/s
3000-4000 s temperature from 0 to 50 C
5000-6000 s composition changes
7000-8000 s pressure at syngas output from 30 to 10 bar
9000-10000 s pressure at H2O output from 5 to 1 bar"),
                                 Text(
          extent={{-26,74},{26,64}},
          lineColor={0,140,72},
          textString="check  component mass flows are equal
check mass flows
check pressure loss in right direction")}),
    experiment(StopTime=12000, __Dymola_NumberOfIntervals=600),
    __Dymola_experimentSetupOutput,
    Icon(graphics,
         coordinateSystem(extent={{-100,-20},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for the Dryer_L1 model </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4.Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end TestDryer_L1;
