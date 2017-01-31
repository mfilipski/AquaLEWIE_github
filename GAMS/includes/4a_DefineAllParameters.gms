* ================================================================================================
* ================================================================================================
* ====================== STEP 4 - CALIBRATE THE MODEL  ===========================================
* ================================================================================================
* ================================================================================================

* This defines all the essential parameters for calibration.
* Additional ad-hoc parameters (for instance for checks) get added in the


parameter
* meta-parameters with parameter draws
fshare_t(g,f,h,draw)  unscaled draw the cobb-douglas factor shares
eshare_t(g,h,draw)    unscaled draw of expenditure shares

* drawn parameters:
pv_dr(g,v,draw)       drawn or computed from draw price at village level
pz_dr(g,draw)         drawn or computed from draw price at zoi level
ph_dr(g,h,draw)       drawn or computed from draw price as seen from household
pva_dr(g,h,draw)      drawn or computed from draw price of value added
qva_dr(g,h,draw)      drawn or computed from draw quantity of value added
qp_dr(g,h,draw)       drawn or computed from draw quantity produced
tqp_dr(g,draw)        drawn or computed total qty produced in the zoi
ttqp_dr(draw)         drawn or computed total output of the zoi
fd_dr(g,f,h,draw)     drawn or computed from draw factor demand
id_dr(g,gg,h,draw)    drawn or computed from draw intermediate demand
pshift_dr(g,h,draw)   drawn or computed from draw cobb-douglas production shifter
fshare_dr(g,f,h,draw) drawn or computed from draw cobb-douglas factor shares
r_dr(g,f,h,draw)      drawn or computed from draw rent for fixed factors
wv_dr(f,v,draw)       drawn or computed from draw village-wide wage for tradable factors
wz_dr(f,draw)         drawn or computed from draw zoi-wide wage for tradable factors
vash_dr(g,h,draw)     drawn or computed from draw value-added share
idsh_dr(gg,g,h,draw)  drawn or computed from draw intermediate demand share
tidsh_dr(gg,h,draw)   drawn or computed from draw total intermediate input share (1-vash)
fixfac_dr(g,f,h,draw) drawn or computed from draw fixed factor demand
unemp_dr(f,h,draw)    drawn or computed from draw unemployment
unempsh_dr(f,h,draw)  drawn or computed from draw hh share of total unemployment
vfmsfix_dr(f,v,draw)  drawn or computed from draw factors fixed at the Village level
zfmsfix_dr(f,draw)    drawn or computed from draw factors fixed at the zoi level
vmsfix_dr(g,v,draw)   drawn or computed from draw goods fixed at the Village level
zmsfix_dr(g,draw)     drawn or computed from draw goods fixed at the zoi level

exinc_dr(h,draw)      drawn or computed from draw exogenous income
endow_dr(f,h,draw)    drawn or computed from draw endowment
qc_dr(g,h,draw)       drawn or computed from draw level of consumption
tqc_dr(g,draw)        drawn or computed from draw total qc
eshare_dr(g,h,draw)    drawn or computed from draw consumption shares
y_dr(h,draw)          drawn or computed from draw nominal hh income
cpi_dr(h,draw)        drawn or computed from draw consumer price index of hh
ry_dr(h,draw)         drawn or computed from draw real hh income
emin_dr(g,h,draw)     drawn or computed from draw incompressible demand
trin_dr(h,draw)       drawn or computed from draw transfers in - received
trout_dr(h,draw)      drawn or computed from draw transfers out - given
trinsh_dr(h,draw)     drawn or computed from draw share of all transfers in the eco going to h
troutsh_dr(h,draw)    drawn or computed from draw share of yousehold h's income being given as transfers
hfd_dr(f,h,draw)      drawn or computed from draw factor demand of household h for factor f
vfd_dr(f,v,draw)      drawn or computed from draw village demand for factor f
zfd_dr(f,draw)        drawn or computed from draw zoi demand for factor f
hms_dr(g,h,draw)      drawn or computed from draw household marketed surplus of good g
vms_dr(g,v,draw)      drawn or computed from draw village marketed surplus of good g
zms_dr(g,draw)        drawn or computed from draw household marketed surplus of good g
hfms_dr(f,h,draw)     drawn or computed from draw household factor marketed surplus
vfms_dr(f,v,draw)     drawn or computed from draw village factor marketed surplus
zfms_dr(f,draw)       drawn or computed from draw zoi factor marketed surplus

