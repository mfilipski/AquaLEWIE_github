
* ================================================================================================
* ================================================================================================
* ===================== Figure out the confidence bounds for ouput parameters of interest  =======
* ================================================================================================
* ================================================================================================

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
loop(sim,
*ty
         Torank(draw) = tyD(draw,sim) ;
         ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
         ty_mvD(sim,lh) = ci2(lh) ;
*try
         Torank(draw) = tryD(draw,sim) ;
         ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
         try_mvD(sim,lh) = ci2(lh) ;


*parameters by household:
         loop(h,
*y
                 Torank(draw) = yD(h,draw,sim) ;
                 ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
                 y_mvD(h,sim,lh) = ci2(lh) ;
*ry
                 Torank(draw) = ryD(h,draw,sim) ;
                 ci2(lh) = ci(lh);
$libinclude rank Torank draw Ranks ci2
                 ry_mvD(h,sim,lh) = ci2(lh) ;
         );

);
display y_mvD;

