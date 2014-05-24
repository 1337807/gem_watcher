class List < ActiveRecord::Base
  belongs_to :user

  validate :either_body_or_url

  private

  def either_body_or_url
    if [self.body, self.url].reject(&:blank?).empty?
      errors[:base] << ("You must include either a list of gems or a file where we can extract the list.")
    end
  end
end
