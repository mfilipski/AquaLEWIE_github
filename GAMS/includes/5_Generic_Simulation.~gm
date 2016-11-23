*baseline parameters
transfer(h) = 0 ;
infood(h) = 0 ;
incash(h) = 0 ;
newremits(h) = 0 ;
packsold(g) = 0;
hfsnewref(ft,h) = 0;
wfpcost(h) = 0 ;



* Shock in cash:
incash(hcash) = %in_cash%   ;
newremits(hcash) = %new_remits_cash_hh% ;
* Shock in kind:
infood(hfood) = %in_food% ;
newremits(hfood) = %new_remits_food_hh% ;


packsold("crop") = sum(hc,infood(hc))*%share_pack_sold% ;

* cost to wfp:
wfpcost(hc) = incash(hc) + infood(hc) ;

* perceived value for the household:
transfer(hcash) =  incash(hcash);
transfer(hfood) =  infood(hfood)*(1-%share_pack_sold%)
              + infood(hfood)* %share_pack_sold% * (1-%tcost_packsale%);

display infood, transfer, packsold, newremits ;

* 2 - Increase the labor supply by one refugee household
* The Total labor endowment is (measured in shillings):
* Rwamwanja = 9362482045
* Adjumani  = 10556489913.4
* Divided by the number of households to get the average endowment, then divide by 1000000 to scale
* Rwamwanja = 9362482045/(23648*1000000)    = 0.3959101
* Adjumani  = 10556489913.4/(21479*1000000) = 0.4914796
hfsnewref(ft,h) = %lab_supply_one_ref% ;

display hfsupzero;
display HFSUP.l ;
*hfsupzero

*transfer("b")$ht("b") = 3245760 ;

*include in budget
if(%budgetconstraint% = 1,
* for constrained HH's, setup for all types
          exinc(h) = exinc(h) + (1-shSCTprod)*transfer(h) + newremits(h)  ;
          pibudget(g,h) = pibudget(g,h)+ shSCTprod*transfer(h)*pibsh(g,h) ;
     else
          exinc(h) = exinc(h) + transfer(h)+ newremits(h) ;
);



* Transfer of land to the household:
fixfac(g,"Land",hfood) = fixfac(g,"Land",hfood) * (1+ %new_land_food%);
fixfac(g,"land",hcash) = fixfac(g,"Land",hcash) * (1+ %new_land_cash%);



* additional simulations:
* 1) 10% increase in capital (credit (market) for the treated households
*fixfac(g,"K",h)$ht(h) = fixfac(g,"k",h)*1.1 ;
*fixfac(g,"K",h)$(maphv(h,"T")) = fixfac(g,"k",h)*1.1 ;
*fixfac("crop","K",h)$(maphv(h,"T")) = fixfac("crop","k",h)*1.1 ;
*fixfac(g,"K",h)$ht(h) = fixfac(g,"k",h)*1.1 ;


* 2) 10% increase in shift parameter (technology) for the treated household
*acobb("crop",h)$ht(h) = acobb("crop",h)*1.1 ;
*acobb("crop",h)$(maphv(h,"T")) = acobb("crop",h)*1.1 ;
