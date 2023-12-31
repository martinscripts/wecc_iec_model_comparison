model IEC_and_WECC_WT_SMIB
  Dynawo.Electrical.Wind.IEC.WT4ACurrentSource wT4ACurrentSource(BesPu = 0, DPMaxP4APu = 1, DPRefMax4APu = 100, DPRefMin4APu = -100, DUdb1Pu = -0.1, DUdb2Pu = 0.1, DfMaxPu = 1, DipMaxPu = 1, DiqMaxPu = 100, DiqMinPu = -100, GesPu = 0, IGsIm0Pu = 0, IGsRe0Pu = 0.5, IMaxDipPu = 1.3, IMaxPu = 1.3, IpMax0Pu = 1.2, IqH1Pu = 1.1, IqMax0Pu = 0.4, IqMaxPu = 1.1, IqMin0Pu = -0.4, IqMinPu = -1.1, IqPostPu = 0, Kipaw = 100, Kiq = 2.25, Kiqaw = 100, Kiu = 10, Kpaw = 1000, Kpq = 1.1, Kpqu = 20, Kpu = 2, Kpufrt = 2, Kqv = 2, MdfsLim = false, MpUScale = false, MqG = 1, Mqfrt = 1, Mqpri = false, P0Pu = -0.005, PaG0Pu = 0.5, Q0Pu = 0, QMax0Pu = 0.4, QMaxPu = 0.8, QMin0Pu = -0.4, QMinPu = -0.8, QlConst = true, RDropPu = 0, ResPu = 0, SNom = 1, U0Pu = 1, UGsIm0Pu = 1e-3, UGsRe0Pu = 1, UMaxPu = 1.1, UMinPu = 0.9, UOverPu = 999, UPhase0 = 0, UPll1Pu = 999, UPll2Pu = 0.13, URef0Pu = 0, UUnderPu = 1e-3, UpDipPu = 0, UpquMaxPu = 1.1, UqDipPu = 0.9, UqRisePu = 1.1, XDropPu = 0, XWT0Pu = 0, XesPu = 0.01, fOverPu = 999, fUnderPu = 1e-3, i0Pu = Complex(0.5, 0), tG = 0.01, tIFilt = 0.01, tPFilt = 0.01, tPOrdP4A = 0.1, tPWTRef4A = 0.01, tPll = 0.01, tPost = 0.1, tQFilt = 0.01, tQord = 0.05, tS = 0.001, tUFilt = 0.01, tUss = 30, tfFilt = 0.01, u0Pu = Complex(1, 0)) annotation(
    Placement(visible = true, transformation(origin = {-48, 28}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Dynawo.Electrical.Lines.Line line_IEC(BPu = 0, GPu = 0, RPu = 0, XPu = 0) annotation(
    Placement(visible = true, transformation(origin = {-16, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.Electrical.Buses.InfiniteBusWithVariations bus_IEC(U0Pu = 1, UEvtPu = 0.8, UPhase = 0, omega0Pu = 1, omegaEvtPu = 1, tOmegaEvtEnd = 9, tOmegaEvtStart = 8, tUEvtEnd = 6, tUEvtStart = 5) annotation(
    Placement(visible = true, transformation(origin = {0, 28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Step pWTrefPu(height = 0, offset = 0.5, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-106, 36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Step xWTrefPu(height = 0, offset = 0, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-106, 16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Step omegaRefPu(height = 0, offset = 1, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-126, 74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Dynawo.Electrical.Buses.InfiniteBusWithVariations bus_WECC(U0Pu = 1, UEvtPu = 0.8, UPhase = 0, omega0Pu = 1, omegaEvtPu = 1, tOmegaEvtEnd = 9, tOmegaEvtStart = 8, tUEvtEnd = 6, tUEvtStart = 5) annotation(
    Placement(visible = true, transformation(origin = {0, -26}, extent = {{-12, -12}, {12, 12}}, rotation = -90)));
  Dynawo.Electrical.Lines.Line line_WECC(BPu = 0, GPu = 0, RPu = 0, XPu = 0) annotation(
    Placement(visible = true, transformation(origin = {-16, -26}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant tanPhi annotation(
    Placement(visible = true, transformation(origin = {-126, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Dynawo.Electrical.Wind.WECC.WTG4BCurrentSource_noWP WECC_WT4B(DDn = 20, DPMax = 100, DPMin = -100, DUp = 0, Dbd = 0.05, Dbd1 = -0.1, Dbd2 = 0.1, EMax = 0.01, EMin = -0.01, FDbd1 = 0.01, FDbd2 = 0.01, FEMax = 0.05, FEMin = -0.05, FreqFlag = false, HoldIpMax = 0, HoldIq = -0.1, IMaxPu = 1.3, Id0Pu = 0.5, Iq0Pu = 0, IqFrzPu = 0, Iqh1Pu = 1.1, Iql1Pu = -1.1, IqrMaxPu = 100, IqrMinPu = -100, Kc = 2, Ki = 1, Kig = 1, Kp = 1, Kpg = 1, Kqi = 2.25, Kqp = 1.1, Kqv = 2, Kvi = 10, Kvp = 2, Lvplsw = true, P0Pu = -0.5, PF0 = 1, PFlag = false, PInj0Pu = 0.5, PMaxPu = 1, PMinPu = 0, PPriority = true, PfFlag = false, Q0Pu = 0, QFlag = true, QInj0Pu = 0, QMaxPu = 1, QMinPu = -1, RPu = 0, RateFlag = false, RefFlag = false, Rrpwr = 1, SNom = 1, Tiq = 0.05, U0Pu = 1, UInj0Pu = 1, UMaxPu = 1.1, UMinPu = 0.9, UPhaseInj0 = 0, VCompFlag = false, VDLIp11 = 0.9, VDLIp12 = 1.1, VDLIp21 = 1.1, VDLIp22 = 1.1, VDLIp31 = 1.11, VDLIp32 = 1.1, VDLIp41 = 1.12, VDLIp42 = 1.1, VDLIq11 = 0.9, VDLIq12 = 1.1, VDLIq21 = 1.1, VDLIq22 = 1.1, VDLIq31 = 1.11, VDLIq32 = 1.1, VDLIq41 = 1.12, VDLIq42 = 1.1, VFlag = true, VFrz = 0.9, VMaxPu = 1.1, VMinPu = 0.9, VRef0Pu = 1, VRef1Pu = 0, XPu = 0.01, brkpt = 1, i0Pu = Complex(0.5, 0), iInj0Pu = Complex(0.5, 0), lvpl1 = 1, s0Pu = Complex(0.5, 0), tFilterGC = 0.01, tFilterPC = 0.01, tFt = 0.01, tFv = 0.01, tG = 0.01, tLag = 0.01, tP = 0.01, tPord = 0.1, tRv = 0.01, u0Pu = Complex(1, 0), uInj0Pu = Complex(1, 0), zerox = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, -27}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
equation
  line_IEC.switchOffSignal1.value = false;
  line_IEC.switchOffSignal2.value = false;
  line_WECC.switchOffSignal1.value = false;
  line_WECC.switchOffSignal2.value = false;
  WECC_WT4B.injector.switchOffSignal1.value = false;
  WECC_WT4B.injector.switchOffSignal2.value = false;
  WECC_WT4B.injector.switchOffSignal3.value = false;
  WECC_WT4B.line.switchOffSignal2.value = WECC_WT4B.line.switchOffSignal1.value;
/* line.switchOffSignal1 is defined inside WECC model */
  connect(wT4ACurrentSource.terminal, line_IEC.terminal1) annotation(
    Line(points = {{-30.4, 28}, {-26.4, 28}}, color = {0, 0, 255}));
  connect(line_IEC.terminal2, bus_IEC.terminal) annotation(
    Line(points = {{-6, 28}, {0, 28}}, color = {0, 0, 255}));
  connect(pWTrefPu.y, wT4ACurrentSource.PWTRefPu) annotation(
    Line(points = {{-99.4, 36}, {-81.15, 36}, {-81.15, 31}, {-66.4, 31}}, color = {0, 0, 127}));
  connect(xWTrefPu.y, wT4ACurrentSource.xWTRefPu) annotation(
    Line(points = {{-99.4, 16}, {-80.9, 16}, {-80.9, 25}, {-66.4, 25}}, color = {0, 0, 127}));
  connect(omegaRefPu.y, wT4ACurrentSource.omegaRefPu) annotation(
    Line(points = {{-119.4, 74}, {-75.9, 74}, {-75.9, 18}, {-66.4, 18}}, color = {0, 0, 127}));
  connect(line_WECC.terminal2, bus_WECC.terminal) annotation(
    Line(points = {{-5, -26}, {0, -26}}, color = {0, 0, 255}));
  connect(tanPhi.y, wT4ACurrentSource.tanPhi) annotation(
    Line(points = {{-119.4, 54}, {-72.4, 54}, {-72.4, 38}, {-66.4, 38}}, color = {0, 0, 127}));
  connect(WECC_WT4B.terminal, line_WECC.terminal1) annotation(
    Line(points = {{-33, -27}, {-27, -27}, {-27, -26}, {-26, -26}}, color = {0, 0, 255}));
  connect(WECC_WT4B.PRefPu, pWTrefPu.y) annotation(
    Line(points = {{-69, -17}, {-88, -17}, {-88, 36}, {-100, 36}}, color = {0, 0, 127}));
  connect(WECC_WT4B.QRefPu, xWTrefPu.y) annotation(
    Line(points = {{-69, -27}, {-92, -27}, {-92, 16}, {-100, 16}}, color = {0, 0, 127}));
  annotation(
    uses(Dynawo(version = "1.0.1"), Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  version = "");
end IEC_and_WECC_WT_SMIB;
