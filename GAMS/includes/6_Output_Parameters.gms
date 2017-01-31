

* ================================================================================================
* ================================================================================================
* ===================== STEP 5 - OUTPUT PARAMETERS ==========================================================
* ================================================================================================
* ================================================================================================

* now compute and display all the values, differences in values, standard errors, etc...
display_pars(1) ;
display_pars(2) ;


* DELTA between each calibration and the corresponding simulation
pshiftD(g,h,draw,sim)    = pshift2(g,h,draw,sim)     - pshift1(g,h,draw);
fshareD(g,f,h,draw,sim) = fshare2(g,f,h,draw,sim)    - fshare1(g,f,h,draw) ;
pvD(g,v,draw,sim)       = pv2(g,v,draw,sim)          - pv1(g,v,draw) ;
pzD(g,draw,sim)         = pz2(g,draw,sim)            - pz1(g,draw) ;
phD(g,h,draw,sim)       = ph2(g,h,draw,sim)          - ph1(g,h,draw) ;
qvaD(g,h,draw,sim)      = qva2(g,h,draw,sim)         - qva1(g,h,draw) ;
fdD(g,f,h,draw,sim)     = fd2(g,f,h,draw,sim)        - fd1(g,f,h,draw) ;
idD(gg,g,h,draw,sim)    = id2(gg,g,h,draw,sim)       - id1(gg,g,h,draw) ;
rD(g,fk,h,draw,sim)     = r2(g,fk,h,draw,sim)        - r1(g,fk,h,draw) ;
wvD(f,v,draw,sim)       = wv2(f,v,draw,sim)          - wv1(f,v,draw) ;
wzD(f,draw,sim)         = wz2(f,draw,sim)            - wz1(f,draw) ;
qpD(g,h,draw,sim)       = qp2(g,h,draw,sim)          - qp1(g,h,draw) ;
tqpD(g,draw,sim)        = tqp2(g,draw,sim)           - tqp1(g,draw) ;
ttqpD(draw,sim)         = ttqp2(draw,sim)            - ttqp1(draw) ;
hqpD(h,draw,sim)        = hqp2(h,draw,sim)           - hqp1(h,draw) ;

fixfacD(g,fk,h,draw,sim) = fixfac2(g,fk,h,draw,sim)  - fixfac1(g,fk,h,draw) ;
pvaD(g,h,draw,sim)      = pva2(g,h,draw,sim)         - pva1(g,h,draw) ;
exincD(h,draw,sim)      = exinc2(h,draw,sim)         - exinc1(h,draw) ;
endowD(f,h,draw,sim)    = endow2(f,h,draw,sim)       - endow1(f,h,draw) ;
yD(h,draw,sim)          = y2(h,draw,sim)             - y1(h,draw) ;
cpiD(h,draw,sim)        = cpi2(h,draw,sim)           - cpi1(h,draw) ;
vqcD(v,g,draw,sim)      = vqc2(v,g,draw,sim)         - vqc1(v,g,draw) ;
vcpiD(v,draw,sim)       = vcpi2(v,draw,sim)          - vcpi1(v,draw);
criD(v,f,draw,sim)      = cri2(v,f,draw,sim)         - cri1(v,f,draw);
ryD(h,draw,sim)         = ry2(h,draw,sim)            - ry1(h,draw) ;
tyD(draw,sim)           = ty2(draw,sim)              - ty1(draw) ;
tryD(draw,sim)          = try2(draw,sim)             - try1(draw) ;
trinshD(h,draw,sim)     = trinsh2(h,draw,sim)        - trinsh1(h,draw) ;
qcD(g,h,draw,sim)       = qc2(g,h,draw,sim)          - qc1(g,h,draw) ;
eshareD(g,h,draw,sim)   = eshare2(g,h,draw,sim)      - eshare1(g,h,draw) ;
troutshD(h,draw,sim)    = troutsh2(h,draw,sim)       - troutsh1(h,draw) ;
hfdD(f,h,draw,sim)      = hfd2(f,h,draw,sim)         - hfd1(f,h,draw) ;
vfdD(f,v,draw,sim)      = vfd2(f,v,draw,sim)         - vfd1(f,v,draw) ;
zfdD(f,draw,sim)        = zfd2(f,draw,sim)           - zfd1(f,draw) ;
hmsD(g,h,draw,sim)      = hms2(g,h,draw,sim)         - hms1(g,h,draw) ;
vmsD(g,v,draw,sim)      = vms2(g,v,draw,sim)         - vms1(g,v,draw) ;
zmsD(g,draw,sim)        = zms2(g,draw,sim)           - zms1(g,draw) ;
hfmsD(ft,h,draw,sim)    = hfms2(ft,h,draw,sim)       - hfms1(ft,h,draw) ;
vfmsD(ft,v,draw,sim)    = vfms2(ft,v,draw,sim)       - vfms1(ft,v,draw) ;
zfmsD(ft,draw,sim)      = zfms2(ft,draw,sim)         - zfms1(ft,draw) ;
vashD(g,h,draw,sim)     = vash2(g,h,draw,sim)        - vash1(g,h,draw) ;
trinD(h,draw,sim)       = trin2(h,draw,sim)          - trin1(h,draw) ;
troutD(h,draw,sim)      = trout2(h,draw,sim)         - trout1(h,draw) ;
savD(h,draw,sim)        = sav2(h,draw,sim)           - sav1(h,draw) ;
exprocD(h,draw,sim)     = exproc2(h,draw,sim)        - exproc1(h,draw) ;
hfsupD(f,h,draw,sim)    = hfsup2(f,h,draw,sim)       - hfsup1(f,h,draw) ;

* PERCENT CHANGE between each calibration and the corresponding simulation
pshiftPC(g,h,draw,sim)$pshift1(g,h,draw)    = 100*pshiftD(g,h,draw,sim)/ pshift1(g,h,draw);
fsharePC(g,f,h,draw,sim)$fshare1(g,f,h,draw) = 100*fshareD(g,f,h,draw,sim) / fshare1(g,f,h,draw) ;
pvPC(g,v,draw,sim)$pv1(g,v,draw)        = 100*pvD(g,v,draw,sim)          / pv1(g,v,draw) ;
pzPC(g,draw,sim)$pz1(g,draw)            = 100*pzD(g,draw,sim)            / pz1(g,draw) ;
phPC(g,h,draw,sim)$ph1(g,h,draw)        = 100*phD(g,h,draw,sim)          / ph1(g,h,draw) ;
qvaPC(g,h,draw,sim)$qva1(g,h,draw)      = 100*qvaD(g,h,draw,sim)         / qva1(g,h,draw) ;
fdPC(g,f,h,draw,sim)$fd1(g,f,h,draw)    = 100*fdD(g,f,h,draw,sim)        / fd1(g,f,h,draw) ;
idPC(gg,g,h,draw,sim)$id1(gg,g,h,draw)  = 100*idD(gg,g,h,draw,sim)       / id1(gg,g,h,draw) ;
rPC(g,fk,h,draw,sim)$r1(g,fk,h,draw)    = 100*rD(g,fk,h,draw,sim)        / r1(g,fk,h,draw) ;
wvPC(f,v,draw,sim)$wv1(f,v,draw)        = 100*wvD(f,v,draw,sim)          / wv1(f,v,draw) ;
wzPC(f,draw,sim)$wz1(f,draw)            = 100*wzD(f,draw,sim)            / wz1(f,draw) ;
qpPC(g,h,draw,sim)$qp1(g,h,draw)        = 100*qpD(g,h,draw,sim)          / qp1(g,h,draw) ;
tqpPC(g,draw,sim)$tqp1(g,draw)          = 100*tqpD(g,draw,sim)           / tqp1(g,draw) ;
ttqpPC(draw,sim)$ttqp1(draw)            = 100*ttqpD(draw,sim)            / ttqp1(draw) ;

fixfacPC(g,fk,h,draw,sim)$fixfac1(g,fk,h,draw)  = 100*fixfacD(g,fk,h,draw,sim) / fixfac1(g,fk,h,draw) ;
pvaPC(g,h,draw,sim)$pva1(g,h,draw)      = 100*pvaD(g,h,draw,sim)         / pva1(g,h,draw) ;
exincPC(h,draw,sim)$exinc1(h,draw)      = 100*exincD(h,draw,sim)         / exinc1(h,draw) ;
endowPC(f,h,draw,sim)$endow1(f,h,draw)  = 100*endowD(f,h,draw,sim)       / endow1(f,h,draw) ;
yPC(h,draw,sim)$y1(h,draw)              = 100*yD(h,draw,sim)             / y1(h,draw) ;
cpiPC(h,draw,sim)$cpi1(h,draw)          = 100*cpiD(h,draw,sim)           / cpi1(h,draw) ;
vcpiPC(v,draw,sim)$vcpi1(v,draw)        = 100*vcpiD(v,draw,sim)          / vcpi1(v,draw) ;
criPC(v,f,draw,sim)$cri1(v,f,draw)      = 100*criD(v,f,draw,sim)         / cri1(v,f,draw) ;

ryPC(h,draw,sim)$ry1(h,draw)            = 100*ryD(h,draw,sim)            / ry1(h,draw) ;
tyPC(draw,sim)$ty1(draw)                = 100*tyD(draw,sim)              / ty1(draw) ;
tryPC(draw,sim)$try1(draw)              = 100*tryD(draw,sim)             / try1(draw) ;
trinshPC(h,draw,sim)$trinsh1(h,draw)    = 100*trinshD(h,draw,sim)        / trinsh1(h,draw) ;
qcPC(g,h,draw,sim)$qc1(g,h,draw)        = 100*qcD(g,h,draw,sim)          / qc1(g,h,draw) ;
esharePC(g,h,draw,sim)$eshare1(g,h,draw)  = 100*eshareD(g,h,draw,sim)    / eshare1(g,h,draw) ;
troutshPC(h,draw,sim)$troutsh1(h,draw)  = 100*troutshD(h,draw,sim)       / troutsh1(h,draw) ;
hfdPC(f,h,draw,sim)$hfd1(f,h,draw)      = 100*hfdD(f,h,draw,sim)         / hfd1(f,h,draw) ;
vfdPC(f,v,draw,sim)$vfd1(f,v,draw)      = 100*vfdD(f,v,draw,sim)         / vfd1(f,v,draw) ;
zfdPC(f,draw,sim)$zfd1(f,draw)          = 100*zfdD(f,draw,sim)           / zfd1(f,draw) ;
hmsPC(g,h,draw,sim)$hms1(g,h,draw)      = 100*hmsD(g,h,draw,sim)         / hms1(g,h,draw) ;
vmsPC(g,v,draw,sim)$vms1(g,v,draw)      = 100*vmsD(g,v,draw,sim)         / vms1(g,v,draw) ;
zmsPC(g,draw,sim)$zms1(g,draw)          = 100*zmsD(g,draw,sim)           / zms1(g,draw) ;
hfmsPC(ft,h,draw,sim)$hfms1(ft,h,draw)  = 100*hfmsD(ft,h,draw,sim)       / hfms1(ft,h,draw) ;
vfmsPC(ft,v,draw,sim)$vfms1(ft,v,draw)  = 100*vfmsD(ft,v,draw,sim)       / vfms1(ft,v,draw) ;
zfmsPC(ft,draw,sim)$zfms1(ft,draw)      = 100*zfmsD(ft,draw,sim)         / zfms1(ft,draw) ;
vashPC(g,h,draw,sim)$vash1(g,h,draw)    = 100*vashD(g,h,draw,sim)        / vash1(g,h,draw) ;
trinPC(h,draw,sim)$trin1(h,draw)        = 100*trinD(h,draw,sim)          / trin1(h,draw) ;
troutPC(h,draw,sim)$trout1(h,draw)      = 100*troutD(h,draw,sim)         / trout1(h,draw) ;
savPC(h,draw,sim)$sav1(h,draw)          = 100*savD(h,draw,sim)           / sav1(h,draw) ;
exprocPC(h,draw,sim)$exproc1(h,draw)    = 100*exprocD(h,draw,sim)        / exproc1(h,draw) ;
hfsupPC(f,h,draw,sim)$hfsup1(f,h,draw)  = 100*hfsupD(f,h,draw,sim)       / hfsup1(f,h,draw) ;


*display pvD, pzD, phD, qvaD, fdD, idD, rD, wvD, wzD, qpD, tqpD, ttqpD, fixfacD, pvaD, exincD, endowD, yD, cpiD, vcpiD, ryD, tyD, tryD,
*        trinshD, qcD, eshareD, troutshD, hfsupD, hfdD, vfdD, zfdD, hmsD, vmsD, zmsD, hfmsD, vfmsD, zfmsD ,
*        vashD, trinD, troutD;
display_pars(D)
$exit

display pvPC, pzPC, phPC, qvaPC, fdPC, idPC, rPC, wvPC, wzPC, qpPC, tqpPC, ttqpPC, fixfacPC, pvaPC, exincPC, endowPC, yPC, cpiPC, vcpiPC, ryPC, tyPC, tryPC,
        trinshPC, qcPC, esharePC, troutshPC, hfsupPC, hfdPC, vfdPC, zfdPC, hmsPC, vmsPC, zmsPC, hfmsPC, vfmsPC, zfmsPC ,
        vashPC, trinPC, troutPC ;

