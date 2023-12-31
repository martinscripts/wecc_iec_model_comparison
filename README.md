# wecc_iec_model_comparison
Comparison of generic electrical wind turbine models following WECC and IEC standards
 
## IEC_and_WECC_WT_SMIB.mo
is the first test case with IEC and WECC running in parallel.

## Available test cases
- T1: an active power setpoint step (-0.5 pu)
- T2: a reactive power setpoint step (0.3 pu)
- T3: a voltage setpoint step  (0.03 pu)
- T4: a solid fault at the \ac{wt} terminal (150 ms)
- T5: a fault at the \ac{wt} terminal (150 ms with x_f = 0.2 pu)
- test001_StepP consists in a step on PRef at the turbine.
- test002_StepQ consists in a step on QRef at the turbine.
- test003_SolidFault consists in a solid fault (R = 0, X= 0.0001 pu) at the turbine terminal from t = 5 to t = 5.1 s
- test004_StepU consists in a step on URef at the turbine.

# Collection and elaboration of relevant differences (Outdated!)
Please note: List is outdated. Maintained version is in [report document](https://www.overleaf.com/project/65490a7bffa6d573977569f5).


Working document: Relevances to be updated during the investigations.

Relevance:
- 0 ... irrelevant
- 1 ... relevant
- 2 ... very relevant


## Wind Turbine P Control (WT_P)

| No. | Relevance | Description                                                                                                                                                                 | Test case                          |
| --- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| 1   | 1         | IEC: PT1 not frozen during FRT (P scaling with different threshold u_pdip instead)                                                                                          | (mentioned in paper)               |
| 2   | 1         | IEC: second PT1 element; WECC: no additional PT1 (T_pWTrefA)                                                                                                                | (mentioned in paper)               |
| 3   | 1         | IEC: additional positive ramp rate limit dpmax4A in PT1                                                                                                                     | (mentioned in paper)               |
| 4   | 2         | IEC: uses product of (dynamic) CLS value ipmax and voltage u_WTC for PT1 limit; WECC: uses constants Pmax, Pmin; connected to difference 2 and to pos. ramp limits and lags | T5, T5_noramp (mentioned in paper) |
| 5   |           | IEC: no negative limit in second PT1; WECC: has lower limit Pmin                                                                                                                                      |                                    |
| 6   |           | IEC has p_aero output                                                                                                                                                       |                                    |
| 7   | 1         | IEC has low-voltage P scaling option (M_pUscale=1) to reduce pref by voltage-p.u. during voltage dip                                                                        | (mentioned in paper)               |

## Wind Turbine Q Control (WT_Q)

| No. | Relevance | Description                                                                                                                                   | Test case                                 |
| --- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| 8   | 1         | IEC: $q_{WTmax\|min}$ from Q limitation block; WECC: constants Qmax, Qmin.                                                                    | (mentined in paper)                       |
| 9   |           | WECC: has extra min limit for reactive current during FRT (iql1); IEC uses minimum limit from normal path                                     |                                           |
| 10  | 0         | IEC has local voltage drop compensation (WECC REEC_A doesn't) [added in WECC version REEC_D]                                                  | (mentioned in paper)                      |
| 11  |           | IEC: Q control voltage drop compensation current measurement has a ground admittance element. i_gs can be larger than i_WT. (WECC: i_gs=i_WT) |                                           |
| 12  |           | IEC: U-PI-Controller Limits seperately on proportional and integral Part; WECC: one common limit on output of PI controller                   |                                           |
| 13  |           | IEC: Q-PI-controller limit on integral part and on PI controller output; WECC: Q-PI-Controller limit only on PI Controller output.            |                                           |
| 14  |           | Mode 2: IEC: 1st order lag before current calculation (WECC: after current calculation)                                                       |                                           |
| 15  |           | IEC: tan(phi) as parameter; WECC: phi as input signal                                                                                         |                                           |
| 16  | 2         | IEC: defines post-fault state (F_FRT=2) only in case of under-voltage events; WECC: for over-voltage events as well                           | (mentioned in paper)                      |
| 17  | 2         | IEC: different delta u sign in fast current injection (!)                                                                                     | (mentioned in paper)                      |
| 18  | 2         | IEC: pre-fault voltage calculated by HPF; WECC: by subtraction of Vref0                                                                       | T5_Tuss (mentioned in paper)              |
| 19  | 1         | WECC: Iql1, Iqh1 are fast-injected current limits (i_qvhook); IEC: iqh1, iqmin are limits for total injected current (i_qcmd) during FRT.     | (mentined in paper)                       |
| 20  | 0         | IEC uses filtered voltage u_WTCfilt for FRT mode detecion; WECC uses unfiltered u_WTC [changed in WECC version REEC_D]                        | 003 iqCmdPu, see #29 (mentioned in paper) |
| 21  |           | WECC: uses CLS value Iqmax, Iqmin in Voltage PI controller; IEC: uses constants                                                               |                                           |
| 22  | 1         | IEC: during FRT, gain of voltage PI-controller can be adapted to K_PuFRT and output limiter removed.                                          | (mentioned in paper)                      |


## Current Limitation System (WT_CLS)

| No. | Relevance | Description                                                                                                                                                                | Test case                           |
| --- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| 23  |           | WECC: Current Limiting System (CLS) acts on P and Q control scheme; IEC: CLS passes limits to generator model. Limits inside P,Q contrl schemes are additional parameters. |                                     |
| 24  | 0         | WECC: Voltage Dependent Limits have only 4 pairs of u / i [increased in REEC_D]                                                                                            |                                     |
| 25  | 1         | IEC: diffrent parameter i_maxdip during FRT; WECC: same imax during FRT ((5))                                                                                              | (mentioned in paper)                |
| 26  |           | WECC CSL: makes sure that VDL is always <= imax (this check is not performed in IEC CLS) ((4))                                                                             |                                     |
| 27  | 2         | IEC: high-voltage current limit logic (K_pqu-logic); WECC: no such logic ((3))                                                                                             | T3_iqlimit (mentioned in paper)     |
| 28  | 2         | IEC: P-priority always active outside FRT, regardless of M_qpri; WECC: priority according to setting, also outside FRT ((2))                                               | T3 (largeStep) (mentioned in paper) |
| 29  |           | IEC CLS: when subtracting the prioritized quantity, explicitly makes sure that I_cmd doesn't exceed VDL ((1))                                                              |                                     |
| 30  | 1         | WECC additionally has Thld2, which holds active current limit i_pmax at during-fault-value for Thld2 seconds after fault clearing.                                         | (mentioned in paper)                |

## Reactive Power Limitation System (WT_QLS)

| No. | Relevance | Description                  | Test case            |
| --- | --------- | ---------------------------- | -------------------- |
| 31  | 1         | IEC: has Q limitation system | (mentioned in paper) |

## Wind Turbine Measurement (WT_meas)

| No. | Relevance | Description                                                                                                                                                                                             | Test case                                        |
| --- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| 32  | 0         | IEC: measurement in separate model; WECC: measurement inside controller structure                                                                                                                       | (mentioned in paper)                             |
| 33  | 2         | WECC: no measurement filter for q                                                                                                                                                                       | T4 (with tQFilt > 0 in IEC) (mentioned in paper) |

## Wind Turbine Generator System (WT_GS)

| No. | Relevance | Description                                                                                                                                                                                             | Test case                                        |
| --- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| 34  | 2         | IEC: ip and iq limits applied after the T_g first order lag; WECC: before; see also 27;                                                                                                                 | T4 (mentioned in paper)                          |
| 35  | 1         | WECC: iq ramprate limit depends on sign(Qref)                                                                                                                                                           | (mentioned in paper)                             |
| 36  | 0         | WECC: has Low Voltage Power Limit (LVPL) ((comparable to low voltage P reduction in P path?)) [removed in REGC_B]                                                                                       | (mentioned in paper)                             |
| 37  |           | WECC: Has high voltage reactive power management and low voltage active power management (for numerical reasons and different in different simulation tools. --> not sensible to include in comparison) |                                                  |
| 38  | 1         | IEC: reference frame rotation block with first order lag model of PLL                                                                                                                                   | (mentioned in paper)                             |

## Wind Turbine Protection (not included in comparison)
but added for completeness

| No. | Relevance | Description                                                                                                                                                                                             | Test case                                        |
| --- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| 39  |           | IEC has included protection module; WECC references external modules from commercial software. --> leave this out of scope                                                                              |                                                  |

