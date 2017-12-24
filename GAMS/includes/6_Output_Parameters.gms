

* ================================================================================================
* ================================================================================================
* ===================== STEP 5 - OUTPUT PARAMETERS ==========================================================
* ================================================================================================
* ================================================================================================



* A. DELTAS AND PERCENTAGE CHANGES:
* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

* now compute and display all the values, differences in values, standard errors, etc...
display_pars(1) ;
display_pars(2) ;


* DELTA between each calibration and the corresponding simulation
pshiftD(g,h,draw,sim)    = pshift2(g,h,draw,sim)     - pshift1(g,h,draw,sim);
fshareD(g,f,h,draw,sim) = fshare2(g,f,h,draw,sim)    - fshare1(g,f,h,draw,sim) ;
pvD(g,v,draw,sim)       = pv2(g,v,draw,sim)          - pv1(g,v,draw,sim) ;
pzD(g,draw,sim)         = pz2(g,draw,sim)            - pz1(g,draw,sim) ;
phD(g,h,draw,sim)       = ph2(g,h,draw,sim)          - ph1(g,h,draw,sim) ;
qvaD(g,h,draw,sim)      = qva2(g,h,draw,sim)         - qva1(g,h,draw,sim) ;
fdD(g,f,h,draw,sim)     = fd2(g,f,h,draw,sim)        - fd1(g,f,h,draw,sim) ;
idD(gg,g,h,draw,sim)    = id2(gg,g,h,draw,sim)       - id1(gg,g,h,draw,sim) ;
rD(g,fk,h,draw,sim)     = r2(g,fk,h,draw,sim)        - r1(g,fk,h,draw,sim) ;
wvD(f,v,draw,sim)       = wv2(f,v,draw,sim)          - wv1(f,v,draw,sim) ;
wzD(f,draw,sim)         = wz2(f,draw,sim)            - wz1(f,draw,sim) ;
vashD(g,h,draw,sim)     = vash2(g,h,draw,sim)        - vash1(g,h,draw,sim)  ;
idshD(gg,g,h,draw,sim)  = idsh2(gg,g,h,draw,sim)     - idsh1(gg,g,h,draw,sim);
tidshD(g,h,draw,sim)    = tidsh2(g,h,draw,sim)       - tidsh1(g,h,draw,sim);
qpD(g,h,draw,sim)       = qp2(g,h,draw,sim)          - qp1(g,h,draw,sim) ;
tqpD(g,draw,sim)        = tqp2(g,draw,sim)           - tqp1(g,draw,sim) ;
ttqpD(draw,sim)         = ttqp2(draw,sim)            - ttqp1(draw,sim) ;
hqpD(h,draw,sim)        = hqp2(h,draw,sim)           - hqp1(h,draw,sim) ;
eminD(g,h,draw,sim)     = emin2(g,h,draw,sim)        - emin1(g,h,draw,sim) ;

fixfacD(g,fk,h,draw,sim) = fixfac2(g,fk,h,draw,sim)  - fixfac1(g,fk,h,draw,sim) ;
pvaD(g,h,draw,sim)      = pva2(g,h,draw,sim)         - pva1(g,h,draw,sim) ;
exincD(h,draw,sim)      = exinc2(h,draw,sim)         - exinc1(h,draw,sim) ;
endowD(f,h,draw,sim)    = endow2(f,h,draw,sim)       - endow1(f,h,draw,sim) ;
yD(h,draw,sim)          = y2(h,draw,sim)             - y1(h,draw,sim) ;
mryD(draw,sim)          = mry2(draw,sim)             - mry1(draw,sim) ;
rytheilD(draw,sim)      = rytheil2(draw,sim)         - rytheil1(draw,sim) ;
cpiD(h,draw,sim)        = cpi2(h,draw,sim)           - cpi1(h,draw,sim) ;
vqcD(v,g,draw,sim)      = vqc2(v,g,draw,sim)         - vqc1(v,g,draw,sim) ;
vcpiD(v,draw,sim)       = vcpi2(v,draw,sim)          - vcpi1(v,draw,sim);
criD(v,f,draw,sim)      = cri2(v,f,draw,sim)         - cri1(v,f,draw,sim);
ryD(h,draw,sim)         = ry2(h,draw,sim)            - ry1(h,draw,sim) ;
tyD(draw,sim)           = ty2(draw,sim)              - ty1(draw,sim) ;
tryD(draw,sim)          = try2(draw,sim)             - try1(draw,sim) ;
trinshD(h,draw,sim)     = trinsh2(h,draw,sim)        - trinsh1(h,draw,sim) ;
qcD(g,h,draw,sim)       = qc2(g,h,draw,sim)          - qc1(g,h,draw,sim) ;
eshareD(g,h,draw,sim)   = eshare2(g,h,draw,sim)      - eshare1(g,h,draw,sim) ;
troutshD(h,draw,sim)    = troutsh2(h,draw,sim)       - troutsh1(h,draw,sim) ;
hfdD(f,h,draw,sim)      = hfd2(f,h,draw,sim)         - hfd1(f,h,draw,sim) ;
vfdD(f,v,draw,sim)      = vfd2(f,v,draw,sim)         - vfd1(f,v,draw,sim) ;
zfdD(f,draw,sim)        = zfd2(f,draw,sim)           - zfd1(f,draw,sim) ;
hmsD(g,h,draw,sim)      = hms2(g,h,draw,sim)         - hms1(g,h,draw,sim) ;
vmsD(g,v,draw,sim)      = vms2(g,v,draw,sim)         - vms1(g,v,draw,sim) ;
zmsD(g,draw,sim)        = zms2(g,draw,sim)           - zms1(g,draw,sim) ;
hfmsD(ft,h,draw,sim)    = hfms2(ft,h,draw,sim)       - hfms1(ft,h,draw,sim) ;
vfmsD(ft,v,draw,sim)    = vfms2(ft,v,draw,sim)       - vfms1(ft,v,draw,sim) ;
zfmsD(ft,draw,sim)      = zfms2(ft,draw,sim)         - zfms1(ft,draw,sim) ;
vashD(g,h,draw,sim)     = vash2(g,h,draw,sim)        - vash1(g,h,draw,sim) ;
trinD(h,draw,sim)       = trin2(h,draw,sim)          - trin1(h,draw,sim) ;
troutD(h,draw,sim)      = trout2(h,draw,sim)         - trout1(h,draw,sim) ;
savD(h,draw,sim)        = sav2(h,draw,sim)           - sav1(h,draw,sim) ;
exprocD(h,draw,sim)     = exproc2(h,draw,sim)        - exproc1(h,draw,sim) ;
hfsupD(f,h,draw,sim)    = hfsup2(f,h,draw,sim)       - hfsup1(f,h,draw,sim) ;
fsupD(f,draw,sim)       = fsup2(f,draw,sim)          - fsup1(f,draw,sim) ;
prevD(g,h,draw,sim)     = prev2(g,h,draw,sim)        - prev1(g,h,draw,sim) ;
pcostD(g,h,draw,sim)    = pcost2(g,h,draw,sim)       - pcost1(g,h,draw,sim) ;
pprofD(g,h,draw,sim)    = pprof2(g,h,draw,sim)       - pprof1(g,h,draw,sim) ;
fincD(f,h,draw,sim)     = finc2(f,h,draw,sim)        - finc1(f,h,draw,sim) ;


