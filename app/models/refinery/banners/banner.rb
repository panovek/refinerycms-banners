module Refinery
  module Banners
    class Banner < Refinery::Core::BaseModel
      self.table_name = 'refinery_banners'

      belongs_to :image, :class_name => '::Refinery::Image'

      acts_as_indexed :fields => [:title, :description]

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

    end
  end
end
