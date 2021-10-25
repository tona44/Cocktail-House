class Notification < ApplicationRecord
  
  belongs_to :user
	belongs_to :from_user, class_name: "User"

	validates :user_id, presence: true
	validates :from_user_id, presence: true
	validates :variety, presence: true
# 	validates :cocktail_id, presence: true

	default_scope -> { order(created_at: :desc) }  #最新順
	
	
# 	def relative_post_date(created_at)
# 	  sec = (Time.zone.now - created_at).round
#   	  days = sec / (60 * 60 * 24)
#   	  return "#{days}d" unless days.zero?
	  
# 	    hours = sec / (60 * 60)
# 	    return "#{hours}h" unless hours.zero?
	    
# 	    min = sec / 60
# 	    return "#{min}m" unless min.zero?
	    
# 	    "#{sec}s"
# 	end

end
