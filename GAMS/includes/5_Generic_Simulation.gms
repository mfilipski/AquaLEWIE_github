


transfer(h)=0 ;
* simulation shocks for fixed factor:
fixfac_t(g,f,h) = fixfac(g,f,h) + fsim(g,f,h,sim) ;
display "this is the first change of fixfac", fixfac_t ;

fixfacsim_dr_t(g,f,h,draw,sim)= fixfac_t(g,f,h) ;
* if negative, replace with 0.1:
negfixfac(g,f,h,draw,sim)$(fixfac_t(g,f,h) < 0)  = fixfac_t(g,f,h) ;
fixfac(g,f,h) = fixfac_t(g,f,h) ;
fixfac(g,f,h)$(fixfac_t(g,f,h) < 0) = 0.1 ;
fixfacsim_dr(g,f,h,draw,sim)= fixfac(g,f,h) ;
*fixfac("Fish","Land","AqFSm") = fixfac("Fish","Land","AqFSm") +2 ;
*fixfac("Fish","Land","AqFBg") = fixfac("Fish","Land","AqFBg") +2 ;
*fixfac("Crop","Land","AqAg") = fixfac("Crop","Land","AqAg") +0.7 ;
display "this is the first change of fixfac", fixfac_t ;


$ontext






*baseline parameters
transfer(h) = 0 ;
infood(h) = 0 ;
incash(h) = 0 ;
newremits(h) = 0 ;
packsold(g) = 0;
hfsnewref(ft,h) = 0;
wfpcost(h) = 0 ;



* Shock in cash:
*incash(hcash) = %in_cash%   ;
*newremits(hcash) = %new_remits_cash_hh% ;
* Shock in kind:
*infood(hfood) = %in_food% ;
*newremits(hfood) = %new_remits_food_hh% ;


*packsold("crop") = sum(hc,infood(hc))*%share_pack_sold% ;

* cost to wfp:
*wfpcost(hc) = incash(hc) + infood(hc) ;

* perceived value for the household:
*transfer(ht) = 1 ;
*transfer(hfood) =  infood(hfood)*(1-%share_pack_sold%)
*              + infood(hfood)* %share_pack_sold% * (1-%tcost_packsale%);

display infood, transfer, packsold, newremits ;

* 2 - Increase the labor supply by one refugee household
* The Total labor endowment is (measured in shillings):
* Rwamwanja = 9362482045
* Adjumani  = 10556489913.4
* Divided by the number of households to get the average endowment, then divide by 1000000 to scale
* Rwamwanja = 9362482045/(23648*1000000)    = 0.3959101
* Adjumani  = 10556489913.4/(21479*1000000) = 0.4914796
*hfsnewref(ft,h) = %lab_supply_one_ref% ;

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

*transfer(h) = 1;
*exinc(haq) = exinc(haq) + transfer(haq) ;

* Transfer of land to the household:
*fixfac(g,"Land",hfood) = fixfac(g,"Land",hfood) * (1+ %new_land_food%);
*fixfac(g,"land",hcash) = fixfac(g,"Land",hcash) * (1+ %new_land_cash%);
*fixfac("Fish","Land","AqFSm") = fixfac("Fish","Land","AqFSm") +1 ;

* According to CESD Research Brief:
* rent for paddy land = 70,000 / acre = 0.7 lakh
* rent for pond land = 200,000 / acre = 2 lakh

* let's simulate conversion of 1 acre of unused land into either paddy or pond:
*fixfac("Fish","Land","AqFSm") = fixfac("Fish","Land","AqFSm") +2 ;
fixfac("Fish","Land","AqFBg") = fixfac("Fish","Land","AqFBg") +2 ;
*fixfac("Crop","Land","AqAg") = fixfac("Crop","Land","AqAg") +0.7 ;
*fixfac("Crop","Land","AqFSm") = fixfac("Crop","Land","AqFSm") -1 ;

* additional simulations:
* 1) 10% increase in capital (credit (market) for the treated households
*fixfac(g,"K",h)$ht(h) = fixfac(g,"k",h)*1.1 ;
*fixfac(g,"K",h)$(maphv(h,"T")) = fixfac(g,"k",h)*1.1 ;
*fixfac("crop","K",h)$(maphv(h,"T")) = fixfac("crop","k",h)*1.1 ;
*fixfac(g,"K",h)$ht(h) = fixfac(g,"k",h)*1.1 ;


* 2) 10% increase in shift parameter (technology) for the treated household
*acobb("crop",h)$ht(h) = acobb("crop",h)*1.1 ;
*acobb("crop",h)$(maphv(h,"T")) = acobb("crop",h)*1.1 ;
*pshift("crop",h)$hag(h) = pshift("crop",h)*1.1 ;


$offtext
