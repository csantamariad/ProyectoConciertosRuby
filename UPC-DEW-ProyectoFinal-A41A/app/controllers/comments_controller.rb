class CommentsController < ApplicationController
  def add_comment
    Rails.logger.info "=========================================== ADD COMMENT"
    ordinal = params[:ordinal]

    @comment =Comment.new
    @comment.content = params[:content]
    # no esta manteniendo la sesion
    @comment.user = current_user

    new_ordinal = ""
    if ordinal == "-1"
      new_ordinal = "#{(Comment.where(:concert_id=>params[:concert_id]).order("ordinal").find(:all, :conditions => ["ordinal like ?","%-"]).count + 1)}" + "-"
    else
      nested_comments= (Comment.where(:concert_id=>params[:concert_id]).order("ordinal").find(:all, :conditions => ["ordinal like ?","#{ordinal}%-"]).count+1)
      Rails.logger.info "Number of nested_comments: #{nested_comments}"
      if nested_comments == 0
        new_ordinal =  "#{ordinal}#{nested_comments}-"
      else
        new_ordinal =  "#{ordinal}#{nested_comments}-"
      end
    end


    @comment.ordinal = new_ordinal


    @comment.save

    respond_to do |format|
      format.json { render json: @comment }
    end
    Rails.logger.info "=========================================== END: ADD COMMENT"
  end

  def get_comments
    @comments = Comment.order('ordinal').all
    if params[:concert_id]
      @comments = Comment.where(:concert_id => params[:concert_id]).order('ordinal')
    end

    respond_to do |format|
      format.html {render :layout => false}
      format.json { render json: @comments }
    end

  end
end
