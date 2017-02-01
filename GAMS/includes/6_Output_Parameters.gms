

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
zfms_mv&i(f,sim,"mean") = sum(draw, zfms&i(f,draw,sim)) / card(draw) ;                                                      \
zfms_mv&i(f,sim,"stdev") = sqrt(sum(draw, sqr(zfms&i(f,draw,sim) - zfms_mv&i(f,sim,"mean")))/(card(draw)-1)) ;              \
hfsup_mv&i(f,h,sim,"mean") = sum(draw, hfsup&i(f,h,draw,sim)) / card(draw) ;                                                  \
hfsup_mv&i(f,h,sim,"stdev") = sqrt(sum(draw, sqr(hfsup&i(f,h,draw,sim) - hfsup_mv&i(f,h,sim,"mean")))/(card(draw)-1)) ;        \
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




* Welfare and efficiency
parameter cvh(h,draw,sim)   compensating variation per household
          cvh_perc(h,draw,sim) cv ac a percentage of initial income
          cv(draw,sim)   compensating variation across all households
          cv_perc(draw,sim) compensating variation as a percentage of income
          ymult(draw,sim)   nominal income multiplier
          ymult_h(h,draw,sim) nominal income muliplier on each hh that receive a transfer
          ytotmult_h(h,draw,sim) nominal income muliplier divided by total transfer
          ymult_treat(draw,sim) nominal income muliplier on all hh that received a transfer
          ymult_vil(v,draw,sim) nominal income muliplier on a village
          ymult_all(draw,sim) nominal income muliplier on hh A B C amd D

          rymult(draw,sim)   real income multiplier
          rymult_h(h,draw,sim) real income muliplier on each hh that receive a transfer
          rytotmult_h(h,draw,sim) real income muliplier divided by total transfer
          rymult_treat(draw,sim) real income muliplier on all hh that received a transfer
          rymult_vil(v,draw,sim) real income muliplier on a village
          rymult_all(draw,sim) real income muliplier on hh A B C amd D

          cvmult(draw,sim)  cv multiplier
          prodmult_h(g,h,draw,sim) production multiplier (value of extra g output per dollar of transfer to h)
          prodTotmult_h(g,h,draw,sim) production multiplier (value of extra g output per dollar of total transfer)
          prodmult_treat(g,draw,sim) production muliplier on all hh that received a transfer
          prodmult_ntreat(g,draw,sim) production muliplier on all hh that received a transfer
          prodmult_vil(g,v,draw,sim) production multiplier for the village
          prodmult_all(g,draw,sim)     total production multiplier
          tprodmult_all(draw,sim) total total production multiplier

          ttprodmult(draw,sim)         total multiplier on ttqp
          hprodmult(h,draw,sim)        total household production multiplier

          prodVmult_h(g,h,draw,sim) production multiplier (value of extra g output per dollar of transfer)
          prodVmult_treat(g,draw,sim) production muliplier on all hh that received a transfer
          prodVmult_ntreat(g,draw,sim) production muliplier on all hh that received a transfer
          prodVmult_vil(g,v,draw,sim) production multiplier for the village
          prodVmult_all(g,draw,sim)     total production multiplier

          ykmult_h(h,draw,sim) multiplier of the program + the capital influx
          rykmult_h(h,draw,sim) multiplier of the program + the capital influx
          ykTotmult_h(h,draw,sim) multiplier of the program + the capital influx
          rykTotmult_h(h,draw,sim) multiplier of the program + the capital influx
          ykmult_all(draw,sim) multiplier of the program + the capital influx
          rykmult_all(draw,sim) multiplier of the program + the capital influx
          denom(h,draw,sim) denominator for the multipliers (wfp spending)
;

