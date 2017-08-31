* -------------------------------------------------------------------------------------------
* ------------ OUTPUT CONTROL WITH A PUT STATEMENT ------------------------------------------
* -------------------------------------------------------------------------------------------
* (This is useful to automate certain kinds of output and avoid repetitive excel manipulations
* It makes a text file (tablput.txt) which can be relatively easily cut and pasted into excel.
* Tweak it for your preferred purpose and chosen output table format.

* Use put statement to make a nice text file which can be cut+pasted into excel

* parameters for nicer output:
parameter tyDmv_mil(mv) tot income change in millions
          tryDmv_mil(mv) tot real income change in millions
          yDmv_mil(h,mv) hh income change in millions
          ryDmv_mil(h,mv) hh real income change in millions ;
tyDmv_mil(mv) = tyD_mv(mv)/1000000 ;
tryDmv_mil(mv) = tryD_mv(mv)/1000000 ;
yDmv_mil(h,mv) = yD_mv(h,mv)/1000000 ;
ryDmv_mil(h,mv) = ryD_mv(h,mv)/1000000 ;

* Sets to output which simulation was made:
set kchange(g,fk,h) indicator set of capital having changed
    achange(g,h)    indicator set of CB shift having changed ;
kchange(g,fk,h)$fixfacD_mv(g,fk,h,"mean") = yes ;
display kchange ;
achange(g,h)$pshiftD_mv(g,h,"mean") = yes ;
display achange ;
*fixfac(g,"K",h)$ht(h) = fixfac(g,"k",h)*1.1 ;
* 2) 10% increase in shift parameter (technology) for the treated household
*acobb("crop",h) = acobb("crop",h)*1.1 ;



file %output_txt_file% /"%output_txt_file%.txt"/;
put %output_txt_file% ;

put 'Output file'  @40'; ' "%output_txt_file%" /;
put 'Assumptions' @33 ';' /;
if (card(kchange), put @45 '; ' 'K change' ;
   else put @45 '; ' 'no K change');
put /;
if (card(achange), put @45 '; ' 'Techn chg';
   else put @45 '; ' 'no tech change'  );
put /;
put 'Elasticity of hl/fl lab supply'   @40'; ' %hlse%:<6 '/' %flse%:< /;
put 'Liquidity constraint on/off'  @40'; '  %budgetconstraint%:<2:0 /;
put 'Village Cluster Markets'  @40 '; '
loop (gtv, put gtv.tl:<7 ',' );

loop(ftv,
     put ftv.tl:<7 ','
);
put /;

put 'Treatment and Control Cluster Markets'   @40 '; '
loop(gtz,
     put gtz.tl:<7 ','
);
loop(ftz,
     put ftz.tl:<7 ','
);
put /;

put 'Integrated Markets'  @40'; '
loop(gtw,
     put gtw.tl:<7 ','
);
loop(ftw,
     put ftw.tl:<7 ','
);
put /;


put 'Transfer in cash/kind (all households)' /;
put 'A1'  @40'; '  sum(h,transfer(h)):<12:3 /;
*put 'A2'  @40'; '  exincD_mv("a2","mean"):<12:0 /;
*put 'A3'  @40'; '  exincD_mv("a3","mean"):<12:0 /;
put //;
put 'iterations'  @40'; ' card(draw) /;
put /;


* maybe star these out for the table-making
*$ontext
put 'RESULTS IN LEVELS' /;
put 'Total income Effect' /;
* divided by 1000000
*put 'Nominal level' @40 ';' tyDmv_mil("mean"):<6:2 /;
*put '        (CI in millions)' @40';' '(' tyDmv_mil("pct5"):<6:2 ',' tyDmv_mil("pct95"):<6:2 ')' /;
*put '        real'  @40'; ' tryDmv_mil("mean"):<6:2 /;
*put '        (CI in millions)' @40';' '(' tryDmv_mil("pct5"):<6:2 ',' tryDmv_mil("pct95"):<6:2 ')' /;
* not divided
put 'Nominal level' @40 ';' tyD_mv("mean"):<6:3 /;
put '        (CI in millions)' @40';' '(' tyD_mv("pct5"):<6:3 ',' tyD_mv("pct95"):<6:3 ')' /;
put '        real'  @40'; ' tryD_mv("mean"):<6:3 /;
put '        (CI in millions)' @40';' '(' tryD_mv("pct5"):<6:3 ',' tryD_mv("pct95"):<6:3 ')' /;

put /;

put 'Delta Household income (in Loti)' /;
loop(h,
     put h.tl 'nominal' ;
     put @45';' yD_mv(h,"mean"):<6:3 /;
*     put @14 'cpi increase in %'  @45';' cpiPC_mv(h,"mean"):6:3 '%':<1 /;
     put @14 'real'  @45';' ryD_mv(h,"mean"):<6:3/;
);

put /;

put 'Production Effects (in Loti)' /;
loop(g$(not sameas(g,"OUT")),
     put g.tl  @45';' tqpD_mv(g,"mean"):<12:3 /;
);

