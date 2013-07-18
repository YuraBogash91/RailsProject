module ApplicationHelper

  def urls_to_images (s1)
   raw s1.gsub /\s(http:\/\/.*?\.(png|jpg))\s/, '<p><img width=200 height =100 src="\1"/></p>'


   end
  def urls_to_link (s1)
   raw s1.gsub /\s(http:\/\/.*?)\s/, '<p><a href="\1">\1</a></p>'

  end
end
