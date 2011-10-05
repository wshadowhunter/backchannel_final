class ReplyTopicsController < ApplicationController
  # GET /reply_topics
  # GET /reply_topics.json
  def index
    @reply_topics = ReplyTopic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reply_topics }
    end
  end

  # GET /reply_topics/1
  # GET /reply_topics/1.json
  def show
    @reply_topic = ReplyTopic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reply_topic }
    end
  end

  # GET /reply_topics/new
  # GET /reply_topics/new.json
  def new
    @reply_topic = ReplyTopic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reply_topic }
    end
  end

  # GET /reply_topics/1/edit
  def edit
    @reply_topic = ReplyTopic.find(params[:id])
  end

  # POST /reply_topics
  # POST /reply_topics.json
  def create
    @reply_topic = ReplyTopic.new(params[:reply_topic])
    @reply_topic.uid = params[:uid]
    @reply_topic.pid = params[:pid]
    @reply_topic.name = User.find(params[:uid]).name
    @reply_topic.vote_num = 0

    respond_to do |format|
      if @reply_topic.save
        format.html { redirect_to @reply_topic, notice: 'Click edit to fill your content' }
        format.json { render json: @reply_topic, status: :created, location: @reply_topic }
      else
        format.html { render action: "new" }
        format.json { render json: @reply_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reply_topics/1
  # PUT /reply_topics/1.json
  def update
    @reply_topic = ReplyTopic.find(params[:id])

    respond_to do |format|
      if @reply_topic.update_attributes(params[:reply_topic])
        format.html { redirect_to @reply_topic, notice: 'Reply topic was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @reply_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reply_topics/1
  # DELETE /reply_topics/1.json
  def destroy
    @reply_topic = ReplyTopic.find(params[:id])
    @reply_topic.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end
end
