json.extract! savedmsg, :id, :text, :created_at, :updated_at
json.url savedmsg_url(savedmsg, format: :json)