* If the denominator is the total value of the wfp cost
*denom(h,draw,sim) = infood(h) ;
*denom(h,draw,sim) = wfpcost(h);
* with or without new remittances:
*denom(h,draw,sim) = infood(h)+newremits ;
* If its the value net of the t-cost loss (when some of the infood is sold)
denom(h,draw,sim) = transfer(h);
* If its the value net of the t-cost loss (when some of the infood is sold)
* with the new remittances counted as well...
*denom(h,draw,sim) = transfer(h)+newremits(h);

$ontext

cvh(h,draw,sim) = y2(h,draw,sim) - prod(g, (ph2(g,h,draw,sim)/ph1(g,h,draw,sim))**eshare_dr(g,h,draw))*y1(h,draw,sim);
cvh_perc(h,draw,sim) = 100*cvh(h,draw,sim)/y1(h,draw,sim);
cv(draw,sim) = sum(h,cvh(h,draw,sim));
cv_perc(draw,sim) = cv(draw,sim)/sum(h,y1(h,draw,sim));
ymult(draw,sim) = sum(h,yD(h,draw,sim)) / sum(h,denom(h,draw,sim)) ;
cvmult(draw,sim) = cv(draw,sim) / sum(h,denom(h,draw,sim)) ;

ymult_h(h,draw,sim)$transfer(h) = yD(h,draw,sim) / denom(h,draw,sim) ;
ytotmult_h(h,draw,sim) = yD(h,draw,sim) /sum(hh, denom(hh,draw,sim)) ;
ymult_treat(draw,sim)  = sum(h$transfer(h),yD(h,draw,sim)) / sum(h, denom(h,draw,sim)) ;
ymult_vil(v,draw,sim)$sum(hh$maphv(hh,v),denom(hh,draw,sim))  = sum(h$maphv(h,v),yD(h,draw,sim)) / sum(hh$maphv(hh,v),denom(hh,draw,sim))  ;
ymult_all(draw,sim)$sum(h,denom(h,draw,sim))  = sum(h,yD(h,draw,sim)) / sum(h,denom(h,draw,sim)) ;

rymult_h(h,draw,sim)$transfer(h) = ryD(h,draw,sim) / denom(h,draw,sim) ;
rytotmult_h(h,draw,sim) = ryD(h,draw,sim) /sum(hh, denom(hh,draw,sim)) ;
rymult_treat(draw,sim)  = sum(h$transfer(h),ryD(h,draw,sim)) / sum(h, denom(h,draw,sim)) ;
rymult_vil(v,draw,sim)$sum(hh$maphv(hh,v),denom(hh,draw,sim))  = sum(h$maphv(h,v),ryD(h,draw,sim)) / sum(hh$maphv(hh,v),denom(hh,draw,sim))  ;
rymult_all(draw,sim)$sum(h,denom(h,draw,sim))  = sum(h,ryD(h,draw,sim)) / sum(h,denom(h,draw,sim)) ;

prodmult_h(g,h,draw,sim)$transfer(h) = qpD(g,h,draw,sim) / denom(h,draw,sim) ;
prodTotmult_h(g,h,draw,sim) = qpD(g,h,draw,sim) / sum(hh,denom(hh,draw,sim)) ;
prodmult_treat(g,draw,sim)  = sum(h$denom(h,draw,sim),qpD(g,h,draw,sim)) / sum(h, denom(h,draw,sim)) ;
prodmult_ntreat(g,draw,sim)  = sum(h$(not denom(h,draw,sim)),qpD(g,h,draw,sim)) / sum(h, denom(h,draw,sim)) ;
prodmult_vil(g,v,draw,sim)$sum(hh$maphv(hh,v),denom(hh,draw,sim))  = sum(h$maphv(h,v),qpD(g,h,draw,sim)) / sum(hh$maphv(hh,v),denom(hh,draw,sim))  ;
prodmult_all(g,draw,sim)$sum(h,denom(h,draw,sim))  = sum(h,qpD(g,h,draw,sim)) / sum(h,denom(h,draw,sim)) ;

tprodmult_all(draw,sim)=sum(g,prodmult_all(g,draw,sim));

