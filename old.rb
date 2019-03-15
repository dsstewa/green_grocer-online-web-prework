dcart = cart
 
 coupons.each do |coupon|
   item = coupon[:item]
  # binding.pry
  if cart[item]                         
     dcart["#{item} W/COUPON"] = {:price => coupon[:cost],:clearance => dcart[item][:clearance], :count => 1}
     dcart[item][:count] = dcart[item][:count] - coupon[:num]
     #binding.pry

 
    
       end
      end
      return dcart