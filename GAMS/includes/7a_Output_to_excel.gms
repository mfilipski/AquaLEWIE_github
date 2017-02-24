set res Results for output
/ ymv_o, rymv_o/

Parameter
ty_o(sim)        total nominal income level change
try_o(sim)       total real income level change
ry_o(h,sim)      household real income level change
tqp_o(g,sim)     total quantity produced level change
benefs_o(*,sim)  beneficiary and non-beneficiary returns
pv_o(g,sim)      percent change in prices
hlsup_o(h,sim)   labor supply level change
lsup_o(sim)      total labor supply level change

;
* First display the parameters I want:
display ty_mvD, try_mvD, y_mvD, tqpD ;

ty_o(sim) = ty_mvD(sim,"mean") ;
try_o(sim) = try_mvD(sim, "mean") ;
ry_o(h,sim) = ry_mvD(h,sim,"mean") ;
tqp_o(g,sim) = 1E-13;
tqp_o(g,sim) = tqp_mvD(g,sim,"mean") ;
benefs_o("benef", sim) = benefryD(sim,"mean") ;
benefs_o("non-benef", sim) = nbenefryD(sim,"mean") ;
benefs_o("simval", sim) = simval(sim) ;
benefs_o("mult", sim) = mult(sim,"mean") ;
*nbenef_o(sim) = nbenefryD(sim,"mean") ;
pv_o(g,sim) = 1E-13 ;
hlsup_o(h,sim) = hfsup_mvD("labor",h,sim,"mean") ;
lsup_o(sim) = fsup_mvD("labor",sim,"mean") ;

display pv_o ;
pv_o(g,sim)$pv_mvPC(g,"AQUA",sim,"mean") = pv_mvPC(g,"AQUA",sim,"mean") ;



display ty_o, try_o, ry_o, tqp_o, benefs_o, pv_o, hlsup_o, lsup_o;


execute_unload "outxl.gdx" modstat ty_o try_o ry_o tqp_o benefs_o pv_o hlsup_o lsup_o ;
* And this writes in an excel sheet called "MakeMeASam":
execute "xlstalk.exe -s   %output_xl_file%" ;
execute "gdxxrw.exe outxl.gdx  o=%output_xl_file% index=index!a2" ;
execute 'xlstalk.exe -O %output_xl_file%' ;




