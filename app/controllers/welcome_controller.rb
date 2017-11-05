require 'nokogiri'
$curID = 0

def get_id
	$curID += 1
	return $curID
end

class WelcomeController < ApplicationController
	protect_from_forgery unless: -> {request.format.json? }
	def index
	end
	
	def read
	
		gid = params[:id]
			if(gid.to_i == -69)
				$curID = 0
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
	
	def api
		data = request.headers["Content-Type"]
		
		if data == "application/json"
			danni = params[:message]
		elsif data == "text/xml"
			danni = Nokogiri::XML(request.body.read)
		end
		
		id = get_id
		a = "https://hw1312.herokuapp.com/messages/" + id.to_s
		hash = Hash.new
		hash["url"] = a
		
		Savedmsg.create(:text => danni, :id => id)
		if data == "application/json"
			render json: hash
		elsif data == "text/xml"
			render xml: hash
		end
	end
end
