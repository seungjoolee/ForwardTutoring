module TopicsHelper

  def getDescriptionSummary(description)
    if (description.length < 64)
      return description
    else
      return description[0..64] + "..."
    end
  end
end
