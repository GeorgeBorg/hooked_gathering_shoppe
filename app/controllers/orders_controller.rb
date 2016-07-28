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
			:webhookUrl => 'http://000ec1d7.ngrok.io',
			:metadata    => {
				:order_id =>  order_id,
			}
		})

		current_order.mollie_id = payment.id

		current_order.save
		
		redirect_to payment.getPaymentUrl

	end

	def confirmed
		mollie = Mollie::API::Client.new
		mollie.setApiKey 'test_kBn4UATMKjcRD4VGEQPsz5UVuyQ6bA'

	 	payment = mollie.payments.get(current_order.mollie_id)

		if payment.paid?
	  		puts 'Payment received.'
	  		current_order.amount_paid = current_order.total
	  		current_order.save
	  		current_order.confirm!
	  		session[:order_id] = nil
	  		redirect_to root_path, :notice => "Order has been placed successfully!"
		else
			puts 'Payment Cancelled'
			redirect_to checkout_path
		end

		
	end

end