* Welfare and efficiency
parameter cvh(h,draw)   compensating variation per household
          cvh_perc(h,draw) cv ac a percentage of initial income
          cv(draw)   compensating variation across all households
          cv_perc(draw) compensating variation as a percentage of income
          ymult(draw)   nominal income multiplier
          ymult_h(h,draw) nominal income muliplier on each hh that receive a transfer
          ytotmult_h(h,draw) nominal income muliplier divided by total transfer
          ymult_treat(draw) nominal income muliplier on all hh that received a transfer
          ymult_vil(v,draw) nominal income muliplier on a village
          ymult_all(draw) nominal income muliplier on hh A B C amd D

          rymult(draw)   real income multiplier
          rymult_h(h,draw) real income muliplier on each hh that receive a transfer
          rytotmult_h(h,draw) real income muliplier divided by total transfer
          rymult_treat(draw) real income muliplier on all hh that received a transfer
          rymult_vil(v,draw) real income muliplier on a village
          rymult_all(draw) real income muliplier on hh A B C amd D

          cvmult(draw)  cv multiplier
          prodmult_h(g,h,draw) production multiplier (value of extra g output per dollar of transfer to h)
          prodTotmult_h(g,h,draw) production multiplier (value of extra g output per dollar of total transfer)
          prodmult_treat(g,draw) production muliplier on all hh that received a transfer
          prodmult_ntreat(g,draw) production muliplier on all hh that received a transfer
          prodmult_vil(g,v,draw) production multiplier for the village
          prodmult_all(g,draw)     total production multiplier
          tprodmult_all(draw) total total production multiplier

          ttprodmult(draw)         total multiplier on ttqp
          hprodmult(h,draw)        total household production multiplier

          prodVmult_h(g,h,draw) production multiplier (value of extra g output per dollar of transfer)
          prodVmult_treat(g,draw) production muliplier on all hh that received a transfer
          prodVmult_ntreat(g,draw) production muliplier on all hh that received a transfer
          prodVmult_vil(g,v,draw) production multiplier for the village
          prodVmult_all(g,draw)     total production multiplier

          ykmult_h(h,draw) multiplier of the program + the capital influx
          rykmult_h(h,draw) multiplier of the program + the capital influx
          ykTotmult_h(h,draw) multiplier of the program + the capital influx
          rykTotmult_h(h,draw) multiplier of the program + the capital influx
          ykmult_all(draw) multiplier of the program + the capital influx
          rykmult_all(draw) multiplier of the program + the capital influx
          denom(h,draw) denominator for the multipliers (wfp spending)
;

* If the denominator is the total value of the wfp cost
*denom(h,draw) = infood(h) ;
*denom(h,draw) = wfpcost(h);
* with or without new remittances:
*denom(h,draw) = infood(h)+newremits ;
* If its the value net of the t-cost loss (when some of the infood is sold)
denom(h,draw) = transfer(h);
* If its the value net of the t-cost loss (when some of the infood is sold)
* with the new remittances counted as well...
*denom(h,draw) = transfer(h)+newremits(h);


cvh(h,draw) = y2(h,draw) - prod(g, (ph2(g,h,draw)/ph1(g,h,draw))**eshare_dr(g,h,draw))*y1(h,draw);
cvh_perc(h,draw) = 100*cvh(h,draw)/y1(h,draw);
cv(draw) = sum(h,cvh(h,draw));
cv_perc(draw) = cv(draw)/sum(h,y1(h,draw));
ymult(draw) = sum(h,yD(h,draw)) / sum(h,denom(h,draw)) ;
cvmult(draw) = cv(draw) / sum(h,denom(h,draw)) ;

ymult_h(h,draw)$transfer(h) = yD(h,draw) / denom(h,draw) ;
ytotmult_h(h,draw) = yD(h,draw) /sum(hh, denom(hh,draw)) ;
ymult_treat(draw)  = sum(h$transfer(h),yD(h,draw)) / sum(h, denom(h,draw)) ;
ymult_vil(v,draw)$sum(hh$maphv(hh,v),denom(hh,draw))  = sum(h$maphv(h,v),yD(h,draw)) / sum(hh$maphv(hh,v),denom(hh,draw))  ;
ymult_all(draw)$sum(h,denom(h,draw))  = sum(h,yD(h,draw)) / sum(h,denom(h,draw)) ;

rymult_h(h,draw)$transfer(h) = ryD(h,draw) / denom(h,draw) ;
rytotmult_h(h,draw) = ryD(h,draw) /sum(hh, denom(hh,draw)) ;
rymult_treat(draw)  = sum(h$transfer(h),ryD(h,draw)) / sum(h, denom(h,draw)) ;
rymult_vil(v,draw)$sum(hh$maphv(hh,v),denom(hh,draw))  = sum(h$maphv(h,v),ryD(h,draw)) / sum(hh$maphv(hh,v),denom(hh,draw))  ;
rymult_all(draw)$sum(h,denom(h,draw))  = sum(h,ryD(h,draw)) / sum(h,denom(h,draw)) ;

prodmult_h(g,h,draw)$transfer(h) = qpD(g,h,draw) / denom(h,draw) ;
prodTotmult_h(g,h,draw) = qpD(g,h,draw) / sum(hh,denom(hh,draw)) ;
prodmult_treat(g,draw)  = sum(h$denom(h,draw),qpD(g,h,draw)) / sum(h, denom(h,draw)) ;
prodmult_ntreat(g,draw)  = sum(h$(not denom(h,draw)),qpD(g,h,draw)) / sum(h, denom(h,draw)) ;
prodmult_vil(g,v,draw)$sum(hh$maphv(hh,v),denom(hh,draw))  = sum(h$maphv(h,v),qpD(g,h,draw)) / sum(hh$maphv(hh,v),denom(hh,draw))  ;
prodmult_all(g,draw)$sum(h,denom(h,draw))  = sum(h,qpD(g,h,draw)) / sum(h,denom(h,draw)) ;

tprodmult_all(draw)=sum(g,prodmult_all(g,draw));

ttprodmult(draw)$sum(h,denom(h,draw))  = ttqpD(draw) / sum(h,denom(h,draw)) ;
hprodmult(h,draw)$sum(hh,denom(hh,draw))  = hqpD(h,draw) / sum(hh,denom(hh,draw)) ;

prodVmult_h(g,h,draw)$denom(h,draw) = (ph2(g,h,draw)*qpD(g,h,draw)) / denom(h,draw) ;
prodVmult_treat(g,draw)  = sum(h$denom(h,draw),(ph2(g,h,draw)*qpD(g,h,draw))) / sum(h, denom(h,draw)) ;
prodVmult_ntreat(g,draw)  = sum(h$(not denom(h,draw)),(ph2(g,h,draw)*qpD(g,h,draw))) / sum(h, denom(h,draw)) ;
prodVmult_vil(g,v,draw)$sum(hh$maphv(hh,v),denom(hh,draw))  = sum(h$maphv(h,v),(ph2(g,h,draw)*qpD(g,h,draw))) / sum(hh$maphv(hh,v),denom(hh,draw))  ;
prodVmult_all(g,draw)$sum(h,denom(h,draw))  = sum(h,(ph2(g,h,draw)*qpD(g,h,draw))) / sum(h,denom(h,draw)) ;


display cvh, cvh_perc, cv, cv_perc, ymult, cvmult, ymult_h, ytotmult_h, ymult_treat, ymult_vil, ymult_all,
     rymult_h, rytotmult_h, rymult_treat, rymult_vil, rymult_all,
     prodmult_h, prodTotmult_h, prodmult_treat, prodmult_ntreat, prodmult_vil, prodmult_all, tprodmult_all
     prodVmult_h, prodVmult_treat, prodVmult_ntreat, prodVmult_vil, prodVmult_all ;

ykmult_all(draw)$(sum(h,denom(h,draw))+sum((h,g,f),fixfacD(g,f,h,draw))) = tyD(draw)
 / (sum(h,denom(h,draw))+sum((h,g,f),fixfacD(g,f,h,draw))) ;
rykmult_all(draw)$(sum(h,denom(h,draw))+sum((h,g,f),fixfacD(g,f,h,draw))) = tryD(draw)
 / (sum(h,denom(h,draw))+sum((h,g,f),fixfacD(g,f,h,draw))) ;
display ymult_all, rymult_all, ykmult_all, rykmult_all ;

ykmult_h(h,draw)$(denom(h,draw)+sum((g,f),fixfacD(g,f,h,draw))) = yD(h,draw)
 / (denom(h,draw)+sum((g,f),fixfacD(g,f,h,draw))) ;
rykmult_h(h,draw)$(denom(h,draw)+sum((g,f),fixfacD(g,f,h,draw))) = ryD(h,draw)
 / (denom(h,draw)+sum((g,f),fixfacD(g,f,h,draw))) ;
ykTotmult_h(hh,draw)$(sum(h,denom(h,draw))+sum((h,g,f),fixfacD(g,f,h,draw))) = yD(hh,draw)
 / (sum(h,denom(h,draw))+sum((h,g,f),fixfacD(g,f,h,draw))) ;
rykTotmult_h(hh,draw)$(sum(h,denom(h,draw))+sum((h,g,f),fixfacD(g,f,h,draw))) = ryD(hh,draw)
 /(sum(h,denom(h,draw))+sum((h,g,f),fixfacD(g,f,h,draw))) ;
display ymult_h, rymult_h, ykmult_h, rykmult_h, yktotmult_h, ryktotmult_h ;



*-----------------------------------------------------------------------
* Now output parameters with mean and variance
*-----------------------------------------------------------------------
set mv /mean, stdev, pct5, pct95/ ;

abort$(card(draw) le 1) "ONE REPETITION ONLY - NO MEANS OR STDEVS TO COMPUTE";

parameter
* mean and stdev of starting matrix
pv1_mv(g,v,mv)       mean and stdev of calibrated village price
pz1_mv(g,mv)         mean and stdev of calibrated zoi price
ph1_mv(g,h,mv)       mean and stdev of calibrated market price as seen by household

pva1_mv(g,h,mv)      mean and stdev of calibrated price of value added
qva1_mv(g,h,mv)      mean and stdev of calibrated quantity of value added
qp1_mv(g,h,mv)       mean and stdev of calibrated quantity produced
fd1_mv(g,f,h,mv)     mean and stdev of calibrated factor demand
id1_mv(g,gg,h,mv)    mean and stdev of calibrated intermediate demand
pshift1_mv(g,h,mv)    mean and stdev of calibrated cobb-douglas shifter
fshare1_mv(g,f,h,mv) mean and stdev of calibrated cobb-douglas shares
r1_mv(g,f,h,mv)      mean and stdev of calibrated rent for fixed factors
wv1_mv(f,v,mv)       mean and stdev of calibrated village-wide wage for tradable factors
wz1_mv(f,mv)         mean and stdev of calibrated zoi-wide wage for tradable factors
vash1_mv(g,h,mv)     mean and stdev of calibrated value-added share
idsh1_mv(gg,g,h,mv)  mean and stdev of calibrated intermediate demand share
tidsh1_mv(gg,h,mv)   mean and stdev of calibrated total intermediate input share (1_mv-vash)
fixfac1_mv(g,f,h,mv) mean and stdev of calibrated fixed factor demand
exinc1_mv(h,mv)      mean and stdev of calibrated exogenous income
endow1_mv(f,h,mv)    mean and stdev of calibrated endowment
qc1_mv(g,h,mv)       mean and stdev of calibrated level of consumption
eshare1_mv(g,h,mv)    mean and stdev of calibrated consumption shares
y1_mv(h,mv)          mean and stdev of calibrated nominal income of household
cpi1_mv(h,mv)        mean and stdev of calibrated cpi of household
cri1_mv(v,f,mv)        mean and stdev of calibrated cpi of village
vcpi1_mv(v,mv)        mean and stdev of calibrated cpi of village
ry1_mv(h,mv)         mean and stdev of calibrated real income of household
emin1_mv(g,h,mv)     mean and stdev of calibrated incompressible demand
trin1_mv(h,mv)       mean and stdev of calibrated transfers in - received
trout1_mv(h,mv)      mean and stdev of calibrated transfers out - given
sav1_mv(h,mv)        mean and stdev of calibrated savings
exproc1_mv(h,mv)     mean and stdev of calibrated expenditures rest of the world
trinsh1_mv(h,mv)     mean and stdev of calibrated share of all transfers in the eco going to h
troutsh1_mv(h,mv)    mean and stdev of calibrated share of yousehold h's income being given as transfers
hfd1_mv(f,h,mv)      mean and stdev of calibrated factor demand of household h for factor f
vfd1_mv(f,v,mv)      mean and stdev of calibrated village demand for factor f
zfd1_mv(f,mv)        mean and stdev of calibrated zoi demand for factor f
hms1_mv(g,h,mv)      mean and stdev of calibrated household marketed surplus of good g
vms1_mv(g,v,mv)      mean and stdev of calibrated village marketed surplus of good g
zms1_mv(g,mv)        mean and stdev of calibrated household marketed surplus of good g
hfms1_mv(f,h,mv)     mean and stdev of calibrated household factor marketed surplus
vfms1_mv(f,v,mv)     mean and stdev of calibrated village factor marketed surplus
zfms1_mv(f,mv)       mean and stdev of calibrated zoi factor marketed surplus
;



pv1_mv(g,v,"mean") = sum(draw, pv1(g,v,draw)) / card(draw) ;
pv1_mv(g,v,"stdev") = sqrt(sum(draw, sqr(pv1(g,v,draw) - pv1_mv(g,v,"mean")))/(card(draw)-1)) ;
pz1_mv(g,"mean") = sum(draw, pz1(g,draw)) / card(draw) ;
pz1_mv(g,"stdev") = sqrt(sum(draw, sqr(pz1(g,draw) - pz1_mv(g,"mean")))/(card(draw)-1)) ;
ph1_mv(g,h,"mean") = sum(draw, ph1(g,h,draw)) / card(draw) ;
ph1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(ph1(g,h,draw) - ph1_mv(g,h,"mean")))/(card(draw)-1)) ;