savsh_dr(h,draw)      drawn or computed savings rate
sav_dr(h,draw)        drawn or computed savings level
exprocsh_dr(h,draw)   drawn or computed outside-of-zoi expenditures rate
exproc_dr(h,draw)     drawn or computed outside-of-zoi expenditures level
expzoish_dr(h,draw)   drawn or computed outside-of-zoi expenditures level

;

* MACRO for defininf all parameters of type 1, 2, D or PC

$macro defpars(i)  parameters  pv&i(g,v,draw,sim) calibrated price at village level ,  \
         pz&i(g,draw,sim)          price at zoi level     , \
         ph&i(g,h,draw,sim)        price as seen by household    ,\
         pva&i(g,h,draw,sim)       price of value added     ,   \
         qva&i(g,h,draw,sim)       quantity of value added  , \
         qp&i(g,h,draw,sim)            quantity produced by h        , \
         tqp&i(g,draw,sim)             total quantity produced of g  , \
         ttqp&i(draw,sim)              total production value in whole economy  , \
         hqp&i(h,draw,sim)             total qty produced by a household  , \
         fd&i(g,f,h,draw,sim)          factor demand                           , \
         id&i(g,gg,h,draw,sim)         intermediate demand                      , \
         pshift&i(g,h,draw,sim)        cobb-douglas shifter                    , \
         fshare&i(g,f,h,draw,sim)      cobb-douglas shares                     , \
         r&i(g,f,h,draw,sim)           rent for fixed factors                  , \
         wv&i(f,v,draw,sim)            village-wide wage for tradable factors  , \
         wz&i(f,draw,sim)              zoi-wide wage for tradable factors      , \
         vash&i(g,h,draw,sim)          value-added share                       , \
         idsh&i(gg,g,h,draw,sim)       intermediate demand share               , \
         tidsh&i(gg,h,draw,sim)        total intermediate input share (1-vash) , \
         fixfac&i(g,f,h,draw,sim)      fixed factor demand                     , \
         exinc&i(h,draw,sim)           exogenous income                        , \
         endow&i(f,h,draw,sim)         endowment                               , \
         qc&i(g,h,draw,sim)            level of consumption                    , \
         eshare&i(g,h,draw,sim)        consumption shares                      , \
         y&i(h,draw,sim)               income of household                     , \
         cpi&i(h,draw,sim)             cpi                                     , \
         vqc&i(v,g,draw,sim)           village consumption                     , \
         vcpi&i(v,draw,sim)            village cpi                             , \
         cri&i(v,f,draw,sim)           rent weighted index                     , \
         ry&i(h,draw,sim)              real income                             , \
         ty&i(draw,sim)                income total                            , \
         try&i(draw,sim)               real income total                       , \
         emin&i(g,h,draw,sim)          incompressible demand                   , \
         trin&i(h,draw,sim)            transfers in - received                 , \
         trout&i(h,draw,sim)           transfers out - given                   , \
         sav&i(h,draw,sim)             savings                                 , \
         exproc&i(h,draw,sim)          expenditure rest of country             , \
         trinsh&i(h,draw,sim)          share of all transfers in the eco going to h  , \
         troutsh&i(h,draw,sim)         share of household h income being given as transfers , \
         hfd&i(f,h,draw,sim)           factor demand of household h for factor f , \
         vfd&i(f,v,draw,sim)           village demand for factor f             , \
         zfd&i(f,draw,sim)             zoi demand for factor f                 , \
         hms&i(g,h,draw,sim)           household marketed surplus of good g    , \
         vms&i(g,v,draw,sim)           village marketed surplus of good g       , \
         zms&i(g,draw,sim)             household marketed surplus of good g    , \
         hfms&i(f,h,draw,sim)          household factor marketed surplus       , \
         vfms&i(f,v,draw,sim)          village factor marketed surplus         , \
         zfms&i(f,draw,sim)            zoi factor marketed surplus             , \
         vfmsfix&i(f,v,draw,sim)       factors fixed at the Village level (family labor)  , \
         zfmsfix&i(f,draw,sim)         factors fixed at the zoi level (hired labor)       , \
         hfsup&i(f,h,draw,sim)         factor supply by the household                      \
;

defpars(1) ;
defpars(2) ;
defpars(D) ;
defpars(PC) ;



$macro display_pars(i) display pv&i, pz&i, ph&i, qva&i, fd&i, id&i, r&i, wv&i, wz&i, qp&i, tqp&i,    \
ttqp&i , fixfac&i, pva&i, exinc&i, endow&i, y&i, cpi&i, vcpi&i, ry&i, trinsh&i, qc&i, eshare&i, troutsh&i, hfsup&i, hfd&i, vfd&i, zfd&i, hms&i, vms&i, zms&i, hfms&i, vfms&i, zfms&i ;


