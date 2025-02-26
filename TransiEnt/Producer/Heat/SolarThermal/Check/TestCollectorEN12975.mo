within TransiEnt.Producer.Heat.SolarThermal.Check;
model TestCollectorEN12975 "Tester for a solar collector using the ambient tables and fluid sinks and sources"
  //import TransiEnt;



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

  extends TransiEnt.Basics.Icons.Checkmodel;
  import Const = Modelica.Constants;
  import      Modelica.Units.SI;

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

public
  inner TransiEnt.SimCenter simCenter(redeclare TILMedia.VLEFluidTypes.TILMedia_SplineWater fluid1, ambientConditions(
      redeclare TransiEnt.Basics.Tables.Ambient.GHI_Hamburg_3600s_2012_TMY globalSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.DNI_Hamburg_3600s_2012_TMY directSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.DHI_Hamburg_3600s_2012_TMY diffuseSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.Temperature_Berlin_3600s_2012 temperature,
      redeclare TransiEnt.Basics.Tables.Ambient.Wind_Hamburg_Fuhlsbuettel_3600s_2012 wind))
                                       annotation (Placement(transformation(extent={{-98,80},{-78,100}})));

  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi sink(
    variable_p=false,
    variable_T=false,
    variable_xi=false,
    p_const=100000,
    showData=false,
    T_const=315) annotation (Placement(transformation(extent={{112,-32},{92,-12}})));

  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow source(
    m_flow_const=0.003,
    T_const=simCenter.T_amb_const,
    variable_T=true)    annotation (Placement(transformation(extent={{-20,-32},{0,-12}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T T_in(unitOption=2)
                                               annotation (Placement(transformation(extent={{10,-22},{30,-2}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T T_out(unitOption=2)
                                                annotation (Placement(transformation(extent={{62,-22},{82,-2}})));

  TransiEnt.Producer.Heat.SolarThermal.SolarCollector_L1_constProp solarCollector(
    area=2.33,
    eta_0=0.793,
    a1=4.04,
    a2=0.0182,
    c_eff=5000,
    redeclare model Skymodel = Base.Skymodel_isotropicDiffuse,
    G_min=150,
    useHomotopy=true,
    kind=1,
    slope=Modelica.Units.Conversions.from_deg(40),
    constant_iam_diff=1,
    Q_flow_n=100e3,
    longitude_local=0.17453292519943,
    surfaceAzimuthAngle=0.17453292519943) annotation (Placement(transformation(extent={{38,-32},{58,-12}})));

  inner ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-100,58},{-80,78}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=20 + 273.15)                  annotation (Placement(transformation(extent={{-48,-32},{-28,-12}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi sink1(
    variable_p=false,
    variable_T=false,
    variable_xi=false,
    p_const=100000,
    showData=false,
    T_const=315) annotation (Placement(transformation(extent={{114,40},{94,60}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow source1(
    m_flow_const=0.003,
    T_const=simCenter.T_amb_const,
    variable_T=true)    annotation (Placement(transformation(extent={{-18,40},{2,60}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T T_in1(unitOption=2)
                                               annotation (Placement(transformation(extent={{12,50},{32,70}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T T_out1(unitOption=2)
                                                annotation (Placement(transformation(extent={{64,50},{84,70}})));
  TransiEnt.Producer.Heat.SolarThermal.SolarCollector_L1_constProp solarCollector1(
    area=2.33,
    eta_0=0.793,
    a1=4.04,
    a2=0.0182,
    c_eff=5000,
    redeclare model Skymodel = Base.Skymodel_isotropicDiffuse,
    G_min=150,
    useHomotopy=true,
    kind=1,
    slope=Modelica.Units.Conversions.from_deg(40),
    constant_iam_diff=1,
    Q_flow_n=100e3,
    use_input_data=true,
    longitude_local=0.17453292519943,
    surfaceAzimuthAngle=0.17453292519943) annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=20 + 273.15)                 annotation (Placement(transformation(extent={{-46,40},{-26,60}})));
  Basics.Tables.Ambient.DNI_Hamburg_3600s_2012_TMY dNI_Hamburg_3600s_2012_TMY annotation (Placement(transformation(extent={{-6,22},{14,42}})));
  Basics.Tables.Ambient.DHI_Hamburg_3600s_2012_TMY dHI_Hamburg_3600s_2012_TMY annotation (Placement(transformation(extent={{-42,6},{-22,26}})));
equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(source.steam_a, solarCollector.waterPortIn) annotation (Line(
      points={{0,-22},{40,-22}},
      color={0,131,169},
      thickness=0.5));
  connect(sink.steam_a, solarCollector.waterPortOut) annotation (Line(
      points={{92,-22},{56,-22}},
      color={0,131,169},
      thickness=0.5));
  connect(T_in.port, solarCollector.waterPortIn) annotation (Line(
      points={{20,-22},{40,-22}},
      color={0,131,169},
      thickness=0.5));
  connect(T_out.port, solarCollector.waterPortOut) annotation (Line(
      points={{72,-22},{56,-22}},
      color={0,131,169},
      thickness=0.5));
  connect(source.steam_a, T_in.port) annotation (Line(
      points={{0,-22},{20,-22}},
      color={0,131,169},
      thickness=0.5));
  connect(sink.steam_a, T_out.port) annotation (Line(
      points={{92,-22},{72,-22}},
      color={0,131,169},
      thickness=0.5));
  connect(source.T, realExpression.y) annotation (Line(points={{-22,-22},{-27,-22}},
                                                                                   color={0,0,127}));
  connect(source1.steam_a, solarCollector1.waterPortIn) annotation (Line(
      points={{2,50},{42,50}},
      color={0,131,169},
      thickness=0.5));
  connect(sink1.steam_a, solarCollector1.waterPortOut) annotation (Line(
      points={{94,50},{58,50}},
      color={0,131,169},
      thickness=0.5));
  connect(T_in1.port, solarCollector1.waterPortIn) annotation (Line(
      points={{22,50},{42,50}},
      color={0,131,169},
      thickness=0.5));
  connect(T_out1.port, solarCollector1.waterPortOut) annotation (Line(
      points={{74,50},{58,50}},
      color={0,131,169},
      thickness=0.5));
  connect(source1.steam_a, T_in1.port) annotation (Line(
      points={{2,50},{22,50}},
      color={0,131,169},
      thickness=0.5));
  connect(sink1.steam_a, T_out1.port) annotation (Line(
      points={{94,50},{74,50}},
      color={0,131,169},
      thickness=0.5));
  connect(source1.T, realExpression1.y) annotation (Line(points={{-20,50},{-25,50}}, color={0,0,127}));
  connect(dNI_Hamburg_3600s_2012_TMY.y1, solarCollector1.irradiance_direct_measured_input) annotation (Line(points={{15,32},{46,32},{46,38}}, color={0,0,127}));
  connect(dHI_Hamburg_3600s_2012_TMY.y1, solarCollector1.irradiance_diffuse_horizontal_input) annotation (Line(points={{-21,16},{54,16},{54,38}},color={0,0,127}));
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test model for CollectorEN12975 model</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
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
<p>Note that the inlet temperature should never fall below 0 &deg;C. A possible controller for this case can be looked at under TransiEnt.Producer.Heat.SolarThermal.Controller.</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Lisa Andresen (andresen@tuhh.de), Apr 2014</p>
</html>"), Diagram(graphics={Text(
          extent={{-66,96},{102,78}},
          textColor={28,108,200},
          fontSize=8,
          horizontalAlignment=TextAlignment.Left,
          textString="Look at:
- T_out/T_out1
- solarCollector.Q_flow_collector/solarCollector1.Q_flow_collector")},
                   coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{120,100}})),
    experiment(
      StopTime=3.1536e+007,
      Interval=100,
      Tolerance=0.001),
    __Dymola_experimentSetupOutput,
    Icon(graphics,
         coordinateSystem(extent={{-100,-100},{100,100}})));
end TestCollectorEN12975;