pva1_mv(g,h,"mean") = sum(draw, pva1(g,h,draw)) / card(draw) ;
pva1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(pva1(g,h,draw) - pva1_mv(g,h,"mean")))/(card(draw)-1)) ;
qva1_mv(g,h,"mean") = sum(draw, qva1(g,h,draw)) / card(draw) ;
qva1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qva1(g,h,draw) - qva1_mv(g,h,"mean")))/(card(draw)-1)) ;
qp1_mv(g,h,"mean") = sum(draw, qp1(g,h,draw)) / card(draw) ;
qp1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qp1(g,h,draw) - qp1_mv(g,h,"mean")))/(card(draw)-1)) ;
fd1_mv(g,f,h,"mean") = sum(draw, fd1(g,f,h,draw)) / card(draw) ;
fd1_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fd1(g,f,h,draw) - fd1_mv(g,f,h,"mean")))/(card(draw)-1)) ;
id1_mv(g,gg,h,"mean") = sum(draw, id1(g,gg,h,draw)) / card(draw) ;
id1_mv(g,gg,h,"stdev") = sqrt(sum(draw, sqr(id1(g,gg,h,draw) - id1_mv(g,gg,h,"mean")))/(card(draw)-1)) ;
pshift1_mv(g,h,"mean") = sum(draw, pshift1(g,h,draw)) / card(draw) ;
pshift1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(pshift1(g,h,draw) - pshift1_mv(g,h,"mean")))/(card(draw)-1)) ;
fshare1_mv(g,f,h,"mean") = sum(draw, fshare1(g,f,h,draw)) / card(draw) ;
fshare1_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fshare1(g,f,h,draw) - fshare1_mv(g,f,h,"mean")))/(card(draw)-1)) ;
r1_mv(g,f,h,"mean") = sum(draw, r1(g,f,h,draw)) / card(draw) ;
r1_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(r1(g,f,h,draw) - r1_mv(g,f,h,"mean")))/(card(draw)-1)) ;
wv1_mv(f,v,"mean") = sum(draw, wv1(f,v,draw)) / card(draw) ;
wv1_mv(f,v,"stdev") = sqrt(sum(draw, sqr(wv1(f,v,draw) - wv1_mv(f,v,"mean")))/(card(draw)-1)) ;
wz1_mv(f,"mean") = sum(draw, wz1(f,draw)) / card(draw) ;
wz1_mv(f,"stdev") = sqrt(sum(draw, sqr(wz1(f,draw) - wz1_mv(f,"mean")))/(card(draw)-1)) ;
vash1_mv(g,h,"mean") = sum(draw, vash1(g,h,draw)) / card(draw) ;
vash1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(vash1(g,h,draw) - vash1_mv(g,h,"mean")))/(card(draw)-1)) ;
qp1_mv(g,h,"mean") = sum(draw, qp1(g,h,draw)) / card(draw) ;
qp1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qp1(g,h,draw) - qp1_mv(g,h,"mean")))/(card(draw)-1)) ;
idsh1_mv(g,gg,h,"mean") = sum(draw, idsh1(g,gg,h,draw)) / card(draw) ;
idsh1_mv(g,gg,h,"stdev") = sqrt(sum(draw, sqr(idsh1(g,gg,h,draw) - idsh1_mv(g,gg,h,"mean")))/(card(draw)-1)) ;
tidsh1_mv(g,h,"mean") = sum(draw, tidsh1(g,h,draw)) / card(draw) ;
tidsh1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(tidsh1(g,h,draw) - tidsh1_mv(g,h,"mean")))/(card(draw)-1)) ;
fixfac1_mv(g,f,h,"mean") = sum(draw, fixfac1(g,f,h,draw)) / card(draw) ;
fixfac1_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fixfac1(g,f,h,draw) - fixfac1_mv(g,f,h,"mean")))/(card(draw)-1)) ;
exinc1_mv(h,"mean") = sum(draw, exinc1(h,draw)) / card(draw) ;
exinc1_mv(h,"stdev") = sqrt(sum(draw, sqr(exinc1(h,draw) - exinc1_mv(h,"mean")))/(card(draw)-1)) ;
endow1_mv(f,h,"mean") = sum(draw, endow1(f,h,draw)) / card(draw) ;
endow1_mv(f,h,"stdev") = sqrt(sum(draw, sqr(endow1(f,h,draw) - endow1_mv(f,h,"mean")))/(card(draw)-1)) ;
qc1_mv(g,h,"mean") = sum(draw, qc1(g,h,draw)) / card(draw) ;
qc1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qc1(g,h,draw) - qc1_mv(g,h,"mean")))/(card(draw)-1)) ;
eshare1_mv(g,h,"mean") = sum(draw, eshare1(g,h,draw)) / card(draw) ;
eshare1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(eshare1(g,h,draw) - eshare1_mv(g,h,"mean")))/(card(draw)-1)) ;
y1_mv(h,"mean") = sum(draw, y1(h,draw)) / card(draw) ;
y1_mv(h,"stdev") = sqrt(sum(draw, sqr(y1(h,draw) - y1_mv(h,"mean")))/(card(draw)-1)) ;
cpi1_mv(h,"mean") = sum(draw, cpi1(h,draw)) / card(draw) ;
cpi1_mv(h,"stdev") = sqrt(sum(draw, sqr(cpi1(h,draw) - cpi1_mv(h,"mean")))/(card(draw)-1)) ;
vcpi1_mv(v,"mean") = sum(draw, vcpi1(v,draw)) / card(draw) ;
vcpi1_mv(v,"stdev") = sqrt(sum(draw, sqr(vcpi1(v,draw) - vcpi1_mv(v,"mean")))/(card(draw)-1)) ;
cri1_mv(v,f,"mean") = sum(draw, cri1(v,f,draw)) / card(draw) ;
cri1_mv(v,f,"stdev") = sqrt(sum(draw, sqr(cri1(v,f,draw) - cri1_mv(v,f,"mean")))/(card(draw)-1)) ;


ry1_mv(h,"mean") = sum(draw, ry1(h,draw)) / card(draw) ;
ry1_mv(h,"stdev") = sqrt(sum(draw, sqr(ry1(h,draw) - ry1_mv(h,"mean")))/(card(draw)-1)) ;

emin1_mv(g,h,"mean") = sum(draw, emin1(g,h,draw)) / card(draw) ;
emin1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(emin1(g,h,draw) - emin1_mv(g,h,"mean")))/(card(draw)-1)) ;
trin1_mv(h,"mean") = sum(draw, trin1(h,draw)) / card(draw) ;
trin1_mv(h,"stdev") = sqrt(sum(draw, sqr(trin1(h,draw) - trin1_mv(h,"mean")))/(card(draw)-1)) ;
trout1_mv(h,"mean") = sum(draw, trout1(h,draw)) / card(draw) ;
trout1_mv(h,"stdev") = sqrt(sum(draw, sqr(trout1(h,draw) - trout1_mv(h,"mean")))/(card(draw)-1)) ;
sav1_mv(h,"mean") = sum(draw, sav1(h,draw)) / card(draw) ;
sav1_mv(h,"stdev") = sqrt(sum(draw, sqr(sav1(h,draw) - sav1_mv(h,"mean")))/(card(draw)-1)) ;
exproc1_mv(h,"mean") = sum(draw, exproc1(h,draw)) / card(draw) ;
exproc1_mv(h,"stdev") = sqrt(sum(draw, sqr(exproc1(h,draw) - exproc1_mv(h,"mean")))/(card(draw)-1)) ;


trinsh1_mv(h,"mean") = sum(draw, trinsh1(h,draw)) / card(draw) ;
trinsh1_mv(h,"stdev") = sqrt(sum(draw, sqr(trinsh1(h,draw) - trinsh1_mv(h,"mean")))/(card(draw)-1)) ;
troutsh1_mv(h,"mean") = sum(draw, troutsh1(h,draw)) / card(draw) ;
troutsh1_mv(h,"stdev") = sqrt(sum(draw, sqr(troutsh1(h,draw) - troutsh1_mv(h,"mean")))/(card(draw)-1)) ;
hfd1_mv(f,h,"mean") = sum(draw, hfd1(f,h,draw)) / card(draw) ;
hfd1_mv(f,h,"stdev") = sqrt(sum(draw, sqr(hfd1(f,h,draw) - hfd1_mv(f,h,"mean")))/(card(draw)-1)) ;
vfd1_mv(f,v,"mean") = sum(draw, vfd1(f,v,draw)) / card(draw) ;
vfd1_mv(f,v,"stdev") = sqrt(sum(draw, sqr(vfd1(f,v,draw) - vfd1_mv(f,v,"mean")))/(card(draw)-1)) ;
zfd1_mv(f,"mean") = sum(draw, zfd1(f,draw)) / card(draw) ;
zfd1_mv(f,"stdev") = sqrt(sum(draw, sqr(zfd1(f,draw) - zfd1_mv(f,"mean")))/(card(draw)-1)) ;
hms1_mv(g,h,"mean") = sum(draw, hms1(g,h,draw)) / card(draw) ;
hms1_mv(g,h,"stdev") = sqrt(sum(draw, sqr(hms1(g,h,draw) - hms1_mv(g,h,"mean")))/(card(draw)-1)) ;
vms1_mv(g,v,"mean") = sum(draw, vms1(g,v,draw)) / card(draw) ;
vms1_mv(g,v,"stdev") = sqrt(sum(draw, sqr(vms1(g,v,draw) - vms1_mv(g,v,"mean")))/(card(draw)-1)) ;
zms1_mv(g,"mean") = sum(draw, zms1(g,draw)) / card(draw) ;
zms1_mv(g,"stdev") = sqrt(sum(draw, sqr(zms1(g,draw) - zms1_mv(g,"mean")))/(card(draw)-1)) ;
hfms1_mv(f,h,"mean") = sum(draw, hfms1(f,h,draw)) / card(draw) ;
hfms1_mv(f,h,"stdev") = sqrt(sum(draw, sqr(hfms1(f,h,draw) - hfms1_mv(f,h,"mean")))/(card(draw)-1)) ;
vfms1_mv(f,v,"mean") = sum(draw, vfms1(f,v,draw)) / card(draw) ;
vfms1_mv(f,v,"stdev") = sqrt(sum(draw, sqr(vfms1(f,v,draw) - vfms1_mv(f,v,"mean")))/(card(draw)-1)) ;
zfms1_mv(f,"mean") = sum(draw, zfms1(f,draw)) / card(draw) ;
zfms1_mv(f,"stdev") = sqrt(sum(draw, sqr(zfms1(f,draw) - zfms1_mv(f,"mean")))/(card(draw)-1)) ;

display pv1_mv, pz1_mv, ph1_mv, pva1_mv, qva1_mv, qp1_mv, fd1_mv, id1_mv, pshift1_mv, fshare1_mv, r1_mv, wv1_mv, wz1_mv, vash1_mv, idsh1_mv,
        tidsh1_mv, fixfac1_mv, exinc1_mv, endow1_mv, qc1_mv, eshare1_mv, y1_mv, cpi1_mv, vcpi1_mv,  ry1_mv, emin1_mv, trin1_mv, trout1_mv, trinsh1_mv,
        troutsh1_mv, hfd1_mv, vfd1_mv, zfd1_mv, hms1_mv, vms1_mv, zms1_mv, hfms1_mv, vfms1_mv, zfms1_mv ;

parameter
* mean and stdev of starting matrix
pv2_mv(g,v,mv)       mean and stdev of simulated village price
pz2_mv(g,mv)         mean and stdev of simulated zoi price
ph2_mv(g,h,mv)       mean and stdev of simulated market price  as seen by household

pva2_mv(g,h,mv)      mean and stdev of simulated price of value added
qva2_mv(g,h,mv)      mean and stdev of simulated quantity of value added
qp2_mv(g,h,mv)       mean and stdev of simulated quantity produced
fd2_mv(g,f,h,mv)     mean and stdev of simulated factor demand
id2_mv(g,gg,h,mv)    mean and stdev of simulated intermediate demand
pshift2_mv(g,h,mv)    mean and stdev of simulated cobb-douglas shifter
fshare2_mv(g,f,h,mv) mean and stdev of simulated cobb-douglas shares
r2_mv(g,f,h,mv)      mean and stdev of simulated rent for fixed factors
wv2_mv(f,v,mv)       mean and stdev of simulated village-wide wage for tradable factors
wz2_mv(f,mv)         mean and stdev of simulated zoi-wide wage for tradable factors
vash2_mv(g,h,mv)     mean and stdev of simulated value-added share
idsh2_mv(gg,g,h,mv)  mean and stdev of simulated intermediate demand share
tidsh2_mv(gg,h,mv)   mean and stdev of simulated total intermediate input share (2_mv-vash)
fixfac2_mv(g,f,h,mv) mean and stdev of simulated fixed factor demand
exinc2_mv(h,mv)      mean and stdev of simulated exogenous income
endow2_mv(f,h,mv)    mean and stdev of simulated endowment
qc2_mv(g,h,mv)       mean and stdev of simulated level of consumption
eshare2_mv(g,h,mv)    mean and stdev of simulated consumption shares
y2_mv(h,mv)          mean and stdev of simulated income of household
cpi2_mv(h,mv)        mean and stdev of simulated cpi of household
vcpi2_mv(v,mv)       mean and stdev of calibrated cpi of village
cri2_mv(v,f,mv)        mean and stdev of calibrated cpi of village
ry2_mv(h,mv)         mean and stdev of simulated real income of household
emin2_mv(g,h,mv)     mean and stdev of simulated incompressible demand
trin2_mv(h,mv)       mean and stdev of simulated transfers in - received
trout2_mv(h,mv)      mean and stdev of simulated transfers out - given
sav2_mv(h,mv)        mean and stdev of simulated savings
exproc2_mv(h,mv)     mean and stdev of simulated expenditures rest of the world

