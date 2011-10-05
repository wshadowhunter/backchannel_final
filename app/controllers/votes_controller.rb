class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])
    @vote.pid = params[:pid]
    @vote.uid = params[:uid]
    @vote.sub_level = params[:sub_level]

    if(@vote.sub_level == 0)
        @product = Product.find(@vote.pid)
    else
        @product = ReplyTopic.find(params[:rid])
    end

    if(@product.uid != @vote.uid)

      @Old_Vote = Vote.find(:all, :conditions => ["pid = '#{@vote.pid}' and uid = '#{@vote.uid}' and sub_level = '#{@vote.sub_level}' "])

      if @Old_Vote.empty?

        @product.vote_num =  @product.vote_num + 1
        @product.update_attributes(params[:product])

        respond_to do |format|
          if @vote.save
            format.html { redirect_to @vote, notice: 'Thanks for voting.' }
            format.json { render json: @vote, status: :created, location: @vote }
          else
            format.html { render action: "new" }
            format.json { render json: @vote.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to products_path, notice: 'Already vote for this topic'
      end

    else
        redirect_to products_path, notice: 'Can not vote yourself.'
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :ok }
    end
  end
end