put //;

put 'MULTIPLIERS' /;

put 'Total income multiplier' /;
     put 'Nominal  ' @45';'  ymult_all_mv("mean"):6:2 /;
     put '    (CI)' @40';' '(' ymult_all_mv("pct5"):6:2 ',' ymult_all_mv("pct95"):6:2 ')' /;

     put '   Real  '  @45';' rymult_all_mv("mean"):6:2 /;
     put '   (CI)'  @40';' '(' rymult_all_mv("pct5"):6:2 ',' rymult_all_mv("pct95"):6:2 ')' ;
put //;

put "Hh income multiplier (nominal)" /;
loop(h,
     put h.tl 'nominal';
     put  @45';' ytotmult_h_mv(h,"mean"):5:2 /;
*     put  @14 'cpi increase in %'  @45';' cpiPC_mv(h,"mean"):6:2 '%':<1 /;
     put  @14 'real' @45';' rytotmult_h_mv(h,"mean"):5:2 /;
     put @14 '(CI)'  @40';' '(' rytotmult_h_mv(h,"pct5"):5:2 ',' rytotmult_h_mv(h,"pct95"):5:2 ')' /;
);
put / ;

put "Production multiplier" /;
loop(g$(not sameas(g,"OUT")),
     put g.tl ;
     put  @45';' prodmult_all_mv(g,"mean"):5.2 /;
     put @14 '(CI)'  @40';' '(' prodmult_all_mv(g,"pct5"):5:2 ',' prodmult_all_mv(g,"pct95"):5:2 ')' /;
);
put / ;

put "RESULTS AT THE VILLAGE LEVELS " /;
put "Village-wide income multiplier" /;
loop(v,
     put v.tl 'nominal';
     put @45 ';' ymult_vil_mv(v,"mean") /;
*     put @14 'village cpi increase' @45 ';' vcpiPC_mv(v,"mean"):6:2 '%':<1 /;
     put @14 'real' @45';' rymult_vil_mv(v,"mean"):6:2 /;
     put @14 '(CI)'  @40';' '(' rymult_vil_mv(v,"pct5"):6:2 ',' rymult_vil_mv(v,"pct95"):6:2 ')'/ ;
);
put /;


* Rent effect on land and capital
loop(v,
     loop(f$fk(f),
          put "Rent index for" f.tl "in" v.tl @45 ';'criPC_mv(v,f,"mean"):<6:4'%':<1 /;
          put @14 '(CI)'  @40';' '(' criPC_mv(v,f,"pct5"):6:2 '%,' criPC_mv(v,f,"pct95"):6:2 '%' ')'/ ;
     );
);
*put "All rent levels in range" @45 ';' '('rentrange1:<6:2 '%,'rentrange2:6:2 '%' ')'
put /;
put "Capital Rent index  - by crops and household" /;
loop(g$(not sameas(g,"OUT")),
     loop(h,
          put g.tl 'cap. in household ' h.tl
          put  @45';' rPC_mv(g,"Capital",h,"mean"):6.2 '%':<1 /;
     );
);
put / ;

put "Effect on prices by activity and village" /;
loop(v,
  loop(g,
   put "price in" v.tl " " g.tl @45';' pvPC_mv(g,v,"mean"):6.2 '%':<1 /;
   put @14 '(CI)'  @40';' '(' pvPC_mv(g,v,"pct5"):6:2 '%,' pvPC_mv(g,v,"pct95"):6:2 '%' /;
  );
);
put /;

put "Effect on wages" /;
loop(v,
  loop(f$ftv(f),
   put "wage in" v.tl " " f.tl @45';' wvPC_mv(f,v,"mean"):6.2 '%':<1 /;
   put @14 '(CI)'  @40';' '(' wvPC_mv(f,v,"pct5"):6:2 '%,' wvPC_mv(f,v,"pct95"):6:2 '%' /;
  );
);
put /;

put "Change in quantity produced"
loop(g$(not sameas(g,"OUT")),
     put g.tl ;
     put  @45';' tqpD_mv(g,"mean"):<6:2 /;
     put @40 ';' '(' tqpD_mv(g,"pct5"):<6:2 ',' tqpD_mv(g,"pct95"):<6:2 ')' /;
);

put / ;

* This is to have capital values in the denominator of the multipliers
put 'MULTIPLIERS with Capital (land) included' /;

put 'Total income multiplier' /;
     put 'Nominal  ' @45';'  ykmult_all_mv("mean"):6:2 /;
     put '    (CI)' @40';' '(' ykmult_all_mv("pct5"):6:2 ',' ykmult_all_mv("pct95"):6:2 ')' /;
     put '   Real  '  @45';' rykmult_all_mv("mean"):6:2 /;
     put '   (CI)'  @40';' '(' rykmult_all_mv("pct5"):6:2 ',' rykmult_all_mv("pct95"):6:2 ')' ;
put //;

