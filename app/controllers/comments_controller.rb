class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :perform_authorization, only: %i[show create update]

  # GET /comments
  def index
    @comments = Comment.where(product_id: params[:id])
    render json: @comments
  end

  # POST /comments
  def create
    comment = create_comment(params)
    update_product(params)
    render json: comment, status: :created
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.user.id == current_user.id
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unauthorize' }, status: :not_acceptable
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment.user.id == current_user.id
      @comment.destroy
      product = Product.find(params[:product_id])
      product.update_attribute(:number_review, product.number_review - 1)
    else
      render json: { error: 'Unauthorize' }, status: :not_acceptable
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:title, :content)
    end

    def create_comment(params)
       Comment.create(
        title: params[:title],
        content: params[:content],
        user_id: current_user.id,
        product_id: params[:product_id]
      )
    end

    def update_product(params)
      product = Product.find(params[:product_id])
      product.update_attribute(:number_review, product.number_review + 1)
    end
  end
