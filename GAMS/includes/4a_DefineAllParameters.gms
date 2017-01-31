* ================================================================================================
* ================================================================================================
* ====================== STEP 4 - CALIBRATE THE MODEL  ===========================================
* ================================================================================================
* ================================================================================================

* This defines all the essential parameters for calibration.
* Additional ad-hoc parameters (for instance for checks) get added in the

parameter
* meta-parameters with parameter draws
fshare_t(g,f,h,draw)  unscaled draw the cobb-douglas factor shares
eshare_t(g,h,draw)    unscaled draw of expenditure shares

* drawn parameters:
pv_dr(g,v,draw)       drawn or computed from draw price at village level
pz_dr(g,draw)         drawn or computed from draw price at zoi level
ph_dr(g,h,draw)       drawn or computed from draw price as seen from household
pva_dr(g,h,draw)      drawn or computed from draw price of value added
qva_dr(g,h,draw)      drawn or computed from draw quantity of value added
qp_dr(g,h,draw)       drawn or computed from draw quantity produced
tqp_dr(g,draw)        drawn or computed total qty produced in the zoi
ttqp_dr(draw)         drawn or computed total output of the zoi
fd_dr(g,f,h,draw)     drawn or computed from draw factor demand
id_dr(g,gg,h,draw)    drawn or computed from draw intermediate demand
pshift_dr(g,h,draw)   drawn or computed from draw cobb-douglas production shifter
fshare_dr(g,f,h,draw) drawn or computed from draw cobb-douglas factor shares
r_dr(g,f,h,draw)      drawn or computed from draw rent for fixed factors
wv_dr(f,v,draw)       drawn or computed from draw village-wide wage for tradable factors
wz_dr(f,draw)         drawn or computed from draw zoi-wide wage for tradable factors
vash_dr(g,h,draw)     drawn or computed from draw value-added share
idsh_dr(gg,g,h,draw)  drawn or computed from draw intermediate demand share
tidsh_dr(gg,h,draw)   drawn or computed from draw total intermediate input share (1-vash)
fixfac_dr(g,f,h,draw) drawn or computed from draw fixed factor demand
unemp_dr(f,h,draw)    drawn or computed from draw unemployment
unempsh_dr(f,h,draw)  drawn or computed from draw hh share of total unemployment
vfmsfix_dr(f,v,draw)  drawn or computed from draw factors fixed at the Village level
zfmsfix_dr(f,draw)    drawn or computed from draw factors fixed at the zoi level
vmsfix_dr(g,v,draw)   drawn or computed from draw goods fixed at the Village level
zmsfix_dr(g,draw)     drawn or computed from draw goods fixed at the zoi level

exinc_dr(h,draw)      drawn or computed from draw exogenous income
endow_dr(f,h,draw)    drawn or computed from draw endowment
qc_dr(g,h,draw)       drawn or computed from draw level of consumption
tqc_dr(g,draw)        drawn or computed from draw total qc
eshare_dr(g,h,draw)    drawn or computed from draw consumption shares
y_dr(h,draw)          drawn or computed from draw nominal hh income
cpi_dr(h,draw)        drawn or computed from draw consumer price index of hh
ry_dr(h,draw)         drawn or computed from draw real hh income
emin_dr(g,h,draw)     drawn or computed from draw incompressible demand
trin_dr(h,draw)       drawn or computed from draw transfers in - received
trout_dr(h,draw)      drawn or computed from draw transfers out - given
trinsh_dr(h,draw)     drawn or computed from draw share of all transfers in the eco going to h
troutsh_dr(h,draw)    drawn or computed from draw share of yousehold h's income being given as transfers
hfd_dr(f,h,draw)      drawn or computed from draw factor demand of household h for factor f
vfd_dr(f,v,draw)      drawn or computed from draw village demand for factor f
zfd_dr(f,draw)        drawn or computed from draw zoi demand for factor f
hms_dr(g,h,draw)      drawn or computed from draw household marketed surplus of good g
vms_dr(g,v,draw)      drawn or computed from draw village marketed surplus of good g
zms_dr(g,draw)        drawn or computed from draw household marketed surplus of good g
hfms_dr(f,h,draw)     drawn or computed from draw household factor marketed surplus
vfms_dr(f,v,draw)     drawn or computed from draw village factor marketed surplus
zfms_dr(f,draw)       drawn or computed from draw zoi factor marketed surplus