put "Hh income multiplier (nominal)" /;
loop(h,
     put h.tl 'nominal';
     put  @45';' yktotmult_h_mv(h,"mean"):6:2 /;
*     put  @14 'cpi increase in %'  @45';' cpiPC_mv(h,"mean"):6:2 '%':<1 /;
     put  @14 'real' @45';' ryktotmult_h_mv(h,"mean"):6:2 /;
     put /;
     put @40 ';''(' rymult_h_mv(h,"pct5"):6:2 ',' rymult_h_mv(h,"pct95"):6:2 ')' /;
);
put / ;
*$offtext

* Add the expenditures on outside stuff,
* both by the households directly (exproc) as through activities (vms for "outside"):
put "Increase in Demand from outside the zoi:" /;
loop(h,
     put h.tl 'direct hh expense';
     put  @45';' exprocD_mv(h,"mean"):7:5 /;
);
put "Increase Demand through local activities:"  /;
loop(v,
     loop (gtw,
          put v.tl "village demand" ;
          put @45 ';' vmsD_mv(gtw,v,"mean"):7:5 ;
     );
);
put // ;

* CPI with confidence bounds:
put "Hh CPI increase" /;
loop(h,
     put h.tl ;
     put  @14 'cpi increase in %'  @45';' cpiPC_mv(h,"mean"):7:5  /;
     put @40 ';''(' cpiPC_mv(h,"pct5"):7:5 ',' cpiPC_mv(h,"pct95"):7:5 ')' /;
);
loop(v,
     put @14 'village cpi increase' @45 ';' vcpiPC_mv(v,"mean"):6:2 '%':<1 /;
);
put // ;

put 'Increase in zoi-row trade'  @45'; ' zoirowtradD_mv("mean"):7:3 /;
put '(CI)'  @40';' '(' zoirowtradD_mv("pct5"):7:3 ',' zoirowtradD_mv("pct95"):7:3 ')' /;
put //;





$ontext
set hac(h) just a and c households /a1,c/

put 'Production Multiplier (per dollar of transfer)' /;
put  @45';' ttprodmult_mv("mean"):<6.2 /;
put @14 '(CI)' @40 ';' '(' ttprodmult_mv("pct5"):6:2 '-' ttprodmult_mv("pct95"):6.2  ')'/ ;

put /;

put "Production multiplier" /;
loop(h$hac(h),
     put h.tl ;
     put  @45';' hprodmult_mv(h,"mean"):<6.2 /;
     put @14 '(CI)' @40 ';' '(' hprodmult_mv(h,"pct5"):6:2 '-' hprodmult_mv(h,"pct95"):6:2 ')'/ ;
);
put / ;

put "Production multiplier" /;
loop(g$(not sameas(g,"outside")),
     put g.tl ;
     put  @45';' prodmult_all_mv(g,"mean"):<6.2 /;
     put @14 '(CI)' @40 ';' '(' prodmult_all_mv(g,"pct5"):6:2 '-' prodmult_all_mv(g,"pct95"):6:2 ')'/ ;
);
put / ;


*$ontext
* This is to have capital values in the denominator of the multipliers
put 'MULTIPLIERS' /;

put 'Total income multiplier' /;
     put 'Nominal  ' @45';'  ykmult_all_mv("mean"):6:2 /;
     put '    (CI)' @40';' '(' ykmult_all_mv("pct5"):6:2 '-' ykmult_all_mv("pct95"):6:2 ')' /;

     put '   Real  '  @45';' rykmult_all_mv("mean"):6:2 /;
     put '   (CI)'  @40';' '(' rykmult_all_mv("pct5"):6:2 '-' rykmult_all_mv("pct95"):6:2 ')' ;
put //;
$offtext


$ontext
put "Hh income multiplier (nominal)" /;
loop(h$hac(h),
     put h.tl 'nominal';
     put  @45';' yktotmult_h_mv(h,"mean"):5:2 /;
     put  @14 'cpi increase in %'  @45';' cpiPC_mv(h,"mean"):6:2 '%':<1 /;
     put  @14 'real' @45';' ryktotmult_h_mv(h,"mean"):5:2 /;
     put @40 '(' ymult_h_mv(h,"pct5"):5:2 '-' ymult_h_mv(h,"pct95"):5:2 ')'/;
);
put / ;
$offtext

$ontext
put "HH income multiplier" /;
loop(h$hac(h),
     put h.tl 'nominal';
     put  @45';' ytotmult_h_mv(h,"mean"):6:2 /;
     put @40';' '(' ytotmult_h_mv(h,"pct5"):5:2 '-' ytotmult_h_mv(h,"pct95"):5:2 ')' /;
     put  @14 'cpi increase in %'  @45';' cpiPC_mv(h,"mean"):6:2 '%':<1 /;
     put  @14 'real' @45';' rytotmult_h_mv(h,"mean"):5:2 /;
     put @40';' '(' rytotmult_h_mv(h,"pct5"):5:2 '-' rytotmult_h_mv(h,"pct95"):5:2 ')' /;

);
put / ;

$offtext