* PERCENT CHANGE between each calibration and the corresponding simulation
pshiftPC(g,h,draw,sim)$pshift1(g,h,draw,sim)    = 100*pshiftD(g,h,draw,sim)/ pshift1(g,h,draw,sim);
fsharePC(g,f,h,draw,sim)$fshare1(g,f,h,draw,sim) = 100*fshareD(g,f,h,draw,sim) / fshare1(g,f,h,draw,sim) ;
pvPC(g,v,draw,sim)$pv1(g,v,draw,sim)        = 100*pvD(g,v,draw,sim)          / pv1(g,v,draw,sim) ;
pzPC(g,draw,sim)$pz1(g,draw,sim)            = 100*pzD(g,draw,sim)            / pz1(g,draw,sim) ;
phPC(g,h,draw,sim)$ph1(g,h,draw,sim)        = 100*phD(g,h,draw,sim)          / ph1(g,h,draw,sim) ;
qvaPC(g,h,draw,sim)$qva1(g,h,draw,sim)      = 100*qvaD(g,h,draw,sim)         / qva1(g,h,draw,sim) ;
fdPC(g,f,h,draw,sim)$fd1(g,f,h,draw,sim)    = 100*fdD(g,f,h,draw,sim)        / fd1(g,f,h,draw,sim) ;
idPC(gg,g,h,draw,sim)$id1(gg,g,h,draw,sim)  = 100*idD(gg,g,h,draw,sim)       / id1(gg,g,h,draw,sim) ;
rPC(g,fk,h,draw,sim)$r1(g,fk,h,draw,sim)    = 100*rD(g,fk,h,draw,sim)        / r1(g,fk,h,draw,sim) ;
wvPC(f,v,draw,sim)$wv1(f,v,draw,sim)        = 100*wvD(f,v,draw,sim)          / wv1(f,v,draw,sim) ;
wzPC(f,draw,sim)$wz1(f,draw,sim)            = 100*wzD(f,draw,sim)            / wz1(f,draw,sim) ;
vashPC(g,h,draw,sim)$vash1(g,h,draw,sim)    = 100*vashD(g,h,draw,sim)   / vash1(g,h,draw,sim)  ;
idshPC(gg,g,h,draw,sim)$idsh1(gg,g,h,draw,sim)  = 100*idshD(gg,g,h,draw,sim)/ idsh1(gg,g,h,draw,sim);
tidshPC(g,h,draw,sim)$tidsh1(g,h,draw,sim)  = 100*tidshD(g,h,draw,sim)       / tidsh1(g,h,draw,sim) ;
qpPC(g,h,draw,sim)$qp1(g,h,draw,sim)        = 100*qpD(g,h,draw,sim)          / qp1(g,h,draw,sim) ;
tqpPC(g,draw,sim)$tqp1(g,draw,sim)          = 100*tqpD(g,draw,sim)           / tqp1(g,draw,sim) ;
ttqpPC(draw,sim)$ttqp1(draw,sim)            = 100*ttqpD(draw,sim)            / ttqp1(draw,sim) ;
hqpPC(h,draw,sim)$hqp1(h,draw,sim)          = 100*hqpD(h,draw,sim)           / hqp1(h,draw,sim) ;
eminPC(g,h,draw,sim)$emin1(g,h,draw,sim)    = 100*eminD(g,h,draw,sim)        / emin1(g,h,draw,sim) ;


fixfacPC(g,fk,h,draw,sim)$fixfac1(g,fk,h,draw,sim)  = 100*fixfacD(g,fk,h,draw,sim) / fixfac1(g,fk,h,draw,sim) ;
pvaPC(g,h,draw,sim)$pva1(g,h,draw,sim)      = 100*pvaD(g,h,draw,sim)         / pva1(g,h,draw,sim) ;
exincPC(h,draw,sim)$exinc1(h,draw,sim)      = 100*exincD(h,draw,sim)         / exinc1(h,draw,sim) ;
endowPC(f,h,draw,sim)$endow1(f,h,draw,sim)  = 100*endowD(f,h,draw,sim)       / endow1(f,h,draw,sim) ;
yPC(h,draw,sim)$y1(h,draw,sim)              = 100*yD(h,draw,sim)             / y1(h,draw,sim) ;
mryPC(draw,sim)$mry1(draw,sim)              = mryD(draw,sim)                 / mry1(draw,sim) ;
rytheilPC(draw,sim)$rytheil1(draw,sim)      = rytheilD(draw,sim)             / rytheil1(draw,sim) ;

cpiPC(h,draw,sim)$cpi1(h,draw,sim)          = 100*cpiD(h,draw,sim)           / cpi1(h,draw,sim) ;
vcpiPC(v,draw,sim)$vcpi1(v,draw,sim)        = 100*vcpiD(v,draw,sim)          / vcpi1(v,draw,sim) ;
criPC(v,f,draw,sim)$cri1(v,f,draw,sim)      = 100*criD(v,f,draw,sim)         / cri1(v,f,draw,sim) ;

