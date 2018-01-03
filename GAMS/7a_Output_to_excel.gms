*set res Results for output
*/ ymv_o, rymv_o/

* Model parameters for report
Parameter
fshare_o(g,f,h)    factor shares in production functions mean
fsharesd_o(g,f,h)  factor shares in production functions stdev
eshare_o(g,h)      expenditure shares mean
esharesd_o(g,h)    expenditures shares stdev
idsh_o(g,gg,h)
idshsd_o(g,gg,h)
;

fshare_o(g,f,h)  = fshare_mv1(g,f,h,"sim1","mean") ;
fsharesd_o(g,f,h)= fshare_mv1(g,f,h,"sim1","stdev") ;
eshare_o(g,h)    = eshare_mv1(g,h,"sim1","mean") ;
esharesd_o(g,h)  = eshare_mv1(g,h,"sim1","stdev") ;
idsh_o(g,gg,h)   = idsh_mv1(g,gg,h,"sim1","mean") ;
idshsd_o(g,gg,h) = idsh_mv2(g,gg,h,"sim1","stdev") ;


display fshare_o, fsharesd_o, eshare_o, esharesd_o, idsh_o, idshsd_o ;

parameter effidsh(g,gfac,h,draw,sim) effective id share ;
effidsh(g,gfac,h,draw,sim)$qp1(g,h,draw,sim) = id1(g,gfac,h,draw,sim) / qp1(g,h,draw,sim);
display effidsh ;
$exit

* Result parameters:
Parameter
ty_o(sim)        total nominal income level change
try_o(*,sim)       total real income level change
*try_o5(sim)       total real income level change 5pct bound
*try_o95(sim)       total real income level change 95pct bound
ry_o(h,sim)      household real income level change
tqp_o(g,sim)     total quantity produced level change
tqpsd_o(g,sim)   total quantity produced standard dev
benefs_o(*,sim)  beneficiary and non-beneficiary returns
pv_o(g,sim)      percent change in prices
hlsup_o(h,sim)   labor supply level change
lsup_o(sim)      total labor supply level change
ndraws_o         number of draws (original)
nreps_o          number of repetitions (minus freak draws)

qpd_o(g,h,sim)     delta quantity produced by hh and crop
qpd_os(g,h,sim)    st dev of delta quantity produced by hh and crop
prevd_o(g,h,sim)   delta revenue from a production
pcostd_o(g,h,sim)  delta revenue from a production
pprofd_o(g,h,sim)  delta revenue from a production

fdD_o(h,g,f,mv,sim)  change in factor demand by factor hh and crop
idD_o(h,g,gfac,mv,sim)   change in intermediate demand by hh and crop
qpdsim1_o(g,mv,h)     delta qp but only in sim 1
;
* First display the parameters I want (the "c" indicates corrected for freak draws):
display tyPC, tryPC, tyD, tryD ;
display ty_mvcD, ty_mvcD, try_mvcD, try_mvcD, y_mvD, y_mvcD, tqp_mvD, tqp_mvcD ;
display qp_mvcD, fd_mvcD ;

ty_o(sim) = ty_mvcD(sim,"mean") ;
try_o("mean",sim) = try_mvcD(sim, "mean") ;
try_o("stdev",sim) = try_mvcD(sim, "stdev") ;
*try_o("pct5",sim) = try_mvD(sim, "pct5") ;
*try_o("pct95",sim) = try_mvD(sim, "pct95") ;
ry_o(h,sim) = ry_mvcD(h,sim,"mean") ;
tqp_o(g,sim) = 1E-13;
tqp_o(g,sim) = tqp_mvcD(g,sim,"mean") ;
tqpsd_o(g,sim) = 1E-13;
tqpsd_o(g,sim) = tqp_mvcD(g,sim,"stdev") ;
benefs_o("benef", sim) = benefrycD(sim,"mean") ;
benefs_o("non-benef", sim) = nbenefrycD(sim,"mean") ;
benefs_o("simval", sim) = simval(sim) ;
benefs_o("mult", sim) = multc(sim,"mean") ;
benefs_o("mincPC", sim) = mry_mvcPC(sim,"mean") ;
benefs_o("rytheilPC", sim) = rytheil_mvcPC(sim,"mean") ;
benefs_o("rytheilPCsd", sim) = rytheil_mvcPC(sim,"stdev") ;
ndraws_o  = card(draw);
nreps_o  = card(draw)-numfreaks ;

qpd_o(g,h,sim)           =  qp_mvcD(g,h,sim,"mean")    ;
qpd_os(g,h,sim)          =  qp_mvcD(g,h,sim,"stdev")    ;
prevd_o(g,h,sim)         =  prev_mvcD(g,h,sim,"mean") ;
pcostd_o(g,h,sim)        =  pcost_mvcD(g,h,sim,"mean") ;
pprofd_o(g,h,sim)        =  pprof_mvcD(g,h,sim,"mean") ;

qpdsim1_o(g,mv,h)        = qp_mvcD(g,h,"sim1",mv)  ;

fdD_o(h,g,f,mv,sim)      = fd_mvcD(g,f,h,sim,mv) ;
idD_o(h,g,gfac,mv,sim)   = id_mvcD(g,gfac,h,sim,mv) ;

*nbenef_o(sim) = nbenefryD(sim,"mean") ;
pv_o(g,sim) = 1E-13 ;
hlsup_o(h,sim) = hfsup_mvcD("labor",h,sim,"mean") ;
lsup_o(sim) = fsup_mvcD("labor",sim,"mean") ;


* Calculate share of income that come from each income activity:
parameter income_act(g,h,sim) income from a given source
          income_lab(h,sim)   income from labor
          all_revenue(h,sim)  income from all sources
          spill_inc(h,sim)    income from spillover for recipient household
          spill_share(h,sim)  income from spillover for recipient household ;
income_lab(h,sim)        = finc_mvcD("labor",h,sim,"mean") ;
income_act(g,h,sim)      = pprof_mvcD(g,h,sim,"mean") ;
all_revenue(h,sim)       = income_lab(h,sim) + sum(g, income_act(g,h,sim)) ;
spill_inc(h,sim)         = sum((g,f)$fsim(g,f,h,sim), income_act(g,h,sim))   ;
spill_share(h,sim)       = spill_inc(h,sim) / all_revenue(h,sim) ;

display income_lab, income_act, spill_inc, all_revenue, spill_share ;


display pv_o ;
pv_o(g,sim)$pv_mvcPC(g,"AQUA",sim,"mean") = pv_mvcPC(g,"AQUA",sim,"mean") ;



display ty_o, try_o, ry_o, tqp_o, tqpsd_o, benefs_o, pv_o, hlsup_o, lsup_o, nreps_o;
display qpd_o, qpd_os, prevd_o, pcostd_o, pprofd_o, fdD_o, idD_o ;
Display "this is the number of sims that had to be corrected", negfixfacnum ;


execute_unload "outxl.gdx" modstat ty_o try_o ry_o tqp_o tqpsd_o benefs_o pv_o hlsup_o lsup_o nreps_o fshare_o
               fsharesd_o, eshare_o, esharesd_o, idsh_o, idshsd_o,
               qpd_o, qpd_os, prevd_o, pcostd_o, pprofd_o , fdD_o, idD_o, qpdsim1_o;
* And this writes in an excel sheet called "MakeMeASam":
execute "xlstalk.exe -s   %output_xl_file%" ;
execute "gdxxrw.exe outxl.gdx  o=%output_xl_file% index=index!a2" ;
execute 'xlstalk.exe -O %output_xl_file%' ;




