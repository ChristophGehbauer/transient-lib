﻿within TransiEnt.Storage.Heat.HotWaterStorage_L4.Checks;
model Test_HeatStorageL4_Electrical "Test of one dimensional heat storage model with electrical heating"



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

  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow source(
    variable_m_flow=false,
    T_const=60 + 273,
    m_flow_const=2000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={86,-80})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi sink(
    medium=simCenter.fluid1,
    p_const=17e5,
    T_const=130 + 273.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={86,-47})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-50e6,
    offset=-100e6,
    startTime=3600,
    duration=900)
    annotation (Placement(transformation(extent={{-94,52},{-74,72}})));
  TransiEnt.Storage.Heat.Controller.SimpleStorageController simpleElectricBoilerController annotation (Placement(transformation(rotation=0, extent={{-50,30},{-70,50}})));
  HotWaterStorage_L4 stratifiedHotWaterStorage_Electric(
    Use_Solar=false,
    nSeg=10,
    Geometry(height=20, volume=2000),
    ConductanceTop(width=0.2),
    ConductanceWall(each width=0.2),
    ConductanceBottom(width=0.2),
    Tank_Volume(each h_start=340000, each p_nom=1700000),
    Geo_outletGrid(height_port=19.5),
    maxTemperature_allowed=373.15,
    Add_ElectricHeater=true) annotation (Placement(transformation(extent={{-40,-92},{42,-12}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow ZeroSource1(
    variable_m_flow=false,
    T_const=60 + 273,
    m_flow_const=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-72,-80})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow zeroSource2(
    variable_m_flow=false,
    T_const=60 + 273,
    m_flow_const=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-32})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ambient(T=288.15) "Constant ambient temperature"
    annotation (Placement(transformation(extent={{-2,38},{18,58}})));
  TransiEnt.Components.Boundaries.Electrical.ApparentPower.ApparentPower power_L2_1(useInputConnectorQ=false) annotation (Placement(transformation(extent={{-18,4},{-36,18}})));
  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{-36,24},{-24,36}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T temperature annotation (Placement(transformation(extent={{48,-32},{68,-12}})));
equation
  connect(ramp.y, simpleElectricBoilerController.u1) annotation (Line(
      points={{-73,62},{-52,62},{-52,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(stratifiedHotWaterStorage_Electric.outletGrid, sink.steam_a)
    annotation (Line(
      points={{42,-36},{58,-36},{58,-47},{76,-47}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(stratifiedHotWaterStorage_Electric.inletGrid, source.steam_a)
    annotation (Line(
      points={{42,-72},{60,-72},{60,-80},{76,-80}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(stratifiedHotWaterStorage_Electric.maxTemperature,
    simpleElectricBoilerController.u) annotation (Line(
      points={{-21.96,-16},{-68,-16},{-68,-8},{-90,-8},{-90,40},{-70,40}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(stratifiedHotWaterStorage_Electric.outletCHP, ZeroSource1.steam_a)
    annotation (Line(
      points={{-40,-56},{-52,-56},{-52,-80},{-62,-80}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(stratifiedHotWaterStorage_Electric.inletCHP, zeroSource2.steam_a)
    annotation (Line(
      points={{-40,-28},{-48,-28},{-48,-26},{-58,-26},{-58,-32},{-60,-32}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(ambient.port, stratifiedHotWaterStorage_Electric.heatLosses)
    annotation (Line(
      points={{18,48},{24,48},{24,-18},{25.6,-18}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(stratifiedHotWaterStorage_Electric.epp, power_L2_1.epp) annotation (
     Line(
      points={{-33.44,-12},{-33.44,11},{-18,11}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(simpleElectricBoilerController.y, gain.u) annotation (Line(
      points={{-52,30},{-52,24},{-37.2,24},{-37.2,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, power_L2_1.P_el_set) annotation (Line(
      points={{-23.4,30},{-21.6,30},{-21.6,19.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperature.port, stratifiedHotWaterStorage_Electric.outletGrid)
    annotation (Line(
      points={{58,-32},{52,-32},{52,-36},{42,-36}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=500),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Tester for HotwaterStorage_L4 with electric heating</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end Test_HeatStorageL4_Electrical;
