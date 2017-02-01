set res Results for output
/ ymv_o, rymv_o/

Parameter
ty_o(sim)        total nominal income
try_o(sim)       total real income
ry_o(h,sim)      household real income
tqp_o(g,sim)     total quantity produced
;
* First display the parameters I want:
display ty_mvD, try_mvD, y_mvD, tqpD ;

ty_o(sim) = ty_mvD(sim,"mean") ;
try_o(sim) = try_mvD(sim, "mean") ;
ry_o(h,sim) = ry_mvD(h,sim,"mean") ;
tqp_o(g,sim) = eps;
tqp_o(g,sim) = tqp_mvD(g,sim,"mean") ;

display ty_o, try_o, ry_o, tqp_o ;

execute_unload "outxl.gdx" modstat ty_o try_o ry_o tqp_o ;
* And this writes in an excel sheet called "MakeMeASam":
execute "xlstalk.exe -s   %output_xl_file%" ;
execute "gdxxrw.exe outxl.gdx  o=%output_xl_file% index=index!a2" ;
execute 'xlstalk.exe -O %output_xl_file%' ;




