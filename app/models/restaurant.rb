class Restaurant < ActiveRecord::Base
	has_many :reviews
	validates :name, length: {minimum: 3}, uniqueness: true
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_attached_file :image, 	:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
											 :default_url => "/images/:style/missing.png",
                    			:storage => :s3,
                    			:s3_credentials => Proc.new{|a| a.instance.s3_credentials }
                    	
  def s3_credentials
    {:bucket => "makersyelpclone", :access_key_id => Rails.application.secrets.access_key_id, :secret_access_key => Rails.application.secrets.secret_access_key}
  end

	def average_rating
		return 'N/A' if reviews.none?
		reviews.average(:rating)
	end

end
