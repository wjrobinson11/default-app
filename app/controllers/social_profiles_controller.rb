class SocialProfilesController < ApplicationController
  def facebook_pages_lookup
    long_lived_token = HTTParty.get(
      "https://graph.facebook.com/v5.0/oauth/access_token?grant_type=fb_exchange_token&client_id=#{ENV['FACEBOOK_APP_ID']}&client_secret=#{ENV['FACEBOOK_APP_SECRET']}&fb_exchange_token=#{params[:access_token]}"
    )['access_token']

    client = Koala::Facebook::API.new(params['access_token'])
    _res = client.get_connections('me', 'accounts')
    existing_id_strs = SocialProfile.pluck(:id_str)
    res = _res.select { |account_hash| !existing_id_strs.include?(account_hash['id']) }
    return render json: {
      facebook_pages: res,
      long_lived_token: long_lived_token
    }
  end

  def instagram_accounts_lookup
  	long_lived_token = HTTParty.get(
  		"https://graph.facebook.com/v5.0/oauth/access_token?grant_type=fb_exchange_token&client_id=#{ENV['FACEBOOK_APP_ID']}&client_secret=#{ENV['FACEBOOK_APP_SECRET']}&fb_exchange_token=#{params[:access_token]}"
  	)['access_token']

  	client = InstagramGraphApi::Client.new(params['access_token'])
  	_res = client.ig_business_accounts
    existing_id_strs = SocialProfile.pluck(:id_str)
    res = _res.select{|account_hash| !existing_id_strs.include?(account_hash['id'])}
  	return render json: {
  		ig_accounts: res,
  		long_lived_token: long_lived_token
  	}
  end
end
