class PostPolicy < ApplicationPolicy
	attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
  	true
  end

  def index?
  	true
  end

  def edit?
  	true
  end

  def delete?
  	true
  end

  def new?
  	true
  end
end