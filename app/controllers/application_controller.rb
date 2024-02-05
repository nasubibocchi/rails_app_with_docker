class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # SessionsHelper: SessionsControllerを生成した時点で自動作成された
  include SessionsHelper
end
