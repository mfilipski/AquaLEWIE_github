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
* ##############################################################################################


* subsets and aliases
*=====================
set
* factor subsets
     fk(f)     fixed factors /CAPITAL,  LAND /
     ft(f)     tradable inputs / LABOR, INPUT /
     ftv(f)    factors tradable in the village /LABOR,  null /
     ftz(f)    factors tradable in the whole zoi  / null /
     ftw(f)    factors tradables in the rest of the world /  INPUT /
     fpurch(f) purchased factors /INPUT/

* goods subsets
     gtv(g)    goods tradable in the village / fseed, ret,  ser ,  null  /
     gtz(g)    goods tradable in the zoi   /null /
     gtw(g)    goods tradable with the rest of the world /meat, fish, crop, prod, out/
     gp(g)     goods that are produces / crop, fish, prod, ret, ser /
     gag(g)    ag goods /crop, meat, fish/
     gnag(g)   non ag goods /prod, ret, ser/

* household subsets
     ht(h)     treated recipients in this simulation (can be a or b or both) / null/
     haq(h)    aquaculture households / AqFSm, AqFBg, AqNurs/
     hag(h)    agriculture households / AqAg /
;

* accounts not in the matrix
sets
     v        villages / AQUA Aqua Cluster /
*                         AGRI Agri Cluster/

     maphv mapping household to their village / (AqFSm,AqFBg,AqNurs,AqAg, AqLL).AQUA
*                                                (AgAg, AgLL).AGRI
/
;

display g, f, h, fk, ft, ftv, ftz, ftw, gtv, gtz, gtw, gp, v, mapHv ;



* choose the elasticity of supply of labor - hired and family
$setglobal hlse 100
$setglobal flse 100

* choose whether or not to have a budget constraint and how much of the transfer releives that constraint
* 0 = no constraint ,  1 = constraint
* If the constraint is active, the parameter shSCTprod determines what % of the transfer is used to relieve the constraint
$setglobal budgetconstraint 0
parameter shSCTprod share of SCT used for buying purchased inputs ;
shSCTprod = 0 ;


