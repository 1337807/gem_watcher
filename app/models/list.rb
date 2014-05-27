require 'rest_client'

class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_gems
  has_many :jems, through: :list_gems

  validate :either_body_or_url

  def self.update_all!
    List.all.each do |list|
      list.update_body!
      list.parse_body!
    end
  end

  def update_body!
    update_attributes(body: RestClient.get(url))
  end

  def parse_body!
    gem_names = ListParser.new.parse_gem_names(body)
    gems = gem_names.map { |gem_name| Jem.create(name: gem_name) }
    jems << gems
  end

  private

  def either_body_or_url
    if [self.body, self.url].reject(&:blank?).empty?
      errors[:base] << ("You must include either a list of gems or a file where we can extract the list.")
    end
  end
end