trinsh2_mv(h,mv)     mean and stdev of simulated share of all transfers in the eco going to h
troutsh2_mv(h,mv)    mean and stdev of simulated share of yousehold h's income being given as transfers
hfd2_mv(f,h,mv)      mean and stdev of simulated factor demand of household h for factor f
vfd2_mv(f,v,mv)      mean and stdev of simulated village demand for factor f
zfd2_mv(f,mv)        mean and stdev of simulated zoi demand for factor f
hms2_mv(g,h,mv)      mean and stdev of simulated household marketed surplus of good g
vms2_mv(g,v,mv)      mean and stdev of simulated village marketed surplus of good g
zms2_mv(g,mv)        mean and stdev of simulated household marketed surplus of good g
hfms2_mv(f,h,mv)     mean and stdev of simulated household factor marketed surplus
vfms2_mv(f,v,mv)     mean and stdev of simulated village factor marketed surplus
zfms2_mv(f,mv)       mean and stdev of simulated zoi factor marketed surplus
;


pv2_mv(g,v,"mean") = sum(draw, pv2(g,v,draw)) / card(draw) ;
pv2_mv(g,v,"stdev") = sqrt(sum(draw, sqr(pv2(g,v,draw) - pv2_mv(g,v,"mean")))/(card(draw)-1)) ;
pz2_mv(g,"mean") = sum(draw, pz2(g,draw)) / card(draw) ;
pz2_mv(g,"stdev") = sqrt(sum(draw, sqr(pz2(g,draw) - pz2_mv(g,"mean")))/(card(draw)-1)) ;
ph2_mv(g,h,"mean") = sum(draw, ph2(g,h,draw)) / card(draw) ;
ph2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(ph2(g,h,draw) - ph2_mv(g,h,"mean")))/(card(draw)-1)) ;

pva2_mv(g,h,"mean") = sum(draw, pva2(g,h,draw)) / card(draw) ;
pva2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(pva2(g,h,draw) - pva2_mv(g,h,"mean")))/(card(draw)-1)) ;
qva2_mv(g,h,"mean") = sum(draw, qva2(g,h,draw)) / card(draw) ;
qva2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qva2(g,h,draw) - qva2_mv(g,h,"mean")))/(card(draw)-1)) ;
qp2_mv(g,h,"mean") = sum(draw, qp2(g,h,draw)) / card(draw) ;
qp2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qp2(g,h,draw) - qp2_mv(g,h,"mean")))/(card(draw)-1)) ;
fd2_mv(g,f,h,"mean") = sum(draw, fd2(g,f,h,draw)) / card(draw) ;
fd2_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fd2(g,f,h,draw) - fd2_mv(g,f,h,"mean")))/(card(draw)-1)) ;
id2_mv(g,gg,h,"mean") = sum(draw, id2(g,gg,h,draw)) / card(draw) ;
id2_mv(g,gg,h,"stdev") = sqrt(sum(draw, sqr(id2(g,gg,h,draw) - id2_mv(g,gg,h,"mean")))/(card(draw)-1)) ;
pshift2_mv(g,h,"mean") = sum(draw, pshift2(g,h,draw)) / card(draw) ;
pshift2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(pshift2(g,h,draw) - pshift2_mv(g,h,"mean")))/(card(draw)-1)) ;
fshare2_mv(g,f,h,"mean") = sum(draw, fshare2(g,f,h,draw)) / card(draw) ;
fshare2_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fshare2(g,f,h,draw) - fshare2_mv(g,f,h,"mean")))/(card(draw)-1)) ;
r2_mv(g,f,h,"mean") = sum(draw, r2(g,f,h,draw)) / card(draw) ;
r2_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(r2(g,f,h,draw) - r2_mv(g,f,h,"mean")))/(card(draw)-1)) ;
wv2_mv(f,v,"mean") = sum(draw, wv2(f,v,draw)) / card(draw) ;
wv2_mv(f,v,"stdev") = sqrt(sum(draw, sqr(wv2(f,v,draw) - wv2_mv(f,v,"mean")))/(card(draw)-1)) ;
wz2_mv(f,"mean") = sum(draw, wz2(f,draw)) / card(draw) ;
wz2_mv(f,"stdev") = sqrt(sum(draw, sqr(wz2(f,draw) - wz2_mv(f,"mean")))/(card(draw)-1)) ;
vash2_mv(g,h,"mean") = sum(draw, vash2(g,h,draw)) / card(draw) ;
vash2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(vash2(g,h,draw) - vash2_mv(g,h,"mean")))/(card(draw)-1)) ;
qp2_mv(g,h,"mean") = sum(draw, qp2(g,h,draw)) / card(draw) ;
qp2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qp2(g,h,draw) - qp2_mv(g,h,"mean")))/(card(draw)-1)) ;
*idsh2_mv(g,gg,h,"mean") = sum(draw, idsh2(g,gg,h,draw)) / card(draw) ;
*idsh2_mv(g,gg,h,"stdev") = sqrt(sum(draw, sqr(idsh2(g,gg,h,draw) - idsh2_mv(g,gg,h,"mean")))/(card(draw)-1)) ;
*tidsh2_mv(g,h,"mean") = sum(draw, tidsh2(g,h,draw)) / card(draw) ;
*tidsh2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(tidsh2(g,h,draw) - tidsh2_mv(g,h,"mean")))/(card(draw)-1)) ;
fixfac2_mv(g,f,h,"mean") = sum(draw, fixfac2(g,f,h,draw)) / card(draw) ;
fixfac2_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fixfac2(g,f,h,draw) - fixfac2_mv(g,f,h,"mean")))/(card(draw)-1)) ;
exinc2_mv(h,"mean") = sum(draw, exinc2(h,draw)) / card(draw) ;
exinc2_mv(h,"stdev") = sqrt(sum(draw, sqr(exinc2(h,draw) - exinc2_mv(h,"mean")))/(card(draw)-1)) ;
endow2_mv(f,h,"mean") = sum(draw, endow2(f,h,draw)) / card(draw) ;
endow2_mv(f,h,"stdev") = sqrt(sum(draw, sqr(endow2(f,h,draw) - endow2_mv(f,h,"mean")))/(card(draw)-1)) ;
qc2_mv(g,h,"mean") = sum(draw, qc2(g,h,draw)) / card(draw) ;
qc2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qc2(g,h,draw) - qc2_mv(g,h,"mean")))/(card(draw)-1)) ;
eshare2_mv(g,h,"mean") = sum(draw, eshare2(g,h,draw)) / card(draw) ;
eshare2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(eshare2(g,h,draw) - eshare2_mv(g,h,"mean")))/(card(draw)-1)) ;
y2_mv(h,"mean") = sum(draw, y2(h,draw)) / card(draw) ;
y2_mv(h,"stdev") = sqrt(sum(draw, sqr(y2(h,draw) - y2_mv(h,"mean")))/(card(draw)-1)) ;

cpi2_mv(h,"mean") = sum(draw, cpi2(h,draw)) / card(draw) ;
cpi2_mv(h,"stdev") = sqrt(sum(draw, sqr(cpi2(h,draw) - cpi2_mv(h,"mean")))/(card(draw)-1)) ;
vcpi2_mv(v,"mean") = sum(draw, vcpi2(v,draw)) / card(draw) ;
vcpi2_mv(v,"stdev") = sqrt(sum(draw, sqr(vcpi2(v,draw) - vcpi2_mv(v,"mean")))/(card(draw)-1)) ;
cri2_mv(v,f,"mean") = sum(draw, cri2(v,f,draw)) / card(draw) ;
cri2_mv(v,f,"stdev") = sqrt(sum(draw, sqr(cri2(v,f,draw) - cri2_mv(v,f,"mean")))/(card(draw)-1)) ;


ry2_mv(h,"mean") = sum(draw, ry2(h,draw)) / card(draw) ;
ry2_mv(h,"stdev") = sqrt(sum(draw, sqr(ry2(h,draw) - ry2_mv(h,"mean")))/(card(draw)-1)) ;
*emin2_mv(g,h,"mean") = sum(draw, emin2(g,h,draw)) / card(draw) ;
*emin2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(emin2(g,h,draw) - emin2_mv(g,h,"mean")))/(card(draw)-1)) ;
trin2_mv(h,"mean") = sum(draw, trin2(h,draw)) / card(draw) ;
trin2_mv(h,"stdev") = sqrt(sum(draw, sqr(trin2(h,draw) - trin2_mv(h,"mean")))/(card(draw)-1)) ;
trout2_mv(h,"mean") = sum(draw, trout2(h,draw)) / card(draw) ;
trout2_mv(h,"stdev") = sqrt(sum(draw, sqr(trout2(h,draw) - trout2_mv(h,"mean")))/(card(draw)-1)) ;
sav2_mv(h,"mean") = sum(draw, sav2(h,draw)) / card(draw) ;
sav2_mv(h,"stdev") = sqrt(sum(draw, sqr(sav2(h,draw) - sav2_mv(h,"mean")))/(card(draw)-1)) ;
exproc2_mv(h,"mean") = sum(draw, exproc2(h,draw)) / card(draw) ;
exproc2_mv(h,"stdev") = sqrt(sum(draw, sqr(exproc2(h,draw) - exproc2_mv(h,"mean")))/(card(draw)-1)) ;

trinsh2_mv(h,"mean") = sum(draw, trinsh2(h,draw)) / card(draw) ;
trinsh2_mv(h,"stdev") = sqrt(sum(draw, sqr(trinsh2(h,draw) - trinsh2_mv(h,"mean")))/(card(draw)-1)) ;
troutsh2_mv(h,"mean") = sum(draw, troutsh2(h,draw)) / card(draw) ;
troutsh2_mv(h,"stdev") = sqrt(sum(draw, sqr(troutsh2(h,draw) - troutsh2_mv(h,"mean")))/(card(draw)-1)) ;
hfd2_mv(f,h,"mean") = sum(draw, hfd2(f,h,draw)) / card(draw) ;
hfd2_mv(f,h,"stdev") = sqrt(sum(draw, sqr(hfd2(f,h,draw) - hfd2_mv(f,h,"mean")))/(card(draw)-1)) ;
vfd2_mv(f,v,"mean") = sum(draw, vfd2(f,v,draw)) / card(draw) ;
vfd2_mv(f,v,"stdev") = sqrt(sum(draw, sqr(vfd2(f,v,draw) - vfd2_mv(f,v,"mean")))/(card(draw)-1)) ;
zfd2_mv(f,"mean") = sum(draw, zfd2(f,draw)) / card(draw) ;
zfd2_mv(f,"stdev") = sqrt(sum(draw, sqr(zfd2(f,draw) - zfd2_mv(f,"mean")))/(card(draw)-1)) ;
hms2_mv(g,h,"mean") = sum(draw, hms2(g,h,draw)) / card(draw) ;
hms2_mv(g,h,"stdev") = sqrt(sum(draw, sqr(hms2(g,h,draw) - hms2_mv(g,h,"mean")))/(card(draw)-1)) ;
vms2_mv(g,v,"mean") = sum(draw, vms2(g,v,draw)) / card(draw) ;
vms2_mv(g,v,"stdev") = sqrt(sum(draw, sqr(vms2(g,v,draw) - vms2_mv(g,v,"mean")))/(card(draw)-1)) ;
zms2_mv(g,"mean") = sum(draw, zms2(g,draw)) / card(draw) ;
zms2_mv(g,"stdev") = sqrt(sum(draw, sqr(zms2(g,draw) - zms2_mv(g,"mean")))/(card(draw)-1)) ;
hfms2_mv(f,h,"mean") = sum(draw, hfms2(f,h,draw)) / card(draw) ;
hfms2_mv(f,h,"stdev") = sqrt(sum(draw, sqr(hfms2(f,h,draw) - hfms2_mv(f,h,"mean")))/(card(draw)-1)) ;
vfms2_mv(f,v,"mean") = sum(draw, vfms2(f,v,draw)) / card(draw) ;
vfms2_mv(f,v,"stdev") = sqrt(sum(draw, sqr(vfms2(f,v,draw) - vfms2_mv(f,v,"mean")))/(card(draw)-1)) ;
zfms2_mv(f,"mean") = sum(draw, zfms2(f,draw)) / card(draw) ;
zfms2_mv(f,"stdev") = sqrt(sum(draw, sqr(zfms2(f,draw) - zfms2_mv(f,"mean")))/(card(draw)-1)) ;

display pv2_mv, pz2_mv, ph2_mv, pva2_mv, qva2_mv, qp2_mv, fd2_mv, id2_mv, r2_mv, wv2_mv, wz2_mv, vash2_mv, fixfac2_mv,
        exinc2_mv, endow2_mv, qc2_mv, eshare2_mv, y2_mv, cpi2_mv, vcpi2_mv,  ry2_mv,  trin2_mv, trout2_mv, trinsh2_mv,
        troutsh2_mv, hfd2_mv, vfd2_mv, zfd2_mv, hms2_mv, vms2_mv, zms2_mv, hfms2_mv, vfms2_mv, zfms2_mv
, pshift2_mv, fshare2_mv ;
*, idsh2_mv, tidsh2_mv, emin2_mv,

parameter
* mean and stdev of starting matrix
pvD_mv(g,v,mv)       mean and stdev of delta village price
pzD_mv(g,mv)         mean and stdev of delta zoi price
phD_mv(g,h,mv)       mean and stdev of delta market price  as seen by household