savsh_dr(h,draw)      drawn or computed savings rate
sav_dr(h,draw)        drawn or computed savings level
exprocsh_dr(h,draw)   drawn or computed outside-of-zoi expenditures rate
exproc_dr(h,draw)     drawn or computed outside-of-zoi expenditures level
expzoish_dr(h,draw)   drawn or computed outside-of-zoi expenditures level


* calibration values in each draw
*pm1(g,draw)         calibrated market price
pv1(g,v,draw)       calibrated price at village level
pz1(g,draw)         calibrated price at zoi level
ph1(g,h,draw)       calibrated price as seen by household
pva1(g,h,draw)      calibrated price of value added
qva1(g,h,draw)      calibrated quantity of value added
qp1(g,h,draw)       calibrated quantity produced
tqp1(g,draw)        calibrated total quantity produced
ttqp1(draw)
hqp1(h,draw)        calibrated total qty produced by a household
fd1(g,f,h,draw)     calibrated factor demand
id1(g,gg,h,draw)    calibrated intermediate demand
pshift1(g,h,draw)   calibrated cobb-douglas shifter
fshare1(g,f,h,draw) calibrated cobb-douglas shares
r1(g,f,h,draw)      calibrated rent for fixed factors
wv1(f,v,draw)       calibrated village-wide wage for tradable factors
wz1(f,draw)         calibrated zoi-wide wage for tradable factors
vash1(g,h,draw)     calibrated value-added share
idsh1(gg,g,h,draw)  calibrated intermediate demand share
tidsh1(gg,h,draw)   calibrated total intermediate input share (1-vash)
fixfac1(g,f,h,draw) calibrated fixed factor demand
exinc1(h,draw)      calibrated exogenous income
endow1(f,h,draw)    calibrated endowment
qc1(g,h,draw)       calibrated level of consumption
eshare1(g,h,draw)    calibrated consumption shares
y1(h,draw)          calibrated income of household
cpi1(h,draw)        calibrated cpi
vqc1(v,g,draw)      calibrated village consumption
vcpi1(v,draw)       calibrated village cpi
cri1(v,f,draw)      calibrated rent weighted index

ry1(h,draw)         calibrated real income
ty1(draw)           calibrated income total
try1(draw)          calibrated real income total
emin1(g,h,draw)     calibrated incompressible demand
trin1(h,draw)       calibrated transfers in - received
trout1(h,draw)      calibrated transfers out - given
sav1(h,draw)        calibrated savings
exproc1(h,draw)     calibrated expenditure rest of country
trinsh1(h,draw)     calibrated share of all transfers in the eco going to h
troutsh1(h,draw)    calibrated share of yousehold h's income being given as transfers
hfd1(f,h,draw)      calibrated factor demand of household h for factor f
vfd1(f,v,draw)      calibrated village demand for factor f
zfd1(f,draw)        calibrated zoi demand for factor f
hms1(g,h,draw)      calibrated household marketed surplus of good g
vms1(g,v,draw)      calibrated village marketed surplus of good g
zms1(g,draw)        calibrated household marketed surplus of good g
*unemp1(f,h,draw)    calibrated unemployement in the household
hfms1(f,h,draw)     calibrated household factor marketed surplus
vfms1(f,v,draw)     calibrated village factor marketed surplus
zfms1(f,draw)       calibrated zoi factor marketed surplus
vfmsfix1(f,v,draw)    calibrated factors fixed at the Village level (family labor)
zfmsfix1(f,draw)      calibrated factors fixed at the zoi level (hired labor)
hfsup1(f,h,draw)    calibrated factor supply by the household


* after a simulation for each draw
*pm2(g,draw)         simulated market price
pv2(g,v,draw,sim)       simulated price at village level
pz2(g,draw,sim)         simulated price at zoi level
ph2(g,h,draw,sim)       simulated price as seen by household
pva2(g,h,draw,sim)      simulated price of value added
qva2(g,h,draw,sim)      simulated quantity of value added
qp2(g,h,draw,sim)       simulated quantity produced
tqp2(g,draw,sim)        simulated total quantity produced in the economy
ttqp2(draw,sim)
hqp2(h,draw,sim)         sim total qty produced by a household
fd2(g,f,h,draw,sim)     simulated factor demand
id2(g,gg,h,draw,sim)    simulated intermediate demand
pshift2(g,h,draw,sim)    simulated cobb-douglas shifter
fshare2(g,f,h,draw,sim) simulated cobb-douglas shares
r2(g,f,h,draw,sim)      simulated rent for fixed factors
wv2(f,v,draw,sim)       simulated village-wide wage for tradable factors
wz2(f,draw,sim)         simulated zoi-wide wage for tradable factors
vash2(g,h,draw,sim)     simulated value-added share
idsh2(gg,g,h,draw,sim)  simulated intermediate demand share
tidsh2(gg,h,draw,sim)   simulated total intermediate input share (2-vash)
fixfac2(g,f,h,draw,sim) simulated fixed factor demand
exinc2(h,draw,sim)      simulated exogenous income
endow2(f,h,draw,sim)    simulated endowment
qc2(g,h,draw,sim)       simulated level of consumption
eshare2(g,h,draw,sim)    simulated consumption shares
y2(h,draw,sim)          simulated income of household
cpi2(h,draw,sim)        simulated cpi
cri2(v,f,draw,sim)          simulated capital rent index (cap rent in activity*weight of activity)
vqc2(v,g,draw,sim)      simulated village consumption
vcpi2(v,draw,sim)       simulated village cpi