ryPC(h,draw,sim)$ry1(h,draw,sim)            = 100*ryD(h,draw,sim)            / ry1(h,draw,sim) ;
tyPC(draw,sim)$ty1(draw,sim)                = 100*tyD(draw,sim)              / ty1(draw,sim) ;
tryPC(draw,sim)$try1(draw,sim)              = 100*tryD(draw,sim)             / try1(draw,sim) ;
trinshPC(h,draw,sim)$trinsh1(h,draw,sim)    = 100*trinshD(h,draw,sim)        / trinsh1(h,draw,sim) ;
qcPC(g,h,draw,sim)$qc1(g,h,draw,sim)        = 100*qcD(g,h,draw,sim)          / qc1(g,h,draw,sim) ;
esharePC(g,h,draw,sim)$eshare1(g,h,draw,sim)  = 100*eshareD(g,h,draw,sim)    / eshare1(g,h,draw,sim) ;
troutshPC(h,draw,sim)$troutsh1(h,draw,sim)  = 100*troutshD(h,draw,sim)       / troutsh1(h,draw,sim) ;
hfdPC(f,h,draw,sim)$hfd1(f,h,draw,sim)      = 100*hfdD(f,h,draw,sim)         / hfd1(f,h,draw,sim) ;
vfdPC(f,v,draw,sim)$vfd1(f,v,draw,sim)      = 100*vfdD(f,v,draw,sim)         / vfd1(f,v,draw,sim) ;
zfdPC(f,draw,sim)$zfd1(f,draw,sim)          = 100*zfdD(f,draw,sim)           / zfd1(f,draw,sim) ;
hmsPC(g,h,draw,sim)$hms1(g,h,draw,sim)      = 100*hmsD(g,h,draw,sim)         / hms1(g,h,draw,sim) ;
vmsPC(g,v,draw,sim)$vms1(g,v,draw,sim)      = 100*vmsD(g,v,draw,sim)         / vms1(g,v,draw,sim) ;
zmsPC(g,draw,sim)$zms1(g,draw,sim)          = 100*zmsD(g,draw,sim)           / zms1(g,draw,sim) ;
hfmsPC(ft,h,draw,sim)$hfms1(ft,h,draw,sim)  = 100*hfmsD(ft,h,draw,sim)       / hfms1(ft,h,draw,sim) ;
vfmsPC(ft,v,draw,sim)$vfms1(ft,v,draw,sim)  = 100*vfmsD(ft,v,draw,sim)       / vfms1(ft,v,draw,sim) ;
zfmsPC(ft,draw,sim)$zfms1(ft,draw,sim)      = 100*zfmsD(ft,draw,sim)         / zfms1(ft,draw,sim) ;
vashPC(g,h,draw,sim)$vash1(g,h,draw,sim)    = 100*vashD(g,h,draw,sim)        / vash1(g,h,draw,sim) ;
trinPC(h,draw,sim)$trin1(h,draw,sim)        = 100*trinD(h,draw,sim)          / trin1(h,draw,sim) ;
troutPC(h,draw,sim)$trout1(h,draw,sim)      = 100*troutD(h,draw,sim)         / trout1(h,draw,sim) ;
savPC(h,draw,sim)$sav1(h,draw,sim)          = 100*savD(h,draw,sim)           / sav1(h,draw,sim) ;
exprocPC(h,draw,sim)$exproc1(h,draw,sim)    = 100*exprocD(h,draw,sim)        / exproc1(h,draw,sim) ;
hfsupPC(f,h,draw,sim)$hfsup1(f,h,draw,sim)  = 100*hfsupD(f,h,draw,sim)       / hfsup1(f,h,draw,sim) ;
fsupPC(f,draw,sim)$fsup1(f,draw,sim)        = 100*fsupD(f,draw,sim)          / fsup1(f,draw,sim) ;

prevPC(g,h,draw,sim)$prev1(g,h,draw,sim)    = 100*prevD(g,h,draw,sim)        / prev1(g,h,draw,sim) ;
pcostPC(g,h,draw,sim)$pcost1(g,h,draw,sim)  = 100*pcostD(g,h,draw,sim)       / pcost1(g,h,draw,sim) ;
pprofPC(g,h,draw,sim)$pprof1(g,h,draw,sim)  = 100*pprofD(g,h,draw,sim)       / pprof1(g,h,draw,sim) ;

fincPC(f,h,draw,sim)$finc1(f,h,draw,sim)    = 100*fincD(f,h,draw,sim)        / finc1(f,h,draw,sim) ;


display_pars(D)
display_pars(PC)




* B. MEANS AND STANDARD DEVIATIONS:
* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

abort$(card(draw) le 1) "ONE REPETITION ONLY - NO MEANS OR STDEVS TO COMPUTE";