pvaD_mv(g,h,mv)      mean and stdev of delta price of value added
qvaD_mv(g,h,mv)      mean and stdev of delta quantity of value added
qpD_mv(g,h,mv)       mean and stdev of delta quantity produced
tqpD_mv(g,mv)        mean and stdev of delta total QP
ttqpD_mv(mv)
fdD_mv(g,f,h,mv)     mean and stdev of delta factor demand
idD_mv(g,gg,h,mv)    mean and stdev of delta intermediate demand
pshiftD_mv(g,h,mv)    mean and stdev of delta cobb-douglas shifter
fshareD_mv(g,f,h,mv) mean and stdev of delta cobb-douglas shares
rD_mv(g,f,h,mv)      mean and stdev of delta rent for fixed factors
wvD_mv(f,v,mv)       mean and stdev of delta village-wide wage for tradable factors
wzD_mv(f,mv)         mean and stdev of delta zoi-wide wage for tradable factors
vashD_mv(g,h,mv)     mean and stdev of delta value-added share
idshD_mv(gg,g,h,mv)  mean and stdev of delta intermediate demand share
tidshD_mv(gg,h,mv)   mean and stdev of delta total intermediate input share (D_mv-vash)
fixfacD_mv(g,f,h,mv) mean and stdev of delta fixed factor demand
exincD_mv(h,mv)      mean and stdev of delta exogenous income
endowD_mv(f,h,mv)    mean and stdev of delta endowment
qcD_mv(g,h,mv)       mean and stdev of delta level of consumption
eshareD_mv(g,h,mv)    mean and stdev of delta consumption shares
yD_mv(h,mv)          mean and stdev of delta income of household
cpiD_mv(h,mv)        mean and stdev of delta cpi of household
vcpiD_mv(v,mv)       mean and stdev of delta cpi of village
criD_mv(v,f,mv)       mean and stdev of delta cri of village
ryD_mv(h,mv)         mean and stdev of delta real income of household
tyD_mv(mv)           mean and stdev of delta total nominal income
tryD_mv(mv)          mean and stdev of delta total real income
eminD_mv(g,h,mv)     mean and stdev of delta incompressible demand
trinD_mv(h,mv)       mean and stdev of delta transfers in - received
troutD_mv(h,mv)      mean and stdev of delta transfers out - given
savD_mv(h,mv)        mean and stdev of delta savings
exprocD_mv(h,mv)     mean and stdev of delta expenditures rest of the world

trinshD_mv(h,mv)     mean and stdev of delta share of all transfers in the eco going to h
troutshD_mv(h,mv)    mean and stdev of delta share of yousehold h's income being given as transfers
hfdD_mv(f,h,mv)      mean and stdev of delta factor demand of household h for factor f
vfdD_mv(f,v,mv)      mean and stdev of delta village demand for factor f
zfdD_mv(f,mv)        mean and stdev of delta zoi demand for factor f
hmsD_mv(g,h,mv)      mean and stdev of delta household marketed surplus of good g
vmsD_mv(g,v,mv)      mean and stdev of delta village marketed surplus of good g
zmsD_mv(g,mv)        mean and stdev of delta household marketed surplus of good g
hfmsD_mv(f,h,mv)     mean and stdev of delta household factor marketed surplus
vfmsD_mv(f,v,mv)     mean and stdev of delta village factor marketed surplus
zfmsD_mv(f,mv)       mean and stdev of delta zoi factor marketed surplus

hqpD_mv(h,mv)
;


pvD_mv(g,v,"mean") = sum(draw, pvD(g,v,draw)) / card(draw) ;
pvD_mv(g,v,"stdev") = sqrt(sum(draw, sqr(pvD(g,v,draw) - pvD_mv(g,v,"mean")))/(card(draw)-1)) ;
pzD_mv(g,"mean") = sum(draw, pzD(g,draw)) / card(draw) ;
pzD_mv(g,"stdev") = sqrt(sum(draw, sqr(pzD(g,draw) - pzD_mv(g,"mean")))/(card(draw)-1)) ;
phD_mv(g,h,"mean") = sum(draw, phD(g,h,draw)) / card(draw) ;
phD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(phD(g,h,draw) - phD_mv(g,h,"mean")))/(card(draw)-1)) ;

pvaD_mv(g,h,"mean") = sum(draw, pvaD(g,h,draw)) / card(draw) ;
pvaD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(pvaD(g,h,draw) - pvaD_mv(g,h,"mean")))/(card(draw)-1)) ;
qvaD_mv(g,h,"mean") = sum(draw, qvaD(g,h,draw)) / card(draw) ;
qvaD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qvaD(g,h,draw) - qvaD_mv(g,h,"mean")))/(card(draw)-1)) ;
qpD_mv(g,h,"mean") = sum(draw, qpD(g,h,draw)) / card(draw) ;
qpD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qpD(g,h,draw) - qpD_mv(g,h,"mean")))/(card(draw)-1)) ;
tqpD_mv(g,"mean") = sum(draw, tqpD(g,draw)) / card(draw) ;
ttqpD_mv("mean") = sum(draw, ttqpD(draw)) / card(draw) ;
tqpD_mv(g,"stdev") = sqrt(sum(draw, sqr(tqpD(g,draw) - tqpD_mv(g,"mean")))/(card(draw)-1)) ;
ttqpD_mv("stdev") = sqrt(sum(draw, sqr(ttqpD(draw) - ttqpD_mv("mean")))/(card(draw)-1)) ;

hqpD_mv(h,"mean") = sum(draw, hqpD(h,draw)) / card(draw) ;
hqpD_mv(h,"stdev") = sqrt(sum(draw, sqr(hqpD(h,draw) - hqpD_mv(h,"mean")))/(card(draw)-1)) ;


fdD_mv(g,f,h,"mean") = sum(draw, fdD(g,f,h,draw)) / card(draw) ;
fdD_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fdD(g,f,h,draw) - fdD_mv(g,f,h,"mean")))/(card(draw)-1)) ;
idD_mv(g,gg,h,"mean") = sum(draw, idD(g,gg,h,draw)) / card(draw) ;
idD_mv(g,gg,h,"stdev") = sqrt(sum(draw, sqr(idD(g,gg,h,draw) - idD_mv(g,gg,h,"mean")))/(card(draw)-1)) ;
pshiftD_mv(g,h,"mean") = sum(draw, pshiftD(g,h,draw)) / card(draw) ;
pshiftD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(pshiftD(g,h,draw) - pshiftD_mv(g,h,"mean")))/(card(draw)-1)) ;
fshareD_mv(g,f,h,"mean") = sum(draw, fshareD(g,f,h,draw)) / card(draw) ;
fshareD_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fshareD(g,f,h,draw) - fshareD_mv(g,f,h,"mean")))/(card(draw)-1)) ;
rD_mv(g,f,h,"mean") = sum(draw, rD(g,f,h,draw)) / card(draw) ;
rD_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(rD(g,f,h,draw) - rD_mv(g,f,h,"mean")))/(card(draw)-1)) ;
wvD_mv(f,v,"mean") = sum(draw, wvD(f,v,draw)) / card(draw) ;
wvD_mv(f,v,"stdev") = sqrt(sum(draw, sqr(wvD(f,v,draw) - wvD_mv(f,v,"mean")))/(card(draw)-1)) ;
wzD_mv(f,"mean") = sum(draw, wzD(f,draw)) / card(draw) ;
wzD_mv(f,"stdev") = sqrt(sum(draw, sqr(wzD(f,draw) - wzD_mv(f,"mean")))/(card(draw)-1)) ;
vashD_mv(g,h,"mean") = sum(draw, vashD(g,h,draw)) / card(draw) ;
vashD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(vashD(g,h,draw) - vashD_mv(g,h,"mean")))/(card(draw)-1)) ;
*idshD_mv(g,gg,h,"mean") = sum(draw, idshD(g,gg,h,draw)) / card(draw) ;
*idshD_mv(g,gg,h,"stdev") = sqrt(sum(draw, sqr(idshD(g,gg,h,draw) - idshD_mv(g,gg,h,"mean")))/(card(draw)-1)) ;
*tidshD_mv(g,h,"mean") = sum(draw, tidshD(g,h,draw)) / card(draw) ;
*tidshD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(tidshD(g,h,draw) - tidshD_mv(g,h,"mean")))/(card(draw)-1)) ;
fixfacD_mv(g,f,h,"mean") = sum(draw, fixfacD(g,f,h,draw)) / card(draw) ;
fixfacD_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fixfacD(g,f,h,draw) - fixfacD_mv(g,f,h,"mean")))/(card(draw)-1)) ;
exincD_mv(h,"mean") = sum(draw, exincD(h,draw)) / card(draw) ;
exincD_mv(h,"stdev") = sqrt(sum(draw, sqr(exincD(h,draw) - exincD_mv(h,"mean")))/(card(draw)-1)) ;
endowD_mv(f,h,"mean") = sum(draw, endowD(f,h,draw)) / card(draw) ;
endowD_mv(f,h,"stdev") = sqrt(sum(draw, sqr(endowD(f,h,draw) - endowD_mv(f,h,"mean")))/(card(draw)-1)) ;
qcD_mv(g,h,"mean") = sum(draw, qcD(g,h,draw)) / card(draw) ;
qcD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qcD(g,h,draw) - qcD_mv(g,h,"mean")))/(card(draw)-1)) ;
eshareD_mv(g,h,"mean") = sum(draw, eshareD(g,h,draw)) / card(draw) ;
eshareD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(eshareD(g,h,draw) - eshareD_mv(g,h,"mean")))/(card(draw)-1)) ;
yD_mv(h,"mean") = sum(draw, yD(h,draw)) / card(draw) ;
yD_mv(h,"stdev") = sqrt(sum(draw, sqr(yD(h,draw) - yD_mv(h,"mean")))/(card(draw)-1)) ;
tyD_mv("mean") = sum(draw, tyD(draw)) / card(draw) ;
tyD_mv("stdev") = sqrt(sum(draw, sqr(tyD(draw) - tyD_mv("mean")))/(card(draw)-1)) ;
tryD_mv("mean") = sum(draw, tryD(draw)) / card(draw) ;
tryD_mv("stdev") = sqrt(sum(draw, sqr(tryD(draw) - tryD_mv("mean")))/(card(draw)-1)) ;

cpiD_mv(h,"mean") = sum(draw, cpiD(h,draw)) / card(draw) ;
cpiD_mv(h,"stdev") = sqrt(sum(draw, sqr(cpiD(h,draw) - cpiD_mv(h,"mean")))/(card(draw)-1)) ;
vcpiD_mv(v,"mean") = sum(draw, vcpiD(v,draw)) / card(draw) ;
vcpiD_mv(v,"stdev") = sqrt(sum(draw, sqr(vcpiD(v,draw) - vcpiD_mv(v,"mean")))/(card(draw)-1)) ;
criD_mv(v,f,"mean") = sum(draw, criD(v,f,draw)) / card(draw) ;
criD_mv(v,f,"stdev") = sqrt(sum(draw, sqr(criD(v,f,draw) - criD_mv(v,f,"mean")))/(card(draw)-1)) ;


ryD_mv(h,"mean") = sum(draw, ryD(h,draw)) / card(draw) ;
ryD_mv(h,"stdev") = sqrt(sum(draw, sqr(ryD(h,draw) - ryD_mv(h,"mean")))/(card(draw)-1)) ;
*eminD_mv(g,h,"mean") = sum(draw, eminD(g,h,draw)) / card(draw) ;
*eminD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(eminD(g,h,draw) - eminD_mv(g,h,"mean")))/(card(draw)-1)) ;
trinD_mv(h,"mean") = sum(draw, trinD(h,draw)) / card(draw) ;
trinD_mv(h,"stdev") = sqrt(sum(draw, sqr(trinD(h,draw) - trinD_mv(h,"mean")))/(card(draw)-1)) ;
troutD_mv(h,"mean") = sum(draw, troutD(h,draw)) / card(draw) ;
troutD_mv(h,"stdev") = sqrt(sum(draw, sqr(troutD(h,draw) - troutD_mv(h,"mean")))/(card(draw)-1)) ;
savD_mv(h,"mean") = sum(draw, savD(h,draw)) / card(draw) ;
savD_mv(h,"stdev") = sqrt(sum(draw, sqr(savD(h,draw) - savD_mv(h,"mean")))/(card(draw)-1)) ;
exprocD_mv(h,"mean") = sum(draw, exprocD(h,draw)) / card(draw) ;
exprocD_mv(h,"stdev") = sqrt(sum(draw, sqr(exprocD(h,draw) - exprocD_mv(h,"mean")))/(card(draw)-1)) ;