ry2(h,draw,sim)         simulated real income
ty2(draw,sim)           simulated income total
try2(draw,sim)          simulated real income total
emin2(g,h,draw,sim)     simulated incompressible demand
trin2(h,draw,sim)       simulated transfers in - received
trout2(h,draw,sim)      simulated transfers out - given
sav2(h,draw,sim)        simulated savings
exproc2(h,draw,sim)     simulated expenditure rest of country
trinsh2(h,draw,sim)     simulated share of all transfers in the eco going to h
troutsh2(h,draw,sim)    simulated share of yousehold h's income being given as transfers
hfd2(f,h,draw,sim)      simulated factor demand of household h for factor f
vfd2(f,v,draw,sim)      simulated village demand for factor f
zfd2(f,draw,sim)        simulated zoi demand for factor f
hms2(g,h,draw,sim)      simulated household marketed surplus of good g
vms2(g,v,draw,sim)      simulated village marketed surplus of good g
zms2(g,draw,sim)        simulated household marketed surplus of good g
*unemp2(f,h,draw,sim)    calibrated unemployement in the households
hfms2(f,h,draw,sim)     simulated household factor marketed surplus
vfms2(f,v,draw,sim)     simulated village factor marketed surplus
zfms2(f,draw,sim)       simulated zoi factor marketed surplus
hfsup2(f,h,draw,sim)    simulated factor supply by the household

* delta calibration /simulation
pvD(g,v,draw,sim)       delta price at village level
pzD(g,draw,sim)         delta price at zoi level
phD(g,h,draw,sim)       delta price as seen by household

pvaD(g,h,draw,sim)      delta price of value added
qvaD(g,h,draw,sim)      delta quantity of value added
qpD(g,h,draw,sim)       delta quantity produced
tqpD(g,draw,sim)        delta total qp
ttqpD(draw,sim)
hqpD(h,draw,sim)          delta hqp
fdD(g,f,h,draw,sim)     delta factor demand
idD(g,gg,h,draw,sim)    delta intermediate demand
pshiftD(g,h,draw,sim)    delta cobb-douglas shifter
fshareD(g,f,h,draw,sim) delta cobb-douglas shares
rD(g,f,h,draw,sim)      delta rent for fixed factors
wvD(f,v,draw,sim)       delta village-wide wage for tradable factors
wzD(f,draw,sim)         delta zoi-wide wage for tradable factors
vashD(g,h,draw,sim)     delta value-added share
idshD(gg,g,h,draw,sim)  delta intermediate demand share
tidshD(gg,h,draw,sim)   delta total intermediate input share (1-vash)
fixfacD(g,f,h,draw,sim) delta fixed factor demand
exincD(h,draw,sim)      delta exogenous income
endowD(f,h,draw,sim)    delta endowment
qcD(g,h,draw,sim)       delta level of consumption
eshareD(g,h,draw,sim)    delta consumption shares
yD(h,draw,sim)          delta income of household
cpiD(h,draw,sim)        delta cpi
criD(v,f,draw,sim)        delta capital rent index (cap rent in activity*weight of activity)
vqcD(v,g,draw,sim)      delta village consumption
vcpiD(v,draw,sim)       delta village cpi

