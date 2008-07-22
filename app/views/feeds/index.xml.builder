xml.instruct!
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "BryanRay.NET"
    xml.description "Pragmatic, Agile, Development with a range of technologies from Ruby, Rails, Merb, .NET and others."
    xml.atom :href => "http://bryanray.net/feed", :rel => "self", :type => "application/rss+xml"
    xml.link "http://bryanray.net"
    xml.pubDate "Sat, 12 Jul 2008 20:13:26"
    xml.generator "http://smerb.com?v=0.1.2"
    xml.language "en"
    
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.link "http://bryanray.net" + url(:slug, :year => post.published_at.year, :month => post.published_at.month, :day => post.published_at.day, :slug => post.slug)
        xml.pubDate post.published_at
        xml.author "bryan@bryanray.net"
        xml.guid post.id, :isPermaLink => false
        xml.description post.to_html
      end
    end
  end
end