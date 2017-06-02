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
idshsd_o(g,gg,h) = idsh_mv1(g,gg,h,"sim1","stdev") ;


display fshare_o, fsharesd_o, eshare_o, esharesd_o, idsh_o, idshsd_o ;




* Result parameters:
Parameter
ty_o(sim)        total nominal income level change
try_o(*,sim)       total real income level change
*try_o5(sim)       total real income level change 5pct bound
*try_o95(sim)       total real income level change 95pct bound
ry_o(h,sim)      household real income level change
tqp_o(g,sim)     total quantity produced level change
tqpsd_o(g,sim)     total quantity produced standard dev
benefs_o(*,sim)  beneficiary and non-beneficiary returns
pv_o(g,sim)      percent change in prices
hlsup_o(h,sim)   labor supply level change
lsup_o(sim)      total labor supply level change
nreps_o          number of repetitions
;
* First display the parameters I want:
display ty_mvD, try_mvD, y_mvD, tqp_mvD ;

ty_o(sim) = ty_mvD(sim,"mean") ;
try_o("mean",sim) = try_mvD(sim, "mean") ;
try_o("stdev",sim) = try_mvD(sim, "stdev") ;
*try_o("pct5",sim) = try_mvD(sim, "pct5") ;
*try_o("pct95",sim) = try_mvD(sim, "pct95") ;
ry_o(h,sim) = ry_mvD(h,sim,"mean") ;
tqp_o(g,sim) = 1E-13;
tqp_o(g,sim) = tqp_mvD(g,sim,"mean") ;
tqpsd_o(g,sim) = 1E-13;
tqpsd_o(g,sim) = tqp_mvD(g,sim,"stdev") ;
benefs_o("benef", sim) = benefryD(sim,"mean") ;
benefs_o("non-benef", sim) = nbenefryD(sim,"mean") ;
benefs_o("simval", sim) = simval(sim) ;
benefs_o("mult", sim) = mult(sim,"mean") ;
benefs_o("mincPC", sim) = mry_mvPC(sim,"mean") ;
benefs_o("rytheilPC", sim) = rytheil_mvPC(sim,"mean") ;
benefs_o("rytheilPCsd", sim) = rytheil_mvPC(sim,"stdev") ;
nreps_o  = card(draw) ;




*nbenef_o(sim) = nbenefryD(sim,"mean") ;
pv_o(g,sim) = 1E-13 ;
hlsup_o(h,sim) = hfsup_mvD("labor",h,sim,"mean") ;
lsup_o(sim) = fsup_mvD("labor",sim,"mean") ;

display pv_o ;
pv_o(g,sim)$pv_mvPC(g,"AQUA",sim,"mean") = pv_mvPC(g,"AQUA",sim,"mean") ;



display ty_o, try_o, ry_o, tqp_o, tqpsd_o, benefs_o, pv_o, hlsup_o, lsup_o, nreps_o;


execute_unload "outxl.gdx" modstat ty_o try_o ry_o tqp_o tqpsd_o benefs_o pv_o hlsup_o lsup_o nreps_o fshare_o
               fsharesd_o, eshare_o, esharesd_o, idsh_o, idshsd_o ;
* And this writes in an excel sheet called "MakeMeASam":
execute "xlstalk.exe -s   %output_xl_file%" ;
execute "gdxxrw.exe outxl.gdx  o=%output_xl_file% index=index!a2" ;
execute 'xlstalk.exe -O %output_xl_file%' ;