ryD(h,draw,sim)         delta real income
tyD(draw,sim)           delta income total
tryD(draw,sim)          delta real income total
eminD(g,h,draw,sim)     delta incompressible demand
trinD(h,draw,sim)       delta transfers in - received
troutD(h,draw,sim)      delta transfers out - given
savD(h,draw,sim)        delta savings
exprocD(h,draw,sim)     delta expenditure rest of country
trinshD(h,draw,sim)     delta share of all transfers in the eco going to h
troutshD(h,draw,sim)    delta share of yousehold h's income being given as transfers
hfdD(f,h,draw,sim)      delta factor demand of household h for factor f
vfdD(f,v,draw,sim)      delta village demand for factor f
zfdD(f,draw,sim)        delta zoi demand for factor f
hmsD(g,h,draw,sim)      delta household marketed surplus of good g
vmsD(g,v,draw,sim)      delta village marketed surplus of good g
zmsD(g,draw,sim)        delta household marketed surplus of good g
hfmsD(f,h,draw,sim)     delta household factor marketed surplus
vfmsD(f,v,draw,sim)     delta village factor marketed surplus
zfmsD(f,draw,sim)       delta zoi factor marketed surplus
hfsupD(f,h,draw,sim)    delta factor supply by the household

* percent change calibration/simulation
pvPC(g,v,draw,sim)        % change price at village level
pzPC(g,draw,sim)          % chage price at zoi level
phPC(g,h,draw,sim)        % change price as seen by household

pvaPC(g,h,draw,sim)      % change price of value added
qvaPC(g,h,draw,sim)      % change quantity of value added
qpPC(g,h,draw,sim)       % change quantity produced
tqpPC(g,draw,sim)        % change in total qp
ttqpPC(draw,sim)
hqpPC(h,draw,sim)          % change in hqp

fdPC(g,f,h,draw,sim)     % change factor demand
idPC(g,gg,h,draw,sim)    % change intermediate demand
pshiftPC(g,h,draw,sim)    % change cobb-douglas shifter
fsharePC(g,f,h,draw,sim) % change cobb-douglas shares
rPC(g,f,h,draw,sim)      % change rent for fixed factors
wvPC(f,v,draw,sim)       % change village-wide wage for tradable factors
wzPC(f,draw,sim)         % change zoi-wide wage for tradable factors
vashPC(g,h,draw,sim)     % change value-added share
idshPC(gg,g,h,draw,sim)  % change intermediate demand share
tidshPC(gg,h,draw,sim)   % change total intermediate input share (1-vash)
fixfacPC(g,f,h,draw,sim) % change fixed factor demand
exincPC(h,draw,sim)      % change exogenous income
endowPC(f,h,draw,sim)    % change endowment
qcPC(g,h,draw,sim)       % change level of consumption
esharePC(g,h,draw,sim)    % change consumption shares
yPC(h,draw,sim)          % change income of household
cpiPC(h,draw,sim)        % change in cpi
criPC(v,f,draw,sim)        % change capital rent index (cap rent in activity*weight of activity)
vqcPC(v,g,draw,sim)      % change village consumption
vcpiPC(v,draw,sim)       % change village cpi


ryPC(h,draw,sim)         % change in real income
tyPC(draw,sim)           % change income total
tryPC(draw,sim)          % change real income total
eminPC(g,h,draw,sim)     % change incompressible demand
trinPC(h,draw,sim)       % change transfers in - received
troutPC(h,draw,sim)      % change transfers out - given
savPC(h,draw,sim)        % change savings
exprocPC(h,draw,sim)     % change expenditure rest of country
trinshPC(h,draw,sim)     % change share of all transfers in the eco going to h
troutshPC(h,draw,sim)    % change share of yousehold h's income being given as transfers
hfdPC(f,h,draw,sim)      % change factor demand of household h for factor f
vfdPC(f,v,draw,sim)      % change village demand for factor f
zfdPC(f,draw,sim)        % change zoi demand for factor f
hmsPC(g,h,draw,sim)      % change household marketed surplus of good g
vmsPC(g,v,draw,sim)      % change village marketed surplus of good g
zmsPC(g,draw,sim)        % change household marketed surplus of good g
hfmsPC(f,h,draw,sim)     % change household factor marketed surplus
vfmsPC(f,v,draw,sim)     % change village factor marketed surplus
zfmsPC(f,draw,sim)       % change zoi factor marketed surplus
hfsupPC(f,h,draw,sim)    % change factor supply by the household
;


$macro display_pars(i) display pv&i, pz&i, ph&i, qva&i, fd&i, id&i, r&i, wv&i, wz&i, qp&i, tqp&i,    \
ttqp&i , fixfac&i, pva&i, exinc&i, endow&i, y&i, cpi&i, vcpi&i, ry&i, trinsh&i, qc&i, eshare&i, troutsh&i, hfsup&i, hfd&i, vfd&i, zfd&i, hms&i, vms&i, zms&i, hfms&i, vfms&i, zfms&i ;