trinshD_mv(h,"mean") = sum(draw, trinshD(h,draw)) / card(draw) ;
trinshD_mv(h,"stdev") = sqrt(sum(draw, sqr(trinshD(h,draw) - trinshD_mv(h,"mean")))/(card(draw)-1)) ;
troutshD_mv(h,"mean") = sum(draw, troutshD(h,draw)) / card(draw) ;
troutshD_mv(h,"stdev") = sqrt(sum(draw, sqr(troutshD(h,draw) - troutshD_mv(h,"mean")))/(card(draw)-1)) ;
hfdD_mv(f,h,"mean") = sum(draw, hfdD(f,h,draw)) / card(draw) ;
hfdD_mv(f,h,"stdev") = sqrt(sum(draw, sqr(hfdD(f,h,draw) - hfdD_mv(f,h,"mean")))/(card(draw)-1)) ;
vfdD_mv(f,v,"mean") = sum(draw, vfdD(f,v,draw)) / card(draw) ;
vfdD_mv(f,v,"stdev") = sqrt(sum(draw, sqr(vfdD(f,v,draw) - vfdD_mv(f,v,"mean")))/(card(draw)-1)) ;
zfdD_mv(f,"mean") = sum(draw, zfdD(f,draw)) / card(draw) ;
zfdD_mv(f,"stdev") = sqrt(sum(draw, sqr(zfdD(f,draw) - zfdD_mv(f,"mean")))/(card(draw)-1)) ;
hmsD_mv(g,h,"mean") = sum(draw, hmsD(g,h,draw)) / card(draw) ;
hmsD_mv(g,h,"stdev") = sqrt(sum(draw, sqr(hmsD(g,h,draw) - hmsD_mv(g,h,"mean")))/(card(draw)-1)) ;
vmsD_mv(g,v,"mean") = sum(draw, vmsD(g,v,draw)) / card(draw) ;
vmsD_mv(g,v,"stdev") = sqrt(sum(draw, sqr(vmsD(g,v,draw) - vmsD_mv(g,v,"mean")))/(card(draw)-1)) ;
zmsD_mv(g,"mean") = sum(draw, zmsD(g,draw)) / card(draw) ;
zmsD_mv(g,"stdev") = sqrt(sum(draw, sqr(zmsD(g,draw) - zmsD_mv(g,"mean")))/(card(draw)-1)) ;
hfmsD_mv(f,h,"mean") = sum(draw, hfmsD(f,h,draw)) / card(draw) ;
hfmsD_mv(f,h,"stdev") = sqrt(sum(draw, sqr(hfmsD(f,h,draw) - hfmsD_mv(f,h,"mean")))/(card(draw)-1)) ;
vfmsD_mv(f,v,"mean") = sum(draw, vfmsD(f,v,draw)) / card(draw) ;
vfmsD_mv(f,v,"stdev") = sqrt(sum(draw, sqr(vfmsD(f,v,draw) - vfmsD_mv(f,v,"mean")))/(card(draw)-1)) ;
zfmsD_mv(f,"mean") = sum(draw, zfmsD(f,draw)) / card(draw) ;
zfmsD_mv(f,"stdev") = sqrt(sum(draw, sqr(zfmsD(f,draw) - zfmsD_mv(f,"mean")))/(card(draw)-1)) ;

display pvD_mv, pzD_mv, phD_mv, pvaD_mv, qvaD_mv, qpD_mv, tqpD_mv, ttqpD_mv, fdD_mv, idD_mv, rD_mv, wvD_mv, wzD_mv, vashD_mv, fixfacD_mv,
        exincD_mv, endowD_mv, qcD_mv, eshareD_mv, yD_mv, cpiD_mv, vcpiD_mv,  ryD_mv, tyD_mv, tryD_mv,  trinD_mv, troutD_mv, trinshD_mv,
        troutshD_mv, hfdD_mv, vfdD_mv, zfdD_mv, hmsD_mv, vmsD_mv, zmsD_mv, hfmsD_mv, vfmsD_mv, zfmsD_mv
     , pshiftD_mv, fshareD_mv
savD_mv, exprocD_mv;
*, idshD_mv, tidshD_mv, eminD_mv,

parameter
* mean and stdev of starting matrix
*pmPC_mv(g,mv)         mean and stdev of % change in market price
pvPC_mv(g,v,mv)       mean and stdev of % change in village price
pzPC_mv(g,mv)         mean and stdev of % change in zoi price
phPC_mv(g,h,mv)       mean and stdev of % change in market price as seen by household
pvaPC_mv(g,h,mv)      mean and stdev of % change in price of value added
qvaPC_mv(g,h,mv)      mean and stdev of % change in quantity of value added
qpPC_mv(g,h,mv)       mean and stdev of % change in quantity produced
tqpPC_mv(g,mv)        mean and stdev of % change in quantity produced total
ttqpPC_mv(mv)
fdPC_mv(g,f,h,mv)     mean and stdev of % change in factor demand
idPC_mv(g,gg,h,mv)    mean and stdev of % change in intermediate demand
pshiftPC_mv(g,h,mv)    mean and stdev of % change in cobb-douglas shifter
fsharePC_mv(g,f,h,mv) mean and stdev of % change in cobb-douglas shares
rPC_mv(g,f,h,mv)      mean and stdev of % change in rent for fixed factors
wvPC_mv(f,v,mv)       mean and stdev of % change in village-wide wage for tradable factors
wzPC_mv(f,mv)         mean and stdev of % change in zoi-wide wage for tradable factors
vashPC_mv(g,h,mv)     mean and stdev of % change in value-added share
idshPC_mv(gg,g,h,mv)  mean and stdev of % change in intermediate demand share
tidshPC_mv(gg,h,mv)   mean and stdev of % change in total intermediate input share (PC_mv-vash)
fixfacPC_mv(g,f,h,mv) mean and stdev of % change in fixed factor demand
exincPC_mv(h,mv)      mean and stdev of % change in exogenous income
endowPC_mv(f,h,mv)    mean and stdev of % change in endowment
qcPC_mv(g,h,mv)       mean and stdev of % change in level of consumption
esharePC_mv(g,h,mv)    mean and stdev of % change in consumption shares
yPC_mv(h,mv)          mean and stdev of % change in income of household
cpiPC_mv(h,mv)        mean and stdev of % change cpi of household
vcpiPC_mv(v,mv)       mean and stdev of % change cpi of village
criPC_mv(v,f,mv)       mean and stdev of % change cri of village
ryPC_mv(h,mv)         mean and stdev of % change real income of household
eminPC_mv(g,h,mv)     mean and stdev of % change in incompressible demand
trinPC_mv(h,mv)       mean and stdev of % change in transfers in - received
troutPC_mv(h,mv)      mean and stdev of % change in transfers out - given
savPC_mv(h,mv)        mean and stdev of % change savings
exprocPC_mv(h,mv)     mean and stdev of % change expenditures rest of the world

trinshPC_mv(h,mv)     mean and stdev of % change in share of all transfers in the eco going to h
troutshPC_mv(h,mv)    mean and stdev of % change in share of yousehold h's income being given as transfers
hfdPC_mv(f,h,mv)      mean and stdev of % change in factor demand of household h for factor f
vfdPC_mv(f,v,mv)      mean and stdev of % change in village demand for factor f
zfdPC_mv(f,mv)        mean and stdev of % change in zoi demand for factor f
hmsPC_mv(g,h,mv)      mean and stdev of % change in household marketed surplus of good g
vmsPC_mv(g,v,mv)      mean and stdev of % change in village marketed surplus of good g
zmsPC_mv(g,mv)        mean and stdev of % change in household marketed surplus of good g
hfmsPC_mv(f,h,mv)     mean and stdev of % change in household factor marketed surplus
vfmsPC_mv(f,v,mv)     mean and stdev of % change in village factor marketed surplus
zfmsPC_mv(f,mv)       mean and stdev of % change in zoi factor marketed surplus

hqpPC_mv(h,mv)
;

pvPC_mv(g,v,"mean") = sum(draw, pvPC(g,v,draw)) / card(draw) ;
pvPC_mv(g,v,"stdev") = sqrt(sum(draw, sqr(pvPC(g,v,draw) - pvPC_mv(g,v,"mean")))/(card(draw)-1)) ;
pzPC_mv(g,"mean") = sum(draw, pzPC(g,draw)) / card(draw) ;
pzPC_mv(g,"stdev") = sqrt(sum(draw, sqr(pzPC(g,draw) - pzPC_mv(g,"mean")))/(card(draw)-1)) ;
phPC_mv(g,h,"mean") = sum(draw, phPC(g,h,draw)) / card(draw) ;
phPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(phPC(g,h,draw) - phPC_mv(g,h,"mean")))/(card(draw)-1)) ;
pvaPC_mv(g,h,"mean") = sum(draw, pvaPC(g,h,draw)) / card(draw) ;
pvaPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(pvaPC(g,h,draw) - pvaPC_mv(g,h,"mean")))/(card(draw)-1)) ;
qvaPC_mv(g,h,"mean") = sum(draw, qvaPC(g,h,draw)) / card(draw) ;
qvaPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qvaPC(g,h,draw) - qvaPC_mv(g,h,"mean")))/(card(draw)-1)) ;
qpPC_mv(g,h,"mean") = sum(draw, qpPC(g,h,draw)) / card(draw) ;
qpPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qpPC(g,h,draw) - qpPC_mv(g,h,"mean")))/(card(draw)-1)) ;
fdPC_mv(g,f,h,"mean") = sum(draw, fdPC(g,f,h,draw)) / card(draw) ;
fdPC_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fdPC(g,f,h,draw) - fdPC_mv(g,f,h,"mean")))/(card(draw)-1)) ;
idPC_mv(g,gg,h,"mean") = sum(draw, idPC(g,gg,h,draw)) / card(draw) ;
idPC_mv(g,gg,h,"stdev") = sqrt(sum(draw, sqr(idPC(g,gg,h,draw) - idPC_mv(g,gg,h,"mean")))/(card(draw)-1)) ;
pshiftPC_mv(g,h,"mean") = sum(draw, pshiftPC(g,h,draw)) / card(draw) ;
pshiftPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(pshiftPC(g,h,draw) - pshiftPC_mv(g,h,"mean")))/(card(draw)-1)) ;
fsharePC_mv(g,f,h,"mean") = sum(draw, fsharePC(g,f,h,draw)) / card(draw) ;
fsharePC_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fsharePC(g,f,h,draw) - fsharePC_mv(g,f,h,"mean")))/(card(draw)-1)) ;
rPC_mv(g,f,h,"mean") = sum(draw, rPC(g,f,h,draw)) / card(draw) ;
rPC_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(rPC(g,f,h,draw) - rPC_mv(g,f,h,"mean")))/(card(draw)-1)) ;
wvPC_mv(f,v,"mean") = sum(draw, wvPC(f,v,draw)) / card(draw) ;
wvPC_mv(f,v,"stdev") = sqrt(sum(draw, sqr(wvPC(f,v,draw) - wvPC_mv(f,v,"mean")))/(card(draw)-1)) ;
wzPC_mv(f,"mean") = sum(draw, wzPC(f,draw)) / card(draw) ;
wzPC_mv(f,"stdev") = sqrt(sum(draw, sqr(wzPC(f,draw) - wzPC_mv(f,"mean")))/(card(draw)-1)) ;
vashPC_mv(g,h,"mean") = sum(draw, vashPC(g,h,draw)) / card(draw) ;
vashPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(vashPC(g,h,draw) - vashPC_mv(g,h,"mean")))/(card(draw)-1)) ;
qpPC_mv(g,h,"mean") = sum(draw, qpPC(g,h,draw)) / card(draw) ;
qpPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qpPC(g,h,draw) - qpPC_mv(g,h,"mean")))/(card(draw)-1)) ;
tqpPC_mv(g,"mean") = sum(draw, tqpPC(g,draw)) / card(draw) ;
tqpPC_mv(g,"stdev") = sqrt(sum(draw, sqr(tqpPC(g,draw) - tqpPC_mv(g,"mean")))/(card(draw)-1)) ;
ttqpPC_mv("mean") = sum(draw, ttqpPC(draw)) / card(draw) ;
ttqpPC_mv("stdev") = sqrt(sum(draw, sqr(ttqpPC(draw) - ttqpPC_mv("mean")))/(card(draw)-1)) ;

*idshPC_mv(g,gg,h,"mean") = sum(draw, idshPC(g,gg,h,draw)) / card(draw) ;
*idshPC_mv(g,gg,h,"stdev") = sqrt(sum(draw, sqr(idshPC(g,gg,h,draw) - idshPC_mv(g,gg,h,"mean")))/(card(draw)-1)) ;
*tidshPC_mv(g,h,"mean") = sum(draw, tidshPC(g,h,draw)) / card(draw) ;
*tidshPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(tidshPC(g,h,draw) - tidshPC_mv(g,h,"mean")))/(card(draw)-1)) ;
fixfacPC_mv(g,f,h,"mean") = sum(draw, fixfacPC(g,f,h,draw)) / card(draw) ;
fixfacPC_mv(g,f,h,"stdev") = sqrt(sum(draw, sqr(fixfacPC(g,f,h,draw) - fixfacPC_mv(g,f,h,"mean")))/(card(draw)-1)) ;
exincPC_mv(h,"mean") = sum(draw, exincPC(h,draw)) / card(draw) ;
exincPC_mv(h,"stdev") = sqrt(sum(draw, sqr(exincPC(h,draw) - exincPC_mv(h,"mean")))/(card(draw)-1)) ;
endowPC_mv(f,h,"mean") = sum(draw, endowPC(f,h,draw)) / card(draw) ;
endowPC_mv(f,h,"stdev") = sqrt(sum(draw, sqr(endowPC(f,h,draw) - endowPC_mv(f,h,"mean")))/(card(draw)-1)) ;
qcPC_mv(g,h,"mean") = sum(draw, qcPC(g,h,draw)) / card(draw) ;
qcPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(qcPC(g,h,draw) - qcPC_mv(g,h,"mean")))/(card(draw)-1)) ;
esharePC_mv(g,h,"mean") = sum(draw, esharePC(g,h,draw)) / card(draw) ;
esharePC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(esharePC(g,h,draw) - esharePC_mv(g,h,"mean")))/(card(draw)-1)) ;
yPC_mv(h,"mean") = sum(draw, yPC(h,draw)) / card(draw) ;
yPC_mv(h,"stdev") = sqrt(sum(draw, sqr(yPC(h,draw) - yPC_mv(h,"mean")))/(card(draw)-1)) ;
cpiPC_mv(h,"mean") = sum(draw, cpiPC(h,draw)) / card(draw) ;
cpiPC_mv(h,"stdev") = sqrt(sum(draw, sqr(cpiPC(h,draw) - cpiPC_mv(h,"mean")))/(card(draw)-1)) ;
vcpiPC_mv(v,"mean") = sum(draw, vcpiPC(v,draw)) / card(draw) ;
vcpiPC_mv(v,"stdev") = sqrt(sum(draw, sqr(vcpiPC(v,draw) - vcpiPC_mv(v,"mean")))/(card(draw)-1)) ;
criPC_mv(v,f,"mean") = sum(draw, criPC(v,f,draw)) / card(draw) ;
criPC_mv(v,f,"stdev") = sqrt(sum(draw, sqr(criPC(v,f,draw) - criPC_mv(v,f,"mean")))/(card(draw)-1)) ;

