module ResourcesHelper

  def getTopicTitle(topic_id)
    Topic.find(topic_id).title
  end

  def getPdfName(resource_id)
    @resource = Resource.find(resource_id)
    if @resource.respond_to?(:pdf_file_name)
      @resource.pdf_file_name
    else
      ""
    end
  end
end
