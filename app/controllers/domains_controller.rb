class DomainsController < ApplicationController
  # GET /domains
  # GET /domains.xml
  def index
    @domains = Domain.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domains }
    end
  end

 def admin
    @domains = Domain.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domains }
    end
  end


  # GET /domains/1
  # GET /domains/1.xml
  def show
    @domain = Domain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @domain }
    end
  end

  # GET /domains/new
  # GET /domains/new.xml
  def new
    @domain = Domain.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @domain }
    end
  end

  # GET /domains/1/edit
  def edit
    @domain = Domain.find(params[:id])
  end

  # POST /domains
  # POST /domains.xml
  def create

      def String.random_alphanumeric(size=16)
        s = ""
        size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
        s
      end

    @domain = Domain.new(params[:domain])
    @domain.ip = request.remote_ip
    @domain.confirmed = "no"
    @domain.confirm_code = String.random_alphanumeric
    respond_to do |format|
      if @domain.save

        ConfirmMailer.confirm_email(@domain).deliver

        format.html { redirect_to(@domain, :notice => 'Domain was successfully created.') }
        format.xml  { render :xml => @domain, :status => :created, :location => @domain }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @domain.errors, :status => :unprocessable_entity }
      end
    end
  end

  def confirm
    @domain = Domain.find(params[:id])
    @code = params[:auth_code]

    if @code == @domain.confirm_code
      @domain.confirmed = "yes"
      @domain.save
      @msg = 'You have successfully confirmed your email, you will now receive a notification when <%= @domain.domain %> becomes avaible.'
    else
    @msg = "Error validating email."  
          
    end

  end


  # PUT /domains/1
  # PUT /domains/1.xml
  def update
    @domain = Domain.find(params[:id])

    respond_to do |format|
      if @domain.update_attributes(params[:domain])
        format.html { redirect_to(@domain, :notice => 'Domain was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @domain.errors, :status => :unprocessable_entity }
      end
    end
  end

  def checkdomains
    Domain.check_domains
  end


  # DELETE /domains/1
  # DELETE /domains/1.xml
  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy

    respond_to do |format|
      format.html { redirect_to(domains_url) }
      format.xml  { head :ok }
    end
  end
end
