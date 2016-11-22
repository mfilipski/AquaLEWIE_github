* ##############################################################################################
* ##############################################################################################
* ##############################################################################################
* HERE YOU CAN CHOOSE ASSUMPTIONS FOR GIVEN SIMULATION RUNS:
* ( in theory , there is no need to change anything else in the model but these following 6 items )

* 1) Choose the number of draws in the "set draw" command.  Minimum 10 draws if you want GAMS to compute percentiles.

* 2) Choose the elasticity of labor supply with the hlse and flse locals.

* 3) Choose whether or not to have a budget constraint on agricultural input purchases using the $setglobal

* 4) Choose which factors are traded at what level using the FTV FTZ and FTW subsets
* for instance, if FL(family labor) is part of the FTV subset, each village has its own FL market
* and the price of FL (shadow wage) will be an endogenous VILLAGE parameter.
* If FL is in the FTZ subset, there is a ZOI-wide market and a ZOI-wide price for FL.
* If FL is in the FTW subset, family labor is in perfectly elastic supply at exogenously fixed world prices.
* note - always leave at least the "null" element in any subset to avoid errors

* 5) Choose which goods are traded at what level using the GTV GTZ and GTW - same principles as with factors.

* 6) Choose which households receive their transfer.  The PILOT model gives a transfer to A only.
* The SCALE-UP would give it to both A and B.  C and D wouldn't receive a transfer.
* -------------------------------------------------------------------------------------------------

* subsets and aliases
*=====================
set
* factor subsets
     fk(f)     fixed factors / CAPITAL, LAND /
     ft(f)     tradable inputs / LABOR, INPUT /
     ftv(f)    factors tradable in the village /LABOR,  null /
     ftz(f)    factors tradable in the whole zoi  / null /
     ftw(f)    factors tradables in the rest of the world /  INPUT /
     fpurch(f) purchased factors /INPUT/

* goods subsets
     gtv(g)    goods tradable in the village / ret, crop, live, other ,  null  /
     gtz(g)    goods tradable in the zoi   /null /
     gtw(g)    goods tradable with the rest of the world / outside/
     gp(g)     goods that are produces / crop, live, ret, other /
     gag(g)    ag goods /crop, live/
     gnag(g)   non ag goods /ret, other /

* household subsets
     ht(h)     treated recipients in this simulation (can be a or b or both) / null
/
     hc(h)     households in the camp / rrc, rrf
/
     hnc(h)    households outside of the camp / rlo
/
     hfood(h)     households getting inkind aid /rrf /
     hcash(h)    households getting cash aid    /rrc/
;

* accounts not in the matrix
sets
     v        villages / RMJ camp 1 Rwamwanja
/

     maphv mapping housheold to their village / (rrc,rrf,rlo).RMJ
/
;

display g, f, h, fk, ft, ftv, ftz, ftw, gtv, gtz, gtw, gp, v, mapHv ;