ttprodmult(draw,sim)$sum(h,denom(h,draw,sim))  = ttqpD(draw,sim) / sum(h,denom(h,draw,sim)) ;
hprodmult(h,draw,sim)$sum(hh,denom(hh,draw,sim))  = hqpD(h,draw,sim) / sum(hh,denom(hh,draw,sim)) ;

prodVmult_h(g,h,draw,sim)$denom(h,draw,sim) = (ph2(g,h,draw,sim)*qpD(g,h,draw,sim)) / denom(h,draw,sim) ;
prodVmult_treat(g,draw,sim)  = sum(h$denom(h,draw,sim),(ph2(g,h,draw,sim)*qpD(g,h,draw,sim))) / sum(h, denom(h,draw,sim)) ;
prodVmult_ntreat(g,draw,sim)  = sum(h$(not denom(h,draw,sim)),(ph2(g,h,draw,sim)*qpD(g,h,draw,sim))) / sum(h, denom(h,draw,sim)) ;
prodVmult_vil(g,v,draw,sim)$sum(hh$maphv(hh,v),denom(hh,draw,sim))  = sum(h$maphv(h,v),(ph2(g,h,draw,sim)*qpD(g,h,draw,sim))) / sum(hh$maphv(hh,v),denom(hh,draw,sim))  ;
prodVmult_all(g,draw,sim)$sum(h,denom(h,draw,sim))  = sum(h,(ph2(g,h,draw,sim)*qpD(g,h,draw,sim))) / sum(h,denom(h,draw,sim)) ;


display cvh, cvh_perc, cv, cv_perc, ymult, cvmult, ymult_h, ytotmult_h, ymult_treat, ymult_vil, ymult_all,
     rymult_h, rytotmult_h, rymult_treat, rymult_vil, rymult_all,
     prodmult_h, prodTotmult_h, prodmult_treat, prodmult_ntreat, prodmult_vil, prodmult_all, tprodmult_all
     prodVmult_h, prodVmult_treat, prodVmult_ntreat, prodVmult_vil, prodVmult_all ;

ykmult_all(draw,sim)$(sum(h,denom(h,draw,sim))+sum((h,g,f),fixfacD(g,f,h,draw,sim))) = tyD(draw,sim)
 / (sum(h,denom(h,draw,sim))+sum((h,g,f),fixfacD(g,f,h,draw,sim))) ;
rykmult_all(draw,sim)$(sum(h,denom(h,draw,sim))+sum((h,g,f),fixfacD(g,f,h,draw,sim))) = tryD(draw,sim)
 / (sum(h,denom(h,draw,sim))+sum((h,g,f),fixfacD(g,f,h,draw,sim))) ;
display ymult_all, rymult_all, ykmult_all, rykmult_all ;

ykmult_h(h,draw,sim)$(denom(h,draw,sim)+sum((g,f),fixfacD(g,f,h,draw,sim))) = yD(h,draw,sim)
 / (denom(h,draw,sim)+sum((g,f),fixfacD(g,f,h,draw,sim))) ;
rykmult_h(h,draw,sim)$(denom(h,draw,sim)+sum((g,f),fixfacD(g,f,h,draw,sim))) = ryD(h,draw,sim)
 / (denom(h,draw,sim)+sum((g,f),fixfacD(g,f,h,draw,sim))) ;
ykTotmult_h(hh,draw,sim)$(sum(h,denom(h,draw,sim))+sum((h,g,f),fixfacD(g,f,h,draw,sim))) = yD(hh,draw,sim)
 / (sum(h,denom(h,draw,sim))+sum((h,g,f),fixfacD(g,f,h,draw,sim))) ;
rykTotmult_h(hh,draw,sim)$(sum(h,denom(h,draw,sim))+sum((h,g,f),fixfacD(g,f,h,draw,sim))) = ryD(hh,draw,sim)
 /(sum(h,denom(h,draw,sim))+sum((h,g,f),fixfacD(g,f,h,draw,sim))) ;
