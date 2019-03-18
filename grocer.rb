require 'pry'
def consolidate_cart(cart)
  rcart = {}
  cart.each do |item|
   item.each do |product,details|
     details.each do |detail,x|
      rcart[product] ||= {}
      rcart[product][detail] = x
      
    # binding.pry
      end
    if rcart[product][:count]
      rcart[product][:count] += 1 
      
      else
        rcart[product][:count] = 1
      end
   end
end
return rcart
end



def apply_coupons(cart, coupons)
  
 coupons.each do |coupon|
   item = coupon[:item]
   binding.pry
 if cart[item] && cart[item][:count] >= coupon[:num]
    
    if  cart["#{item} W/COUPON"]
       cart["#{item} W/COUPON"][:count] += 1
    else
      cart["#{item} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[item][:clearance], :count => 1}
      end
      cart[item][:count] -= coupon[:num]
       end
    end
 return cart
    end


def apply_clearance(cart)
  cart.each do |item, details|
  if details[:clearance] == true
   details[:price] = (details[:price] * 0.8).round(3)
 else
   false
   
 end
   # 
   # binding.pry
  #end
 end
 #binding.pry
 return cart
end

def checkout(cart, coupons)
 consolidated_cart = consolidate_cart(cart)
 coupon_cart = apply_coupons(consolidated_cart,coupons)
 final_cart = apply_clearance(coupon_cart)
 total = 0
 final_cart.each do |item, details|
   details.each do |attributes,attribute|
     if attributes == :price
       total = total + (attribute * details[:count])
       #binding.pry
     end
 
 #binding.pry
     end
 end
 if total > 100
   total = total * 0.9
  else 
    return total 
    
  end
 
end