ryPC_mv(h,"mean") = sum(draw, ryPC(h,draw)) / card(draw) ;
ryPC_mv(h,"stdev") = sqrt(sum(draw, sqr(ryPC(h,draw) - ryPC_mv(h,"mean")))/(card(draw)-1)) ;
*eminPC_mv(g,h,"mean") = sum(draw, eminPC(g,h,draw)) / card(draw) ;
*eminPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(eminPC(g,h,draw) - eminPC_mv(g,h,"mean")))/(card(draw)-1)) ;
trinPC_mv(h,"mean") = sum(draw, trinPC(h,draw)) / card(draw) ;
trinPC_mv(h,"stdev") = sqrt(sum(draw, sqr(trinPC(h,draw) - trinPC_mv(h,"mean")))/(card(draw)-1)) ;
troutPC_mv(h,"mean") = sum(draw, troutPC(h,draw)) / card(draw) ;
troutPC_mv(h,"stdev") = sqrt(sum(draw, sqr(troutPC(h,draw) - troutPC_mv(h,"mean")))/(card(draw)-1)) ;
savPC_mv(h,"mean") = sum(draw, savPC(h,draw)) / card(draw) ;
savPC_mv(h,"stdev") = sqrt(sum(draw, sqr(savPC(h,draw) - savPC_mv(h,"mean")))/(card(draw)-1)) ;
exprocPC_mv(h,"mean") = sum(draw, exprocPC(h,draw)) / card(draw) ;
exprocPC_mv(h,"stdev") = sqrt(sum(draw, sqr(exprocPC(h,draw) - exprocPC_mv(h,"mean")))/(card(draw)-1)) ;


trinshPC_mv(h,"mean") = sum(draw, trinshPC(h,draw)) / card(draw) ;
trinshPC_mv(h,"stdev") = sqrt(sum(draw, sqr(trinshPC(h,draw) - trinshPC_mv(h,"mean")))/(card(draw)-1)) ;
troutshPC_mv(h,"mean") = sum(draw, troutshPC(h,draw)) / card(draw) ;
troutshPC_mv(h,"stdev") = sqrt(sum(draw, sqr(troutshPC(h,draw) - troutshPC_mv(h,"mean")))/(card(draw)-1)) ;
hfdPC_mv(f,h,"mean") = sum(draw, hfdPC(f,h,draw)) / card(draw) ;
hfdPC_mv(f,h,"stdev") = sqrt(sum(draw, sqr(hfdPC(f,h,draw) - hfdPC_mv(f,h,"mean")))/(card(draw)-1)) ;
vfdPC_mv(f,v,"mean") = sum(draw, vfdPC(f,v,draw)) / card(draw) ;
vfdPC_mv(f,v,"stdev") = sqrt(sum(draw, sqr(vfdPC(f,v,draw) - vfdPC_mv(f,v,"mean")))/(card(draw)-1)) ;
zfdPC_mv(f,"mean") = sum(draw, zfdPC(f,draw)) / card(draw) ;
zfdPC_mv(f,"stdev") = sqrt(sum(draw, sqr(zfdPC(f,draw) - zfdPC_mv(f,"mean")))/(card(draw)-1)) ;
hmsPC_mv(g,h,"mean") = sum(draw, hmsPC(g,h,draw)) / card(draw) ;
hmsPC_mv(g,h,"stdev") = sqrt(sum(draw, sqr(hmsPC(g,h,draw) - hmsPC_mv(g,h,"mean")))/(card(draw)-1)) ;
vmsPC_mv(g,v,"mean") = sum(draw, vmsPC(g,v,draw)) / card(draw) ;
vmsPC_mv(g,v,"stdev") = sqrt(sum(draw, sqr(vmsPC(g,v,draw) - vmsPC_mv(g,v,"mean")))/(card(draw)-1)) ;
zmsPC_mv(g,"mean") = sum(draw, zmsPC(g,draw)) / card(draw) ;
zmsPC_mv(g,"stdev") = sqrt(sum(draw, sqr(zmsPC(g,draw) - zmsPC_mv(g,"mean")))/(card(draw)-1)) ;
hfmsPC_mv(f,h,"mean") = sum(draw, hfmsPC(f,h,draw)) / card(draw) ;
hfmsPC_mv(f,h,"stdev") = sqrt(sum(draw, sqr(hfmsPC(f,h,draw) - hfmsPC_mv(f,h,"mean")))/(card(draw)-1)) ;
vfmsPC_mv(f,v,"mean") = sum(draw, vfmsPC(f,v,draw)) / card(draw) ;
vfmsPC_mv(f,v,"stdev") = sqrt(sum(draw, sqr(vfmsPC(f,v,draw) - vfmsPC_mv(f,v,"mean")))/(card(draw)-1)) ;
zfmsPC_mv(f,"mean") = sum(draw, zfmsPC(f,draw)) / card(draw) ;
zfmsPC_mv(f,"stdev") = sqrt(sum(draw, sqr(zfmsPC(f,draw) - zfmsPC_mv(f,"mean")))/(card(draw)-1)) ;


display pvPC_mv, pzPC_mv, phPC_mv, pvaPC_mv, qvaPC_mv, qpPC_mv, fdPC_mv, idPC_mv, rPC_mv, wvPC_mv, wzPC_mv, vashPC_mv, fixfacPC_mv,
        exincPC_mv, endowPC_mv, qcPC_mv, esharePC_mv, yPC_mv,  cpiPC_mv, criPC_mv, ryPC_mv, trinPC_mv, troutPC_mv, trinshPC_mv,
        troutshPC_mv, hfdPC_mv, vfdPC_mv, zfdPC_mv, hmsPC_mv, vmsPC_mv, zmsPC_mv, hfmsPC_mv, vfmsPC_mv, zfmsPC_mv
, pshiftPC_mv, fsharePC_mv;
* idshPC_mv, tidshPC_mv, eminPC_mv,


* Welfare and efficiency
parameter cvh_mv(h,mv)   compensating variation per household
          cvh_perc_mv(h,mv) cv ac a percentage of initial income
          cv_mv(mv)   compensating variation across all households
          cv_perc_mv(mv) compensating variation as a percentage of income
          ymult_mv(mv)   nominal income multiplier
          cvmult_mv(mv)  cv multiplier
          ymult_h_mv(h,mv) nominal income multiplier by treatment household
          ytotmult_h_mv(h,mv) nominal income multiplier by treatment household
          ymult_treat_mv(mv) nominal income multiplier by treatment household
          ymult_vil_mv(v,mv) nominal income multiplier by village
          ymult_all_mv(mv) nominal income multiplier for all
          rymult_mv(mv)   nominal income multiplier
          rymult_h_mv(h,mv) nominal income multiplier bry treatment household
          rytotmult_h_mv(h,mv) nominal income multiplier bry treatment household
          rymult_treat_mv(mv) nominal income multiplier bry treatment household
          rymult_vil_mv(v,mv) nominal income multiplier bry village
          rymult_all_mv(mv) nominal income multiplier for all

          prodmult_h_mv(g,h,mv) production multiplier by treatment household
          prodTotmult_h_mv(g,h,mv) production multiplier by treatment household
          prodmult_treat_mv(g,mv)  production multiplier by treatment household
          prodmult_ntreat_mv(g,mv)  production multiplier by NON treatment household
          prodmult_vil_mv(g,v,mv)  production multiplier by village
          prodmult_all_mv(g,mv)  production multiplier for all
          tprodmult_all_mv(mv)  total total production multiplier for all

          ttprodmult_mv(mv)   production multiplier for ttqp
          hprodmult_mv(h,mv)     production mutiplier for hqp

          ykmult_h_mv(h,mv) multiplier of the program + the capital influx
          rykmult_h_mv(h,mv) multiplier of the program + the capital influx
          ykTotmult_h_mv(h,mv) multiplier of the program + the capital influx
          rykTotmult_h_mv(h,mv) multiplier of the program + the capital influx
          ykmult_all_mv(mv) multiplier of the program + the capital influx
          rykmult_all_mv(mv) multiplier of the program + the capital influx
;

cvh_mv(h,"mean") = sum(draw, cvh(h,draw)) / card(draw) ;
cvh_mv(h,"stdev") = sqrt(sum(draw, sqr(cvh(h,draw) - cvh_mv(h,"mean")))/(card(draw)-1)) ;
cvh_perc_mv(h,"mean") = sum(draw, cvh_perc(h,draw)) / card(draw) ;
cvh_perc_mv(h,"stdev") = sqrt(sum(draw, sqr(cvh_perc(h,draw) - cvh_perc_mv(h,"mean")))/(card(draw)-1)) ;
cv_mv("mean") = sum(draw, cv(draw)) / card(draw) ;
cv_mv("stdev") = sqrt(sum(draw, sqr(cv(draw) - cv_mv("mean")))/(card(draw)-1)) ;
cv_perc_mv("mean") = sum(draw, cv_perc(draw)) / card(draw) ;
cv_perc_mv("stdev") = sqrt(sum(draw, sqr(cv_perc(draw) - cv_perc_mv("mean")))/(card(draw)-1)) ;

ymult_mv("mean") = sum(draw, ymult(draw)) / card(draw) ;
ymult_mv("stdev") = sqrt(sum(draw, sqr(ymult(draw) - ymult_mv("mean")))/(card(draw)-1)) ;
cvmult_mv("mean") = sum(draw, cvmult(draw)) / card(draw) ;
cvmult_mv("stdev") = sqrt(sum(draw, sqr(cvmult(draw) - cvmult_mv("mean")))/(card(draw)-1)) ;

ymult_h_mv(h,"mean") = sum(draw, ymult_h(h,draw)) / card(draw) ;
ymult_h_mv(h,"stdev") = sqrt(sum(draw, sqr(ymult_h(h,draw) - ymult_h_mv(h,"mean")))/(card(draw)-1)) ;
ytotmult_h_mv(h,"mean") = sum(draw, ytotmult_h(h,draw)) / card(draw) ;
ytotmult_h_mv(h,"stdev") = sqrt(sum(draw, sqr(ytotmult_h(h,draw) - ytotmult_h_mv(h,"mean")))/(card(draw)-1)) ;

ymult_treat_mv("mean") = sum(draw, ymult_treat(draw)) / card(draw) ;
ymult_treat_mv("stdev") = sqrt(sum(draw, sqr(ymult_treat(draw) - ymult_treat_mv("mean")))/(card(draw)-1)) ;
ymult_vil_mv(v,"mean") = sum(draw, ymult_vil(v,draw)) / card(draw) ;
ymult_vil_mv(v,"stdev") = sqrt(sum(draw, sqr(ymult_vil(v,draw) - ymult_vil_mv(v,"mean")))/(card(draw)-1)) ;
ymult_all_mv("mean") = sum(draw, ymult_all(draw)) / card(draw) ;
ymult_all_mv("stdev") = sqrt(sum(draw, sqr(ymult_all(draw) - ymult_all_mv("mean")))/(card(draw)-1)) ;

rymult_h_mv(h,"mean") = sum(draw, rymult_h(h,draw)) / card(draw) ;
rymult_h_mv(h,"stdev") = sqrt(sum(draw, sqr(rymult_h(h,draw) - rymult_h_mv(h,"mean")))/(card(draw)-1)) ;
rytotmult_h_mv(h,"mean") = sum(draw, rytotmult_h(h,draw)) / card(draw) ;
rytotmult_h_mv(h,"stdev") = sqrt(sum(draw, sqr(rytotmult_h(h,draw) - rytotmult_h_mv(h,"mean")))/(card(draw)-1)) ;
rymult_treat_mv("mean") = sum(draw, rymult_treat(draw)) / card(draw) ;
rymult_treat_mv("stdev") = sqrt(sum(draw, sqr(rymult_treat(draw) - rymult_treat_mv("mean")))/(card(draw)-1)) ;
rymult_vil_mv(v,"mean") = sum(draw, rymult_vil(v,draw)) / card(draw) ;
rymult_vil_mv(v,"stdev") = sqrt(sum(draw, sqr(rymult_vil(v,draw) - rymult_vil_mv(v,"mean")))/(card(draw)-1)) ;
rymult_all_mv("mean") = sum(draw, rymult_all(draw)) / card(draw) ;
rymult_all_mv("stdev") = sqrt(sum(draw, sqr(rymult_all(draw) - rymult_all_mv("mean")))/(card(draw)-1)) ;