* Macro to compute all the _mv parameters:
$macro mvfy(i) pv_mv&i(g,v,sim,"mean") = sum(draw, pv&i(g,v,draw,sim)) / card(draw) ; \
pv_mv&i(g,v,sim,"stdev") = sqrt(sum(draw, sqr(pv&i(g,v,draw,sim) - pv_mv&i(g,v,sim,"mean")))/(card(draw)-1)) ; \
pz_mv&i(g,sim,"mean") = sum(draw, pz&i(g,draw,sim)) / card(draw) ;                  \
pz_mv&i(g,sim,"stdev") = sqrt(sum(draw, sqr(pz&i(g,draw,sim) - pz_mv&i(g,sim,"mean")))/(card(draw)-1)) ;    \
ph_mv&i(g,h,sim,"mean") = sum(draw, ph&i(g,h,draw,sim)) / card(draw) ;                                                       \
ph_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(ph&i(g,h,draw,sim) - ph_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;               \
pva_mv&i(g,h,sim,"mean") = sum(draw, pva&i(g,h,draw,sim)) / card(draw) ;                                                     \
pva_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(pva&i(g,h,draw,sim) - pva_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;            \
qva_mv&i(g,h,sim,"mean") = sum(draw, qva&i(g,h,draw,sim)) / card(draw) ;                                                     \
qva_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(qva&i(g,h,draw,sim) - qva_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;            \
qp_mv&i(g,h,sim,"mean") = sum(draw, qp&i(g,h,draw,sim)) / card(draw) ;                                                       \
qp_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(qp&i(g,h,draw,sim) - qp_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;               \
tqp_mv&i(g,sim,"mean") = sum(draw, tqp&i(g,draw,sim)) / card(draw) ;                                                         \
tqp_mv&i(g,sim,"stdev") = sqrt(sum(draw, sqr(tqp&i(g,draw,sim) - tqp_mv&i(g,sim,"mean")))/(card(draw)-1)) ;                  \
ttqp_mv&i(sim,"mean") = sum(draw, ttqp&i(draw,sim)) / card(draw) ;                                                           \
ttqp_mv&i(sim,"stdev") = sqrt(sum(draw, sqr(ttqp&i(draw,sim) - ttqp_mv&i(sim,"mean")))/(card(draw)-1)) ;                     \
hqp_mv&i(h,sim,"mean") = sum(draw, hqp&i(h,draw,sim)) / card(draw) ;                                                         \
hqp_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(hqp&i(h,draw,sim) - hqp_mv&i(h,sim,"mean")))/(card(draw)-1)) ;                  \
fd_mv&i(g,f,h,sim,"mean") = sum(draw, fd&i(g,f,h,draw,sim)) / card(draw) ;                                                   \
fd_mv&i(g,f,h,sim,"stdev") = sqrt(sum(draw, sqr(fd&i(g,f,h,draw,sim) - fd_mv&i(g,f,h,sim,"mean")))/(card(draw)-1)) ;         \
id_mv&i(g,gg,h,sim,"mean") = sum(draw, id&i(g,gg,h,draw,sim)) / card(draw) ;                                                 \
id_mv&i(g,gg,h,sim,"stdev") = sqrt(sum(draw, sqr(id&i(g,gg,h,draw,sim) - id_mv&i(g,gg,h,sim,"mean")))/(card(draw)-1)) ;      \
pshift_mv&i(g,h,sim,"mean") = sum(draw, pshift&i(g,h,draw,sim)) / card(draw) ;                                               \
pshift_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(pshift&i(g,h,draw,sim) - pshift_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;   \
fshare_mv&i(g,f,h,sim,"mean") = sum(draw, fshare&i(g,f,h,draw,sim)) / card(draw) ;                                           \
fshare_mv&i(g,f,h,sim,"stdev") = sqrt(sum(draw, sqr(fshare&i(g,f,h,draw,sim) - fshare_mv&i(g,f,h,sim,"mean")))/(card(draw)-1)) ; \
r_mv&i(g,f,h,sim,"mean") = sum(draw, r&i(g,f,h,draw,sim)) / card(draw) ;                                                     \
r_mv&i(g,f,h,sim,"stdev") = sqrt(sum(draw, sqr(r&i(g,f,h,draw,sim) - r_mv&i(g,f,h,sim,"mean")))/(card(draw)-1)) ;            \
wv_mv&i(f,v,sim,"mean") = sum(draw, wv&i(f,v,draw,sim)) / card(draw) ;                                                       \
wv_mv&i(f,v,sim,"stdev") = sqrt(sum(draw, sqr(wv&i(f,v,draw,sim) - wv_mv&i(f,v,sim,"mean")))/(card(draw)-1)) ;               \
wz_mv&i(f,sim,"mean") = sum(draw, wz&i(f,draw,sim)) / card(draw) ;                                                           \
wz_mv&i(f,sim,"stdev") = sqrt(sum(draw, sqr(wz&i(f,draw,sim) - wz_mv&i(f,sim,"mean")))/(card(draw)-1)) ;                     \
vash_mv&i(g,h,sim,"mean") = sum(draw, vash&i(g,h,draw,sim)) / card(draw) ;                                                   \
vash_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(vash&i(g,h,draw,sim) - vash_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;         \
idsh_mv&i(g,gg,h,sim,"mean") = sum(draw, idsh&i(g,gg,h,draw,sim)) / card(draw) ;                                                   \
idsh_mv&i(g,gg,h,sim,"stdev") = sqrt(sum(draw, sqr(idsh&i(g,gg,h,draw,sim) - idsh_mv&i(g,gg,h,sim,"mean")))/(card(draw)-1)) ;         \
tidsh_mv&i(g,h,sim,"mean") = sum(draw, tidsh&i(g,h,draw,sim)) / card(draw) ;                                                   \
tidsh_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(tidsh&i(g,h,draw,sim) - tidsh_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;         \
qp_mv&i(g,h,sim,"mean") = sum(draw, qp&i(g,h,draw,sim)) / card(draw) ;                                                         \
qp_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(qp&i(g,h,draw,sim) - qp_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;                 \
fixfac_mv&i(g,f,h,sim,"mean") = sum(draw, fixfac&i(g,f,h,draw,sim)) / card(draw) ;                                             \
fixfac_mv&i(g,f,h,sim,"stdev") = sqrt(sum(draw, sqr(fixfac&i(g,f,h,draw,sim) - fixfac_mv&i(g,f,h,sim,"mean")))/(card(draw)-1)) ;   \
exinc_mv&i(h,sim,"mean") = sum(draw, exinc&i(h,draw,sim)) / card(draw) ;                                                       \
exinc_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(exinc&i(h,draw,sim) - exinc_mv&i(h,sim,"mean")))/(card(draw)-1)) ;           \
endow_mv&i(f,h,sim,"mean") = sum(draw, endow&i(f,h,draw,sim)) / card(draw) ;                                                \
endow_mv&i(f,h,sim,"stdev") = sqrt(sum(draw, sqr(endow&i(f,h,draw,sim) - endow_mv&i(f,h,sim,"mean")))/(card(draw)-1)) ;     \
qc_mv&i(g,h,sim,"mean") = sum(draw, qc&i(g,h,draw,sim)) / card(draw) ;                                                      \
qc_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(qc&i(g,h,draw,sim) - qc_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;              \
eshare_mv&i(g,h,sim,"mean") = sum(draw, eshare&i(g,h,draw,sim)) / card(draw) ;                                              \
eshare_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(eshare&i(g,h,draw,sim) - eshare_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;  \
y_mv&i(h,sim,"mean") = sum(draw, y&i(h,draw,sim)) / card(draw) ;                                                            \
y_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(y&i(h,draw,sim) - y_mv&i(h,sim,"mean")))/(card(draw)-1)) ;                       \
ty_mv&i(sim,"mean") = sum(draw, ty&i(draw,sim)) / card(draw) ;                                                            \
ty_mv&i(sim,"stdev") = sqrt(sum(draw, sqr(ty&i(draw,sim) - ty_mv&i(sim,"mean")))/(card(draw)-1)) ;                       \
mry_mv&i(sim,"mean") = sum(draw, mry&i(draw,sim)) / card(draw) ;                                                            \
mry_mv&i(sim,"stdev") = sqrt(sum(draw, sqr(mry&i(draw,sim) - mry_mv&i(sim,"mean")))/(card(draw)-1)) ;                       \
rytheil_mv&i(sim,"mean") = sum(draw, rytheil&i(draw,sim)) / card(draw) ;                                                     \
rytheil_mv&i(sim,"stdev") = sqrt(sum(draw, sqr(rytheil&i(draw,sim) - rytheil_mv&i(sim,"mean")))/(card(draw)-1)) ;           \
cpi_mv&i(h,sim,"mean") = sum(draw, cpi&i(h,draw,sim)) / card(draw) ;                                                        \
cpi_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(cpi&i(h,draw,sim) - cpi_mv&i(h,sim,"mean")))/(card(draw)-1)) ;                 \
vcpi_mv&i(v,sim,"mean") = sum(draw, vcpi&i(v,draw,sim)) / card(draw) ;                                                      \
vcpi_mv&i(v,sim,"stdev") = sqrt(sum(draw, sqr(vcpi&i(v,draw,sim) - vcpi_mv&i(v,sim,"mean")))/(card(draw)-1)) ;              \
cri_mv&i(v,f,sim,"mean") = sum(draw, cri&i(v,f,draw,sim)) / card(draw) ;                                                    \
cri_mv&i(v,f,sim,"stdev") = sqrt(sum(draw, sqr(cri&i(v,f,draw,sim) - cri_mv&i(v,f,sim,"mean")))/(card(draw)-1)) ;           \
ry_mv&i(h,sim,"mean") = sum(draw, ry&i(h,draw,sim)) / card(draw) ;                                                          \
ry_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(ry&i(h,draw,sim) - ry_mv&i(h,sim,"mean")))/(card(draw)-1)) ;                    \
try_mv&i(sim,"mean") = sum(draw, try&i(draw,sim)) / card(draw) ;                                                            \
try_mv&i(sim,"stdev") = sqrt(sum(draw, sqr(try&i(draw,sim) - try_mv&i(sim,"mean")))/(card(draw)-1)) ;                       \
emin_mv&i(g,h,sim,"mean") = sum(draw, emin&i(g,h,draw,sim)) / card(draw) ;                                                  \
emin_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(emin&i(g,h,draw,sim) - emin_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;        \
trin_mv&i(h,sim,"mean") = sum(draw, trin&i(h,draw,sim)) / card(draw) ;                                                      \
trin_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(trin&i(h,draw,sim) - trin_mv&i(h,sim,"mean")))/(card(draw)-1)) ;              \
trout_mv&i(h,sim,"mean") = sum(draw, trout&i(h,draw,sim)) / card(draw) ;                                                    \
trout_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(trout&i(h,draw,sim) - trout_mv&i(h,sim,"mean")))/(card(draw)-1)) ;           \
sav_mv&i(h,sim,"mean") = sum(draw, sav&i(h,draw,sim)) / card(draw) ;                                                        \
sav_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(sav&i(h,draw,sim) - sav_mv&i(h,sim,"mean")))/(card(draw)-1)) ;                 \
exproc_mv&i(h,sim,"mean") = sum(draw, exproc&i(h,draw,sim)) / card(draw) ;                                                  \
exproc_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(exproc&i(h,draw,sim) - exproc_mv&i(h,sim,"mean")))/(card(draw)-1)) ;        \
trinsh_mv&i(h,sim,"mean") = sum(draw, trinsh&i(h,draw,sim)) / card(draw) ;                                                  \
trinsh_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(trinsh&i(h,draw,sim) - trinsh_mv&i(h,sim,"mean")))/(card(draw)-1)) ;        \
troutsh_mv&i(h,sim,"mean") = sum(draw, troutsh&i(h,draw,sim)) / card(draw) ;                                                \
troutsh_mv&i(h,sim,"stdev") = sqrt(sum(draw, sqr(troutsh&i(h,draw,sim) - troutsh_mv&i(h,sim,"mean")))/(card(draw)-1)) ;     \
hfd_mv&i(f,h,sim,"mean") = sum(draw, hfd&i(f,h,draw,sim)) / card(draw) ;                                                    \
hfd_mv&i(f,h,sim,"stdev") = sqrt(sum(draw, sqr(hfd&i(f,h,draw,sim) - hfd_mv&i(f,h,sim,"mean")))/(card(draw)-1)) ;           \
vfd_mv&i(f,v,sim,"mean") = sum(draw, vfd&i(f,v,draw,sim)) / card(draw) ;                                                    \
vfd_mv&i(f,v,sim,"stdev") = sqrt(sum(draw, sqr(vfd&i(f,v,draw,sim) - vfd_mv&i(f,v,sim,"mean")))/(card(draw)-1)) ;           \
zfd_mv&i(f,sim,"mean") = sum(draw, zfd&i(f,draw,sim)) / card(draw) ;                                                        \
zfd_mv&i(f,sim,"stdev") = sqrt(sum(draw, sqr(zfd&i(f,draw,sim) - zfd_mv&i(f,sim,"mean")))/(card(draw)-1)) ;                 \
hms_mv&i(g,h,sim,"mean") = sum(draw, hms&i(g,h,draw,sim)) / card(draw) ;                                                    \
hms_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(hms&i(g,h,draw,sim) - hms_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;           \
vms_mv&i(g,v,sim,"mean") = sum(draw, vms&i(g,v,draw,sim)) / card(draw) ;                                                    \
vms_mv&i(g,v,sim,"stdev") = sqrt(sum(draw, sqr(vms&i(g,v,draw,sim) - vms_mv&i(g,v,sim,"mean")))/(card(draw)-1)) ;           \
zms_mv&i(g,sim,"mean") = sum(draw, zms&i(g,draw,sim)) / card(draw) ;                                                        \
zms_mv&i(g,sim,"stdev") = sqrt(sum(draw, sqr(zms&i(g,draw,sim) - zms_mv&i(g,sim,"mean")))/(card(draw)-1)) ;                 \
hfms_mv&i(f,h,sim,"mean") = sum(draw, hfms&i(f,h,draw,sim)) / card(draw) ;                                                  \
hfms_mv&i(f,h,sim,"stdev") = sqrt(sum(draw, sqr(hfms&i(f,h,draw,sim) - hfms_mv&i(f,h,sim,"mean")))/(card(draw)-1)) ;        \
vfms_mv&i(f,v,sim,"mean") = sum(draw, vfms&i(f,v,draw,sim)) / card(draw) ;                                                  \
vfms_mv&i(f,v,sim,"stdev") = sqrt(sum(draw, sqr(vfms&i(f,v,draw,sim) - vfms_mv&i(f,v,sim,"mean")))/(card(draw)-1)) ;        \
zfms_mv&i(f,sim,"mean")          = sum(draw, zfms&i(f,draw,sim)) / card(draw) ;                                                      \
zfms_mv&i(f,sim,"stdev")         = sqrt(sum(draw, sqr(zfms&i(f,draw,sim) - zfms_mv&i(f,sim,"mean")))/(card(draw)-1)) ;              \
hfsup_mv&i(f,h,sim,"mean")       = sum(draw, hfsup&i(f,h,draw,sim)) / card(draw) ;                                                  \
hfsup_mv&i(f,h,sim,"stdev")      = sqrt(sum(draw, sqr(hfsup&i(f,h,draw,sim) - hfsup_mv&i(f,h,sim,"mean")))/(card(draw)-1)) ;        \
fsup_mv&i(f,sim,"mean")          = sum(draw, fsup&i(f,draw,sim)) / card(draw) ;                                                  \
fsup_mv&i(f,sim,"stdev")         = sqrt(sum(draw, sqr(fsup&i(f,draw,sim) - fsup_mv&i(f,sim,"mean")))/(card(draw)-1)) ;        \
prev_mv&i(g,h,sim,"mean")        = sum(draw, prev&i(g,h,draw,sim)) / card(draw)  ;     \
pcost_mv&i(g,h,sim,"mean")       = sum(draw, pcost&i(g,h,draw,sim)) /card(draw) ;       \
pprof_mv&i(g,h,sim,"mean")       = sum(draw, pprof&i(g,h,draw,sim)) / card(draw);   \
finc_mv&i(f,h,sim,"mean")        = sum(draw, finc&i(f,h,draw,sim)) / card(draw) ; \
prev_mv&i(g,h,sim,"stdev")        = sqrt(sum(draw, sqr(prev&i(g,h,draw,sim) - prev_mv&i(g,h,sim,"mean")))/(card(draw)-1))  ;     \
pcost_mv&i(g,h,sim,"stdev")       = sqrt(sum(draw, sqr(pcost&i(g,h,draw,sim) - pcost_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;       \
pprof_mv&i(g,h,sim,"stdev")       = sqrt(sum(draw, sqr(pprof&i(g,h,draw,sim) - pprof_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;   \
finc_mv&i(f,h,sim,"stdev")        = sqrt(sum(draw, sqr(finc&i(f,h,draw,sim) - finc_mv&i(f,h,sim,"mean")))/(card(draw)-1)) ;   \

;

mvfy(1) ;
mvfy(2) ;
mvfy(D) ;
mvfy(PC) ;
display pv_mv1, pz_mv2 , zfms_mv2;
display_pars(_mv1) ;
display_pars(_mv2) ;
display_pars(_mvD) ;
display_pars(_mvPC) ;

* there were not defined for 2, D and PC so they can't be in the generic macro:
*idsh_mv&i(g,gg,h,sim,"mean") = sum(draw, idsh&i(g,gg,h,draw,sim)) / card(draw) ;                                               \
*idsh_mv&i(g,gg,h,sim,"stdev") = sqrt(sum(draw, sqr(idsh&i(g,gg,h,draw,sim) - idsh_mv&i(g,gg,h,sim,"mean")))/(card(draw)-1)) ;  \
*tidsh_mv&i(g,h,sim,"mean") = sum(draw, tidsh&i(g,h,draw,sim)) / card(draw) ;                                                   \
*tidsh_mv&i(g,h,sim,"stdev") = sqrt(sum(draw, sqr(tidsh&i(g,h,draw,sim) - tidsh_mv&i(g,h,sim,"mean")))/(card(draw)-1)) ;        \



* C. WELFARE AND EFFICIENCY:
* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
parameters
         benefdum(h,sim)   1 if hh is a beneficiary in this sim
         simval(sim)       value of land transfer in the sim
         benefryD(sim,mv)  the ryD of the beneficiary
         nbenefryD(sim,mv) sum of ryD for non-beneficiaries
         mult(sim,mv)      total benefits divided by simval
         meaninc(sim,mv)   mean income
         theil(sim,mv)     theil index

;
benefdum(h,sim)$sum((g,f),fsim(g,f,h,sim)) = 1 ;
simval(sim)= sum((g,f,h),fsim(g,f,h,sim)) ;
benefryD(sim,"mean") = sum(h$(benefdum(h,sim)), ry_mvD(h,sim,"mean")) ;
nbenefryD(sim,"mean") = sum(h$(not benefdum(h,sim)), ry_mvD(h,sim,"mean")) ;
mult(sim,"mean") = (benefryD(sim,"mean") + nbenefryD(sim,"mean")) / simval(sim) ;
display benefdum, benefryD, nbenefryD, simval, mult ;






* D. MEANS AND STANDARD DEVIATIONS AFTER REMOVING FREAK OUTCOMES (IF ANY)
* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
* Define freaks as those where distance from mean is more than 15 times
* identify freak outcome using total income:
parameter freaksim(draw,sim) identifies freak simulations
          freakdraw(draw)        identifiea freak draws
          tryD_dist(draw,sim) distance from mean for total real income
          numfreaks;
tryD_dist(draw,sim)$try_mvD(sim,"mean") = abs(tryD(draw,sim)- try_mvD(sim,"mean"))/try_mvD(sim,"mean") ;
freaksim(draw,sim)$(tryD_dist(draw,sim)>15) = 1  ;
freakdraw(draw) = sum(sim, freaksim(draw,sim)) ;
numfreaks = card(freakdraw) ;

display tryD_dist, freaksim, freakdraw, numfreaks ;



abort$(card(draw) le 1) "ONE REPETITION ONLY - NO MEANS OR STDEVS TO COMPUTE";

* Macro to compute all the _mv parameters:
* "c" stands for "corrected"
$macro mvfyc(i) pv_mvc&i(g,v,sim,"mean") = sum(draw$(not freakdraw(draw)), pv&i(g,v,draw,sim)) / (card(draw)-numfreaks) ; \
pv_mvc&i(g,v,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(pv&i(g,v,draw,sim) - pv_mvc&i(g,v,sim,"mean")))/(card(draw) - numfreaks-1)) ; \
pz_mvc&i(g,sim,"mean") = sum(draw$(not freakdraw(draw)), pz&i(g,draw,sim)) / (card(draw) - numfreaks) ;                  \
pz_mvc&i(g,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(pz&i(g,draw,sim) - pz_mvc&i(g,sim,"mean")))/(card(draw) - numfreaks-1)) ;    \
ph_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), ph&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                       \
ph_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(ph&i(g,h,draw,sim) - ph_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;               \
pva_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), pva&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                     \
pva_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(pva&i(g,h,draw,sim) - pva_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;            \
qva_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), qva&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                     \
qva_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(qva&i(g,h,draw,sim) - qva_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;            \
qp_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), qp&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                       \
qp_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(qp&i(g,h,draw,sim) - qp_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;               \
tqp_mvc&i(g,sim,"mean") = sum(draw$(not freakdraw(draw)), tqp&i(g,draw,sim)) / (card(draw) - numfreaks) ;                                                         \
tqp_mvc&i(g,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(tqp&i(g,draw,sim) - tqp_mvc&i(g,sim,"mean")))/(card(draw) - numfreaks-1)) ;                  \
ttqp_mvc&i(sim,"mean") = sum(draw$(not freakdraw(draw)), ttqp&i(draw,sim)) / (card(draw) - numfreaks) ;                                                           \
ttqp_mvc&i(sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(ttqp&i(draw,sim) - ttqp_mvc&i(sim,"mean")))/(card(draw) - numfreaks-1)) ;                     \
hqp_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), hqp&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                         \
hqp_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(hqp&i(h,draw,sim) - hqp_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;                  \
fd_mvc&i(g,f,h,sim,"mean") = sum(draw$(not freakdraw(draw)), fd&i(g,f,h,draw,sim)) / (card(draw) - numfreaks) ;                                                   \
fd_mvc&i(g,f,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(fd&i(g,f,h,draw,sim) - fd_mvc&i(g,f,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;         \
id_mvc&i(g,gg,h,sim,"mean") = sum(draw$(not freakdraw(draw)), id&i(g,gg,h,draw,sim)) / (card(draw) - numfreaks) ;                                                 \
id_mvc&i(g,gg,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(id&i(g,gg,h,draw,sim) - id_mvc&i(g,gg,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;      \
pshift_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), pshift&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                               \
pshift_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(pshift&i(g,h,draw,sim) - pshift_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;   \
fshare_mvc&i(g,f,h,sim,"mean") = sum(draw$(not freakdraw(draw)), fshare&i(g,f,h,draw,sim)) / (card(draw) - numfreaks) ;                                           \
fshare_mvc&i(g,f,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(fshare&i(g,f,h,draw,sim) - fshare_mvc&i(g,f,h,sim,"mean")))/(card(draw) - numfreaks-1)) ; \
r_mvc&i(g,f,h,sim,"mean") = sum(draw$(not freakdraw(draw)), r&i(g,f,h,draw,sim)) / (card(draw) - numfreaks) ;                                                     \
r_mvc&i(g,f,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(r&i(g,f,h,draw,sim) - r_mvc&i(g,f,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;            \
wv_mvc&i(f,v,sim,"mean") = sum(draw$(not freakdraw(draw)), wv&i(f,v,draw,sim)) / (card(draw) - numfreaks) ;                                                       \
wv_mvc&i(f,v,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(wv&i(f,v,draw,sim) - wv_mvc&i(f,v,sim,"mean")))/(card(draw) - numfreaks-1)) ;               \
wz_mvc&i(f,sim,"mean") = sum(draw$(not freakdraw(draw)), wz&i(f,draw,sim)) / (card(draw) - numfreaks) ;                                                           \
wz_mvc&i(f,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(wz&i(f,draw,sim) - wz_mvc&i(f,sim,"mean")))/(card(draw) - numfreaks-1)) ;                     \
vash_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), vash&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                   \
vash_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(vash&i(g,h,draw,sim) - vash_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;         \
idsh_mvc&i(g,gg,h,sim,"mean") = sum(draw$(not freakdraw(draw)), idsh&i(g,gg,h,draw,sim)) / (card(draw) - numfreaks) ;                                                   \
idsh_mvc&i(g,gg,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(idsh&i(g,gg,h,draw,sim) - idsh_mvc&i(g,gg,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;         \
tidsh_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), tidsh&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                   \
tidsh_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(tidsh&i(g,h,draw,sim) - tidsh_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;         \
qp_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), qp&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                         \
qp_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(qp&i(g,h,draw,sim) - qp_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;                 \
fixfac_mvc&i(g,f,h,sim,"mean") = sum(draw$(not freakdraw(draw)), fixfac&i(g,f,h,draw,sim)) / (card(draw) - numfreaks) ;                                             \
fixfac_mvc&i(g,f,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(fixfac&i(g,f,h,draw,sim) - fixfac_mvc&i(g,f,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;   \
exinc_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), exinc&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                       \
exinc_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(exinc&i(h,draw,sim) - exinc_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;           \
endow_mvc&i(f,h,sim,"mean") = sum(draw$(not freakdraw(draw)), endow&i(f,h,draw,sim)) / (card(draw) - numfreaks) ;                                                \
endow_mvc&i(f,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(endow&i(f,h,draw,sim) - endow_mvc&i(f,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;     \
qc_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), qc&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                      \
qc_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(qc&i(g,h,draw,sim) - qc_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;              \
eshare_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), eshare&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                              \
eshare_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(eshare&i(g,h,draw,sim) - eshare_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;  \
y_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), y&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                            \
y_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(y&i(h,draw,sim) - y_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;                       \
ty_mvc&i(sim,"mean") = sum(draw$(not freakdraw(draw)), ty&i(draw,sim)) / (card(draw) - numfreaks) ;                                                            \
ty_mvc&i(sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(ty&i(draw,sim) - ty_mvc&i(sim,"mean")))/(card(draw) - numfreaks-1)) ;                       \
mry_mvc&i(sim,"mean") = sum(draw$(not freakdraw(draw)), mry&i(draw,sim)) / (card(draw) - numfreaks) ;                                                            \
mry_mvc&i(sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(mry&i(draw,sim) - mry_mvc&i(sim,"mean")))/(card(draw) - numfreaks-1)) ;                       \
rytheil_mvc&i(sim,"mean") = sum(draw$(not freakdraw(draw)), rytheil&i(draw,sim)) / (card(draw) - numfreaks) ;                                                     \
rytheil_mvc&i(sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(rytheil&i(draw,sim) - rytheil_mvc&i(sim,"mean")))/(card(draw) - numfreaks-1)) ;           \
cpi_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), cpi&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                        \
cpi_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(cpi&i(h,draw,sim) - cpi_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;                 \
vcpi_mvc&i(v,sim,"mean") = sum(draw$(not freakdraw(draw)), vcpi&i(v,draw,sim)) / (card(draw) - numfreaks) ;                                                      \
vcpi_mvc&i(v,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(vcpi&i(v,draw,sim) - vcpi_mvc&i(v,sim,"mean")))/(card(draw) - numfreaks-1)) ;              \
cri_mvc&i(v,f,sim,"mean") = sum(draw$(not freakdraw(draw)), cri&i(v,f,draw,sim)) / (card(draw) - numfreaks) ;                                                    \
cri_mvc&i(v,f,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(cri&i(v,f,draw,sim) - cri_mvc&i(v,f,sim,"mean")))/(card(draw) - numfreaks-1)) ;           \
ry_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), ry&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                          \
ry_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(ry&i(h,draw,sim) - ry_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;                    \
try_mvc&i(sim,"mean") = sum(draw$(not freakdraw(draw)), try&i(draw,sim)) / (card(draw) - numfreaks) ;                                                            \
try_mvc&i(sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(try&i(draw,sim) - try_mvc&i(sim,"mean")))/(card(draw) - numfreaks-1)) ;                       \
emin_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), emin&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                  \
emin_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(emin&i(g,h,draw,sim) - emin_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;        \
trin_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), trin&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                      \
trin_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(trin&i(h,draw,sim) - trin_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;              \
trout_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), trout&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                    \
trout_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(trout&i(h,draw,sim) - trout_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;           \
sav_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), sav&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                        \
sav_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(sav&i(h,draw,sim) - sav_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;                 \
exproc_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), exproc&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                  \
exproc_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(exproc&i(h,draw,sim) - exproc_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;        \
trinsh_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), trinsh&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                  \
trinsh_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(trinsh&i(h,draw,sim) - trinsh_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;        \
troutsh_mvc&i(h,sim,"mean") = sum(draw$(not freakdraw(draw)), troutsh&i(h,draw,sim)) / (card(draw) - numfreaks) ;                                                \
troutsh_mvc&i(h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(troutsh&i(h,draw,sim) - troutsh_mvc&i(h,sim,"mean")))/(card(draw) - numfreaks-1)) ;     \
hfd_mvc&i(f,h,sim,"mean") = sum(draw$(not freakdraw(draw)), hfd&i(f,h,draw,sim)) / (card(draw) - numfreaks) ;                                                    \
hfd_mvc&i(f,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(hfd&i(f,h,draw,sim) - hfd_mvc&i(f,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;           \
vfd_mvc&i(f,v,sim,"mean") = sum(draw$(not freakdraw(draw)), vfd&i(f,v,draw,sim)) / (card(draw) - numfreaks) ;                                                    \
vfd_mvc&i(f,v,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(vfd&i(f,v,draw,sim) - vfd_mvc&i(f,v,sim,"mean")))/(card(draw) - numfreaks-1)) ;           \
zfd_mvc&i(f,sim,"mean") = sum(draw$(not freakdraw(draw)), zfd&i(f,draw,sim)) / (card(draw) - numfreaks) ;                                                        \
zfd_mvc&i(f,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(zfd&i(f,draw,sim) - zfd_mvc&i(f,sim,"mean")))/(card(draw) - numfreaks-1)) ;                 \
hms_mvc&i(g,h,sim,"mean") = sum(draw$(not freakdraw(draw)), hms&i(g,h,draw,sim)) / (card(draw) - numfreaks) ;                                                    \
hms_mvc&i(g,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(hms&i(g,h,draw,sim) - hms_mvc&i(g,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;           \
vms_mvc&i(g,v,sim,"mean") = sum(draw$(not freakdraw(draw)), vms&i(g,v,draw,sim)) / (card(draw) - numfreaks) ;                                                    \
vms_mvc&i(g,v,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(vms&i(g,v,draw,sim) - vms_mvc&i(g,v,sim,"mean")))/(card(draw) - numfreaks-1)) ;           \
zms_mvc&i(g,sim,"mean") = sum(draw$(not freakdraw(draw)), zms&i(g,draw,sim)) / (card(draw) - numfreaks) ;                                                        \
zms_mvc&i(g,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(zms&i(g,draw,sim) - zms_mvc&i(g,sim,"mean")))/(card(draw) - numfreaks-1)) ;                 \
hfms_mvc&i(f,h,sim,"mean") = sum(draw$(not freakdraw(draw)), hfms&i(f,h,draw,sim)) / (card(draw) - numfreaks) ;                                                  \
hfms_mvc&i(f,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(hfms&i(f,h,draw,sim) - hfms_mvc&i(f,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;        \
vfms_mvc&i(f,v,sim,"mean") = sum(draw$(not freakdraw(draw)), vfms&i(f,v,draw,sim)) / (card(draw) - numfreaks) ;                                                  \
vfms_mvc&i(f,v,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(vfms&i(f,v,draw,sim) - vfms_mvc&i(f,v,sim,"mean")))/(card(draw) - numfreaks-1)) ;        \
zfms_mvc&i(f,sim,"mean") = sum(draw$(not freakdraw(draw)), zfms&i(f,draw,sim)) / (card(draw) - numfreaks) ;                                                      \
zfms_mvc&i(f,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(zfms&i(f,draw,sim) - zfms_mvc&i(f,sim,"mean")))/(card(draw) - numfreaks-1)) ;              \
hfsup_mvc&i(f,h,sim,"mean") = sum(draw$(not freakdraw(draw)), hfsup&i(f,h,draw,sim)) / (card(draw) - numfreaks) ;                                                  \
hfsup_mvc&i(f,h,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(hfsup&i(f,h,draw,sim) - hfsup_mvc&i(f,h,sim,"mean")))/(card(draw) - numfreaks-1)) ;        \
fsup_mvc&i(f,sim,"mean") = sum(draw$(not freakdraw(draw)), fsup&i(f,draw,sim)) / (card(draw) - numfreaks) ;                                                  \
fsup_mvc&i(f,sim,"stdev") = sqrt(sum(draw$(not freakdraw(draw)), sqr(fsup&i(f,draw,sim) - fsup_mvc&i(f,sim,"mean")))/(card(draw) - numfreaks-1)) ;        \
prev_mvc&i(g,h,sim,"mean")        = sum(draw$(not freakdraw(draw)), prev&i(g,h,draw,sim)) / (card(draw) - numfreaks)  ;     \
pcost_mvc&i(g,h,sim,"mean")       = sum(draw$(not freakdraw(draw)), pcost&i(g,h,draw,sim)) /(card(draw) - numfreaks) ;       \
pprof_mvc&i(g,h,sim,"mean")       = sum(draw$(not freakdraw(draw)), pprof&i(g,h,draw,sim)) / (card(draw) - numfreaks);   \
finc_mvc&i(f,h,sim,"mean")        = sum(draw$(not freakdraw(draw)), finc&i(f,h,draw,sim)) / (card(draw) - numfreaks);    \
prev_mvc&i(g,h,sim,"stdev")        = sqrt(sum(draw$(not freakdraw(draw)), sqr(prev&i(g,h,draw,sim) - prev_mvc&i(g,h,sim,"mean")))/(card(draw)- numfreaks-1))  ;     \
pcost_mvc&i(g,h,sim,"stdev")       = sqrt(sum(draw$(not freakdraw(draw)), sqr(pcost&i(g,h,draw,sim) - pcost_mvc&i(g,h,sim,"mean")))/(card(draw)- numfreaks-1)) ;       \
pprof_mvc&i(g,h,sim,"stdev")       = sqrt(sum(draw$(not freakdraw(draw)), sqr(pprof&i(g,h,draw,sim) - pprof_mvc&i(g,h,sim,"mean")))/(card(draw)- numfreaks-1)) ;   \
finc_mvc&i(f,h,sim,"stdev")        = sqrt(sum(draw$(not freakdraw(draw)), sqr(finc&i(f,h,draw,sim) - finc_mv&i(f,h,sim,"mean")))/(card(draw)- numfreaks-1)) ;   \
;

mvfyc(1) ;
mvfyc(2) ;
mvfyc(D) ;
mvfyc(PC) ;
display pv_mvc1, pz_mvc2 , zfms_mvc2;
display_pars(_mvc1) ;
display_pars(_mvc2) ;
display_pars(_mvcD) ;
display_pars(_mvcPC) ;


* C. WELFARE AND EFFICIENCY - corrected:
* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
parameters
         benefrycD(sim,mv)  the ryD of the beneficiary
         nbenefrycD(sim,mv) sum of ryD for non-beneficiaries
         multc(sim,mv)      total benefits divided by simval
;
benefrycD(sim,"mean") = sum(h$(benefdum(h,sim)), ry_mvcD(h,sim,"mean")) ;
nbenefrycD(sim,"mean") = sum(h$(not benefdum(h,sim)), ry_mvcD(h,sim,"mean")) ;
multc(sim,"mean") = (benefrycD(sim,"mean") + nbenefrycD(sim,"mean")) / simval(sim) ;
display benefrycD, nbenefrycD, multc ;
