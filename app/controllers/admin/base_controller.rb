class Admin::BaseController < ApplicationContoller
  http_basic_authenticate_with name: ENV['ADMIN_USER_NAME'],
  password: ['ADMIN_PASSWORD']
 end