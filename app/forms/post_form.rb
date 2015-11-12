class PostForm
  include ActiveModel::Model
  POST_COLUMNS = [:title,
                  :subtitle,
                  :content,
                  :slug,
                  :in_reply_to,
                  :private,
                  :published_at]
  attr_accessor :klass,
                :post,
                :post_type

  delegate      :title,
                :subtitle,
                :content,
                :slug,
                :in_reply_to,
                :private,
                :published_at,
                :post_type_id,
                :post_type_type,
                to: :post,
                allow_nil: true


  def initialize(klass, post)
    @klass     = klass
    @columns   = klass.columns.map(&:name)
    @post      = post || Post.new
    @post_type = post.post_type || klass.new
    define_attr_accessor(@columns)
  end

  def model_name
    ActiveModel::Name.new(self, nil, @klass.to_s)
  end

  def persisted?
    @post.persisted?
  end

  def submit(params)
    @post = Post.new(params.permit(self.class::POST_COLUMNS))
    @post_type = @klass.new(params.permit(@columns))
    @post_type.post = @post
    @post.post_type = @post_type
    if @post.valid? && @post_type.valid?
      @post.save! && @post_type.save!
    end
  end

  def path
    @post_type.path
  end

  private

  def define_attr_accessor(columns)
    self.class.class_eval do
      columns.each do |col|
        attr_accessor col.to_sym
      end
    end
  end

end
