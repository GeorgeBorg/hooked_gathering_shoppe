class OrdersController < ApplicationController
	require 'Mollie/API/Client'

	def destroy
		current_order.destroy
		session[:order_id] = nil
		redirect_to root_path, :notice => "Basket emptied successfully."
	end


	def checkout
	    @order = Shoppe::Order.find(current_order.id)
	  	 if request.patch?
		    if @order.proceed_to_confirm(params[:order].permit(:first_name, :last_name, :billing_address1, :billing_address2, :billing_address3, :billing_address4, :billing_country_id, :billing_postcode, :email_address, :phone_number))
		      redirect_to checkout_confirmation_path
		    end
	  	 end
	  	puts current_order.order_items.first.ordered_item.inspect
	end

	def confirmation

		@order = Shoppe::Order.find(current_order.id)
		mollie = Mollie::API::Client.new
		mollie.setApiKey 'test_kBn4UATMKjcRD4VGEQPsz5UVuyQ6bA'

		order_id = Time.now.to_i

		order_id_string = order_id.to_s

		path = 'http://localhost:3000'
		redirectURL = path + checkout_confirmed_path + '?order_id=' + order_id_string

		payment = mollie.payments.create({
			:amount      => @order.total,
			:description => @order.full_name,
			:redirectUrl => redirectURL,
			:mode => 'test',
			:metadata    => {
				:order_id =>  order_id,
			}
		})

		redirect_to payment.getPaymentUrl

	end

	def confirmed
		mollie = Mollie::API::Client.new
		mollie.setApiKey 'test_kBn4UATMKjcRD4VGEQPsz5UVuyQ6bA'

	 	payment = mollie.payments.get(pay_id)

		if payment.paid?
	  		puts 'Payment received.'
	  		current_order.destroy
	  		session[:order_id] = nil
	  		redirect_to root_path
		else
			puts 'Payment Cancelled'
			redirect_to checkout_path
		end

		
	end

end
