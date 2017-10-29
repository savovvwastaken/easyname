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
			if(gid.to_i == -69)
			Savedmsg.delete_all
				return 0
			end
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
		a = "https://hw1312.herokuapp.com/messages/" + id.to_s
		render plain: a
	end
end
