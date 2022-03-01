class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all # TODO 想要按照座位所在的房间排序？？？
    json_response(@users)
  end

  # POST /users
  def create # TODO 多对多的座位-用户关系怎么新建？
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update # TODO 多对多的座位-用户关系怎么修改？
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  # def adusers
  #   ldap = Net::LDAP.new  :host => "192.168.0.9", # your LDAP host name or IP goes here,
  #                         :port => "389", # your LDAP host port goes here,
  #                         #          :encryption => :simple_tls,
  #                         :base => "OU=Lab,OU=ACT,DC=lab,DC=act,DC=buaa,DC=edu,DC=cn", # the base of your AD tree goes here,
  #                         :auth => {
  #                           :method => :simple,
  #                           :username => "it@lab", # a user w/sufficient privileges to read from AD goes here,
  #                           :password => Rails.application.secrets.ad_password # the user's password goes here
  #                         }
  #   ldap.bind
  #   #filter = Net::LDAP::Filter.eq( "sAMAccountName", "woty" )
  #   filter = Net::LDAP::Filter.eq("objectclass", "person")
  #   @users = ldap.search(filter: filter)
  #   @groups = Group.all
  # end

  private

  def user_params
    # whitelist params
    params.permit(:name, :email, :tel, {seat_ids:[]})
  end

  def set_user
    @user = User.find(params[:id])
  end
end
