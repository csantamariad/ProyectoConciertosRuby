class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def groups

    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def concerts

    @concerts = Concert.where(:estate => 'ACT')
    @cont = 0

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def locals

    @locals = Local.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def aboutus
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
