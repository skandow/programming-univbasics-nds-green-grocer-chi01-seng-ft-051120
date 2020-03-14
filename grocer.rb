def find_item_by_name_in_collection(name, collection)
  collection_index = 0 
  while collection_index < collection.length do 
    if collection[collection_index][:item] == name
      sought_item_info = collection[collection_index]
    end 
    collection_index += 1 
  end
  sought_item_info
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  cleaned_cart = []
  compare_cart = cart
  cart_index = 0
  while cart_index < compare_cart.length do 
    cleaned_cart << compare_cart[cart_index]
    cleaned_cart[cart_index][:count] = 1
    compare_index = 0 
    while compare_index < compare_cart.length do 
      if cleaned_cart[cart_index][:item] == compare_cart[compare_index][:item] && cart_index != compare_index
        cleaned_cart[cart_index][:count] += 1
        compare_cart.delete_at(compare_index)
      else
        compare_index += 1
      end 
    end
    cart_index += 1
  end
  cleaned_cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  saved_cart = cart
  coupon_check = 0
  while coupon_check < saved_cart.length do 
    coupon_compare = 0
    while coupon_compare < coupons.length do
    if cart[coupon_check][:item] == coupons[coupon_compare][:item] && cart[coupon_check][:count] >= coupons[coupon_compare][:num]
      new_cost = coupons[coupon_compare][:cost] / coupons[coupon_compare][:num]
      non_discounted_amount = cart[coupon_check][:count] % coupons[coupon_compare][:num]
      discounted_amount = cart[coupon_check][:count] - non_discounted_amount
      couponed_item = cart[coupon_check]
      couponed_item[:item] = couponed_item[:item] + " " + "W/COUPON" 
      couponed_item[:price] = new_cost
      couponed_item[:count] = 
      cart[coupon_check][:count] = non_discounted_amount
      cart << couponed_item
    end 
    coupon_compare += 1
    non_discounted_amount = 0 
    discounted_amount = 0
  end 
  coupon_check += 1
  end 
  cart 
  
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  cart_counter = 0 
  while cart_counter < cart.length do 
    if cart[cart_counter][:clearance] == true
      cart[cart_counter][:price] = (cart[cart_counter][:price] * 0.80).round(2)
    end
    cart_counter += 1
  end
  cart 
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  cleanest_cart = consolidate_cart(cart)
  cleanest_cart_with_coupons = apply_coupons(cleanest_cart, coupons)
  cleanest_cart_all_discounts = apply_clearance(cleanest_cart_with_coupons)
  cart_counting = 0 
  final_amount = 0 
  while cart_counting < cleanest_cart_all_discounts.length do
    individual_item_cost = cleanest_cart_all_discounts[cart_counting][:count] * cleanest_cart_all_discounts[cart_counting][:price]
    final_amount += individual_item_cost
    cart_counting += 1
  end
  if final_amount > 100
    final_amount = final_amount * 0.90
  end 
  final_amount 
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end