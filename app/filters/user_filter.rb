class UserFilter
  include ActiveModel::API
  include ActiveModel::Attributes

  attribute :query, :string

  attr_reader :users

  def initialize(users, params)
    super(params)

    @users = users
  end

  def call
    by_query!

    users
  end

  def by_query!
    return if query.blank?
    #@users = users.where(name: query).or(users.where(lastname: query)) 
    @users = users.where('name ILIKE :query OR lastname ILIKE :query', query: "%#{query}%")
  end
end

