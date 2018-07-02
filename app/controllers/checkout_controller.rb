class CheckoutController < ApplicationController

  include ActionView::Helpers::TextHelper

  def success
    @quote = Quote.find(params[:quote_id])
    authorize! :update, @quote

    if @quote.travellers.present?
      @quote.travellers.each do |traveller|
        # @policy = Policy.find_or_create_by(traveller_id: traveller.id, payment_via: 'Paymaya', user_id: current_user.id)
        @policy = current_user.policies.build(traveller_id: traveller.id, payment_via: 'Paymaya')

        traveller.update(policy_id: @policy.id) if @quote.policies << @policy
      end
      @quote.update(policy_issued: Date.today)
      @quote.travel_destinations.update(policy_id: @policy.id)
      @quote.policies.each do |policy|
        policy.update(online_policy_no: policy.create_online_policy_number)

        # EmailMailer.policy(current_user, @quote, policy).deliver # *****
      end
    else
      redirect_to @quote, alert: 'Policy already exists.'
    end

    respond_to do |format|
      format.html { redirect_to policies_path, notice: "#{pluralize @quote.policies_count, 'policy'} successfully created and paid. Thank you for your purchase. Have a safe trip!" }
      # format.json { render json: @resource }
    end
  end

  def failure
    @quote = Quote.find(params[:quote_id])
    authorize! :read, @quote
    redirect_to @quote, alert: 'Sorry, there was a problem in processing your payment. Please try again.'
  end

  def cancelled
  end
end
