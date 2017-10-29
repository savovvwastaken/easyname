$curID = 0

def get_id
	$curID += 1
	return $curID
end

class WelcomeController < ApplicationController
	def index
	end
	
	def read
		gid = params[:id]
		data = Savedmsg.find_by_id(gid.to_i)
		if data.class == NilClass
			render plain: "ne"
			return 0
		end
		msg = data.send(:text).to_s
		render plain: msg
		Savedmsg.destroy(gid.to_i)
	end

	def new
		text = params[:text]
		id = get_id
		Savedmsg.create(:id => id, :text => text)
		render plain: "https://hw1312.herokuapp.com/messages/" + id
	end
end
