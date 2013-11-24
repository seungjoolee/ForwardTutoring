module ResourcesHelper

def getTopicTitle(topic_id)
  Topic.find(topic_id).title
end
end
