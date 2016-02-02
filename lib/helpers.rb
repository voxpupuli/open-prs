module Helpers
  def logout
    return unless session[:user]
    session[:user] = nil
    session[:token] = nil
  end

  def app_root
    "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}"
  end

  def create_session_state
    Digest::MD5.hexdigest "#{Time.now.to_i}unguessable random string#{rand}"
  end

  def error_and_back(error)
    session[:error] = error.to_s
    redirect '/'
  end

  def set_client
    begin
      if settings.development?
        Octokit.auto_paginate = true
        client = Octokit::Client.new(:netrc => true)
      else
        Octokit.auto_paginate = true
        client = Octokit::Client.new(access_token: ENV['OPEN_PR_ACCESS_TOKEN'])
      end
    rescue => e
      error_and_back 'GitHub auth error...'
    end

    session[:user] = client.user.login
    session[:avatar] = client.user.avatar_url
    session[:user_id] = client.user.id
    client
  end
end
