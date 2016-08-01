class API::V1::UsersController < ApplicationController

  def index
    users = User.all
    response = { data:    users,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show
    user = User.find(params[:id])
    response = { data:    user,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def create
    user = User.create

    response = { data:    user,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def send_phone
    if user = User.find(params[:id])
      # mobile_number = params[:mobile_number]
      # if mobile_number[0] = "0"
      #   mobile_number.sub!("0", '+374')
      # end

      user.mobile_number = params[:mobile_number]
      user.verification_code =  1_000 + rand(10_000 - 1_000)
      user.save
    #
    # @twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
    # @twilio_client.account.sms.messages.create(
    #     :from => ENV['TWILIO_PHONE_NUMBER'],
    #     :to => to,
    #     :body => "Your verification code is #{user.verification_code}."
    # )
      response = { data:    '',
                   result:  {status: 'SUCCESS',
                             message: 'A verification code has been sent to your mobile. Please fill it in below.'} }

      render json: response
    else
      response = { data:    '',
                   result:  {status: 'ERROR',
                             message: 'Invalid user.'} }

      render json: response

    end
  end

  def verify
    if user = User.find_by(verification_code: params[:verification_code])
      user.is_verified = true
      user.verification_code = ''
      user.save

      response = { data:    user,
                   result:  {status: "SUCCESS",
                             message: 'Thank you for verifying your mobile number.'} }

      render json: response

    else
      response = { data:    '',
                   result:  {status: "ERROR",
                             message: 'Invalid verification code.'} }

      render json: response

    end
  end

end