display ymult_h, rymult_h, ykmult_h, rykmult_h, yktotmult_h, ryktotmult_h ;


* Welfare and efficiency
parameter cvh_mv(h,sim,mv)   compensating variation per household
          cvh_perc_mv(h,sim,mv) cv ac a percentage of initial income
          cv_mv(sim,mv)   compensating variation across all households
          cv_perc_mv(sim,mv) compensating variation as a percentage of income
          ymult_mv(sim,mv)   nominal income multiplier
          cvmult_mv(sim,mv)  cv multiplier
          ymult_h_mv(h,sim,mv) nominal income multiplier by treatment household
          ytotmult_h_mv(h,sim,mv) nominal income multiplier by treatment household
          ymult_treat_mv(sim,mv) nominal income multiplier by treatment household
          ymult_vil_mv(v,sim,mv) nominal income multiplier by village
          ymult_all_mv(sim,mv) nominal income multiplier for all
          rymult_mv(sim,mv)   nominal income multiplier
          rymult_h_mv(h,sim,mv) nominal income multiplier bry treatment household
          rytotmult_h_mv(h,sim,mv) nominal income multiplier bry treatment household
          rymult_treat_mv(sim,mv) nominal income multiplier bry treatment household
          rymult_vil_mv(v,sim,mv) nominal income multiplier bry village
          rymult_all_mv(sim,mv) nominal income multiplier for all

          prodmult_h_mv(g,h,sim,mv) production multiplier by treatment household
          prodTotmult_h_mv(g,h,sim,mv) production multiplier by treatment household
          prodmult_treat_mv(g,sim,mv)  production multiplier by treatment household
          prodmult_ntreat_mv(g,sim,mv)  production multiplier by NON treatment household
          prodmult_vil_mv(g,v,sim,mv)  production multiplier by village
          prodmult_all_mv(g,sim,mv)  production multiplier for all
          tprodmult_all_mv(sim,mv)  total total production multiplier for all

          ttprodmult_mv(sim,mv)   production multiplier for ttqp
          hprodmult_mv(h,sim,mv)     production mutiplier for hqp

          ykmult_h_mv(h,sim,mv) multiplier of the program + the capital influx
          rykmult_h_mv(h,sim,mv) multiplier of the program + the capital influx
          ykTotmult_h_mv(h,sim,mv) multiplier of the program + the capital influx
          rykTotmult_h_mv(h,sim,mv) multiplier of the program + the capital influx
          ykmult_all_mv(sim,mv) multiplier of the program + the capital influx
          rykmult_all_mv(sim,mv) multiplier of the program + the capital influx
;
$offtext



$ontext
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



$offtext




* D. CONFIDENCE BOUNDS:
* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




$ontext

* Confidence bounds
* ===============================================
* Make a parameter for "increase in trade between zoi and rest of world"
parameter zoirowtradD_mv(sim,mv) change in trade between zoi and rest of world
          zoirowtradD(draw,sim) change in trade between zoi and rest of world;

zoirowtradD(draw,sim) = sum(h, exprocD(h,draw,sim)) + sum((v,gtw),abs(vmsD(gtw,v,draw,sim))) ;
zoirowtradD_mv(sim,"mean") = sum(draw, zoirowtradD(draw,sim)) / card(draw) ;
zoirowtradD_mv(sim,"stdev") = sqrt(sum(draw, sqr(zoirowtradD(draw,sim) - zoirowtradD_mv(sim,"mean")))/(card(draw)-1)) ;
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


Torank(draw) = zoirowtradD(draw) ;
ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
zoirowtradD_mv(lh) = ci2(lh) ;



loop(h,
     Torank(draw) = hprodmult(h,draw) ;
     ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
     hprodmult_mv(h,lh) = ci2(lh) ;
);
display hprodmult_mv;


$offtext
