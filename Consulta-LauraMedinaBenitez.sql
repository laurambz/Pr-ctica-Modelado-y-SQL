create schema consulta_lmb authorization bqohjoyb;

select car.id_car, m.model, b.brand,c.corporation,col.colour,car.dt_purchase,car.km_total,car.car_plate,ic.insurance, ich.policy_num
from practica_lmb.car car, practica_lmb.c_model m, practica_lmb.c_brand b, practica_lmb.c_corporation c, practica_lmb.insurance_comp_hist ich,practica_lmb.insurance_comp ic, practica_lmb.c_colour col
where car.id_corporation = c.id_corporation and car.id_brand = b.id_brand and car.id_model = m.id_model and car.id_car = ich.id_car and ich.id_insurance = ic.id_insurance and car.id_colour = col.id_colour and car.id_status = 'in' and ich.dt_end_insurance = '4000-01-01'