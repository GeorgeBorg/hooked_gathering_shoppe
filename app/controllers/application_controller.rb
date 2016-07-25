class ApplicationController < ActionController::Base

  private

  def current_order
    @current_order ||= begin
      if has_order?
        @current_order
      else
        order = Shoppe::Order.create(:ip_address => request.ip)
        session[:order_id] = order.id
        order
      end
    end
  end

  def has_order?
    !!(
      session[:order_id] &&
      @current_order = Shoppe::Order.includes(:order_items => :ordered_item).find_by_id(session[:order_id])
    )
  end


  def login_required
      redirect_to root_path unless logged_in?
    end

    def logged_in?
      current_user.is_a?(Shoppe::User)
    end

    def current_user
      @current_user ||= login_from_session || :false
    end

    def login_from_session
      if session[:shoppe_user_id]
        @user = Shoppe::User.find_by_id(session[:shoppe_user_id])
      end
    end


  helper_method :current_order, :has_order?, :logged_in?
end