prodmult_h_mv(g,h,"mean") = sum(draw, prodmult_h(g,h,draw)) / card(draw) ;
prodmult_h_mv(g,h,"stdev") = sqrt(sum(draw, sqr(prodmult_h(g,h,draw) - prodmult_h_mv(g,h,"mean")))/(card(draw)-1)) ;
prodTotmult_h_mv(g,h,"mean") = sum(draw, prodTotmult_h(g,h,draw)) / card(draw) ;
prodTotmult_h_mv(g,h,"stdev") = sqrt(sum(draw, sqr(prodTotmult_h(g,h,draw) - prodTotmult_h_mv(g,h,"mean")))/(card(draw)-1)) ;
prodmult_treat_mv(g,"mean") = sum(draw, prodmult_treat(g,draw)) / card(draw) ;
prodmult_treat_mv(g,"stdev") = sqrt(sum(draw, sqr(prodmult_treat(g,draw) - prodmult_treat_mv(g,"mean")))/(card(draw)-1)) ;
prodmult_ntreat_mv(g,"mean") = sum(draw, prodmult_ntreat(g,draw)) / card(draw) ;
prodmult_ntreat_mv(g,"stdev") = sqrt(sum(draw, sqr(prodmult_ntreat(g,draw) - prodmult_ntreat_mv(g,"mean")))/(card(draw)-1)) ;
prodmult_vil_mv(g,v,"mean") = sum(draw, prodmult_vil(g,v,draw)) / card(draw) ;
prodmult_vil_mv(g,v,"stdev") = sqrt(sum(draw, sqr(prodmult_vil(g,v,draw) - prodmult_vil_mv(g,v,"mean")))/(card(draw)-1)) ;
prodmult_all_mv(g,"mean") = sum(draw, prodmult_all(g,draw)) / card(draw) ;
prodmult_all_mv(g,"stdev") = sqrt(sum(draw, sqr(prodmult_all(g,draw) - prodmult_all_mv(g,"mean")))/(card(draw)-1)) ;

tprodmult_all_mv("mean") = sum(draw, tprodmult_all(draw)) / card(draw) ;
tprodmult_all_mv("stdev") = sqrt(sum(draw, sqr(tprodmult_all(draw) - tprodmult_all_mv("mean")))/(card(draw)-1)) ;

ttprodmult_mv("mean") = sum(draw, ttprodmult(draw)) / card(draw) ;
ttprodmult_mv("stdev") = sqrt(sum(draw, sqr(ttprodmult(draw) - ttprodmult_mv("mean")))/(card(draw)-1)) ;
hprodmult_mv(h,"mean") = sum(draw, hprodmult(h,draw)) / card(draw) ;
hprodmult_mv(h,"stdev") = sqrt(sum(draw, sqr(hprodmult(h,draw) - hprodmult_mv(h,"mean")))/(card(draw)-1)) ;


ykmult_h_mv(h,"mean") = sum(draw, ykmult_h(h,draw)) / card(draw) ;
ykmult_h_mv(h,"stdev") = sqrt(sum(draw, sqr(ykmult_h(h,draw) - ykmult_h_mv(h,"mean")))/(card(draw)-1)) ;
yktotmult_h_mv(h,"mean") = sum(draw, yktotmult_h(h,draw)) / card(draw) ;
yktotmult_h_mv(h,"stdev") = sqrt(sum(draw, sqr(yktotmult_h(h,draw) - yktotmult_h_mv(h,"mean")))/(card(draw)-1)) ;
rykmult_h_mv(h,"mean") = sum(draw, rykmult_h(h,draw)) / card(draw) ;
rykmult_h_mv(h,"stdev") = sqrt(sum(draw, sqr(rykmult_h(h,draw) - rykmult_h_mv(h,"mean")))/(card(draw)-1)) ;
ryktotmult_h_mv(h,"mean") = sum(draw, ryktotmult_h(h,draw)) / card(draw) ;
ryktotmult_h_mv(h,"stdev") = sqrt(sum(draw, sqr(ryktotmult_h(h,draw) - ryktotmult_h_mv(h,"mean")))/(card(draw)-1)) ;
ykmult_all_mv("mean") = sum(draw, ykmult_all(draw)) / card(draw) ;
ykmult_all_mv("stdev") = sqrt(sum(draw, sqr(ykmult_all(draw) - ykmult_all_mv("mean")))/(card(draw)-1)) ;
rykmult_all_mv("mean") = sum(draw, rykmult_all(draw)) / card(draw) ;
rykmult_all_mv("stdev") = sqrt(sum(draw, sqr(rykmult_all(draw) - rykmult_all_mv("mean")))/(card(draw)-1)) ;


display cvh_mv, cvh_perc_mv, cv_mv, cv_perc_mv, ymult_mv, cvmult_mv,
     ymult_h_mv, ytotmult_h_mv, ymult_treat_mv, ymult_vil_mv, ymult_all_mv,
     rymult_h_mv, rytotmult_h_mv, rymult_treat_mv, rymult_vil_mv, rymult_all_mv,
     prodmult_h_mv, prodTotmult_h_mv, prodmult_treat_mv, prodmult_treat_mv,  prodmult_vil_mv,  prodmult_all_mv
tprodmult_all_mv,
     ykmult_h_mv, yktotmult_h_mv, rykmult_h_mv, ryktotmult_h_mv, ykmult_all_mv,rykmult_all_mv;

* Make a parameter for "increase in trade between zoi and rest of world"
parameter zoirowtradD_mv(mv) change in trade between zoi and rest of world
          zoirowtradD(draw) change in trade between zoi and rest of world;

zoirowtradD(draw) = sum(h, exprocD(h,draw)) + sum((v,gtw),abs(vmsD(gtw,v,draw))) ;
zoirowtradD_mv("mean") = sum(draw, zoirowtradD(draw)) / card(draw) ;
zoirowtradD_mv("stdev") = sqrt(sum(draw, sqr(zoirowtradD(draw) - zoirowtradD_mv("mean")))/(card(draw)-1)) ;
display zoirowtradD,   zoirowtradD_mv ;

* Figure out the lower and higher confidence bounds:
set lh(mv) /pct5, pct95 /
parameter Torank(draw)
          Ranks(draw)
* add percentiles to "ci" if you want to know more percentile values,
* for instance adding ", med 50" will compute 50th percentile and call it "med"
* (note: in that example you must also add "med" to the mv and lh sets)
          ci(lh) confidence interval definition /pct5 5, pct95 95/
          ci2(lh) confidence intervals (values) ;

* this initialises the use of the "rank" procedure
$libinclude rank

* yD(h)
* This loops over all the household and, for each one, ranks the values of incomes
* and computes the percentiles we chose to compute in the "ci" parameter.
* This is looped because the "rank" procedure only works for one-dimentional parameters,
* so we make a one-dimentional parameter and overwrite it for each household in turn.
loop(h,
     Torank(draw) = yD(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     display Torank, Ranks, ci ;
     yD_mv(h,lh) = ci2(lh) ;
);
display yD_mv;

* Now repeat this operation for all the parameters we want confidence bounds for:

* CPI
loop(h,
     Torank(draw) = cpiPC(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     display Torank, Ranks, ci ;
     cpiPC_mv(h,lh) = ci2(lh) ;
);
display cpiPC_mv;

loop(h,
     Torank(draw) = tyD(draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     display Torank, Ranks, ci ;
     tyD_mv(lh) = ci2(lh) ;
);
display tyD_mv;

loop(h,
     Torank(draw) = tryD(draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     display Torank, Ranks, ci ;
     tryD_mv(lh) = ci2(lh) ;
);
display tryD_mv;

* ymult_h(h)
loop(h,
     Torank(draw) = ymult_h(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     ymult_h_mv(h,lh) = ci2(lh) ;
);
display ymult_h_mv;

* REAL income
loop(h,
     Torank(draw) = rymult_h(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     rymult_h_mv(h,lh) = ci2(lh) ;
);
display rymult_h_mv;

loop(h,
     Torank(draw) = rykmult_h(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     rykmult_h_mv(h,lh) = ci2(lh) ;
);
display rykmult_h_mv;

loop(h,
     Torank(draw) = ytotmult_h(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     ytotmult_h_mv(h,lh) = ci2(lh) ;
);
display ytotmult_h_mv;

loop(h,
     Torank(draw) = rytotmult_h(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     rytotmult_h_mv(h,lh) = ci2(lh) ;
);
display rytotmult_h_mv;

loop(h,
     Torank(draw) = yktotmult_h(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     yktotmult_h_mv(h,lh) = ci2(lh) ;
);
display yktotmult_h_mv;

loop(h,
     Torank(draw) = ryktotmult_h(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     ryktotmult_h_mv(h,lh) = ci2(lh) ;
);
display ryktotmult_h_mv;

* ymult_vil(v)
loop(v,
     Torank(draw) = ymult_vil(v,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     ymult_vil_mv(v,lh) = ci2(lh) ;
);
display ymult_vil_mv;

* ymult_vil(v)
loop(v,
     Torank(draw) = rymult_vil(v,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     rymult_vil_mv(v,lh) = ci2(lh) ;
);
display rymult_vil_mv;

* ymult_all is already 1-dimentional, so no need to loop here
ci2(lh) = ci(lh);
$libinclude rank ymult_all draw Ranks ci2
ymult_all_mv(lh) = ci2(lh) ;
display ymult_all_mv ;

ci2(lh) = ci(lh);
$libinclude rank ykmult_all draw Ranks ci2
ykmult_all_mv(lh) = ci2(lh) ;
display ykmult_all_mv ;

* REAL ymult_all
ci2(lh) = ci(lh);
$libinclude rank rymult_all draw Ranks ci2
rymult_all_mv(lh) = ci2(lh) ;
display rymult_all_mv ;

ci2(lh) = ci(lh);
$libinclude rank rykmult_all draw Ranks ci2
rykmult_all_mv(lh) = ci2(lh) ;
display rykmult_all_mv ;

* prodmult_h is by hh and by good:
loop(h,
     loop(g,
          Torank(draw) = prodmult_h(g,h,draw) ;
          ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
          prodmult_h_mv(g,h,lh) = ci2(lh) ;
     );
);
display prodmult_h_mv;

loop(h,
     loop(g,
          Torank(draw) = prodtotmult_h(g,h,draw) ;
          ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
          prodtotmult_h_mv(g,h,lh) = ci2(lh) ;
     );
);
display prodtotmult_h_mv;

* Now at the village level:
loop(v,
     loop(g,
          Torank(draw) = prodmult_vil(g,v,draw) ;
          ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
          prodmult_vil_mv(g,v,lh) = ci2(lh) ;
     );
);
display prodmult_vil_mv;


* cri(v,draw)
loop(v,
     loop(f,
          Torank(draw) = criPC(v,f,draw) ;
          ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
          criPC_mv(v,f,lh) = ci2(lh) ;
     );
);
display criPC_mv;

* prices at the crop level
loop(v,
     loop(g,
          Torank(draw) = pvPC(g,v,draw) ;
          ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
          pvPC_mv(g,v,lh) = ci2(lh) ;
     );
);
display pvPC_mv;

* wages at the village level
loop(v,
     loop(f,
          Torank(draw) = wvPC(f,v,draw) ;
          ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
          wvPC_mv(f,v,lh) = ci2(lh) ;
     );
);
display wvPC_mv;


* prodmult_treat() and prodmult ntreat are g-dimentional
loop(g,
     Torank(draw) = prodmult_treat(g,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     prodmult_treat_mv(g,lh) = ci2(lh) ;
);
display prodmult_treat_mv;

loop(g,
     Torank(draw) = prodmult_ntreat(g,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     prodmult_ntreat_mv(g,lh) = ci2(lh) ;
);
display prodmult_ntreat_mv;

loop(g,
     Torank(draw) = prodmult_all(g,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     prodmult_all_mv(g,lh) = ci2(lh) ;
);
display prodmult_all_mv;

Torank(draw) = tprodmult_all(draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     tprodmult_all_mv(lh) = ci2(lh) ;
display tprodmult_all_mv;

loop(g,
     Torank(draw) = tqpD(g,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     tqpD_mv(g,lh) = ci2(lh) ;
);
display tqpD_mv;

Torank(draw) = ttqpD(draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     ttqpD_mv(lh) = ci2(lh) ;
display ttqpD_mv;

Torank(draw) = ttprodmult(draw) ;
ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
ttprodmult_mv(lh) = ci2(lh) ;

loop(h,
     Torank(draw) = hqpD(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     hqpD_mv(h,lh) = ci2(lh) ;
);
display hqpD_mv;

loop(h,
     Torank(draw) = hprodmult(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     hprodmult_mv(h,lh) = ci2(lh) ;
);
display hprodmult_mv;

Torank(draw) = zoirowtradD(draw) ;
ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
zoirowtradD_mv(lh) = ci2(lh) ;




$ontext
* output for Ed's first tables - now obsolete?
parameter      yD_mvout(h,mv,*)
               qpPC_mvout(g,h,mv,*)
               pmt_out(g,mv,*)
               pmnt_out(g,mv,*) ;
yd_mvout(h,mv,"out") = yd_mv(h,mv) ;
qpPC_mvout(g,h,mv,"out") = qpPC_mv(g,h,mv);
pmt_out(g,mv,"out") = prodmult_treat_mv(g,mv);
pmnt_out(g,mv,"out") = prodmult_ntreat_mv(g,mv);
option qpPC_mvout:2:3:1;
display yD_mvout, qpPC_mvout, pmt_out, pmnt_out  ;
$offtext

* Parameters used in the tables Lesotho_results_latest_Ed.xlsx:
display "#################################################################################";
display "####### THESE PARAMETERS WERE USED FOR THE INTERIM REPORT TABLES ################";
display "#################################################################################";
* total income multipliers and levels:
display ymult_all_mv, rymult_all_mv, tyD_mv, tryD_mv ;
* income by household group - multipliers and levels:
display ytotmult_h_mv, rytotmult_h_mv, yD_mv, ryD_mv ;
* and for the scale up - treatment households are lumped together:
display ymult_treat_mv ;
* production - multipliers and levels:
display prodmult_all_mv , tqpD_mv ;



