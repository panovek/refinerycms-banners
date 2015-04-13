module Refinery
  module Banners
    class Banner < Refinery::Core::BaseModel
      self.table_name = 'refinery_banners'

      enum banner_type: [:большой, :боковой]
      OPTIONS = {banner_types[:большой] => {width: 790, height: 90}, banner_types[:боковой] => {width: 175, height: 110}}

      belongs_to :image, :class_name => '::Refinery::Image'

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true
      validates_presence_of :start_date
      validates_length_of :title, :in => 0..255
      validates_length_of :description, :in => 0..255, :allow_nil => true

      #has_and_belongs_to_many :pages

      scope :not_expired, -> {
        banners = Arel::Table.new(Banner.table_name)
        where(banners[:expiry_date].eq(nil).or(banners[:expiry_date].gt(Time.now)))
      }
      scope :active, -> {where(is_active: true)}
      scope :published, -> {
        not_expired.active.where("start_date <= ?", Time.now).order(:position)
      }

      scope :right_side_banners, -> { where(banner_type: banner_types[:боковой]) }
      scope :left_side_banners, -> { where(banner_type: banner_types[:боковой]) }
      scope :center_banners, -> { where(banner_type: banner_types[:большой]) }
    end
  end
end
