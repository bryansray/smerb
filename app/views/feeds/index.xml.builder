xml.instruct!
xml.rss1 :version => "2.0", 'xmlns:atom' => "http://www.w3.org/2005/Atom"  do
  xml.channel do
    xml.title "BryanRay.NET"
    xml.description "Pragmatic, Agile, Development with a range of technologies from Ruby, Rails, Merb, .NET and others."
    xml.link "http://bryanray.net"
    xml.pubDate "Fri, Jul 2008 17:00:00 CST"
    xml.generator "http://smerb.com?v=0.1.2"
    xml.language "en"
    
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.link "http://bryanray.net" + url(:slug, :year => post.published_at.year, :month => post.published_at.month, :day => post.published_at.day, :slug => post.slug)
        xml.pubDate post.published_at.strftime "%a, %m %b %Y %H:%M:%S CST"
        xml.author "bryan@bryanray.net (Bryan Ray)"
        xml.guid "http://www.bryanray.net" + url(:slug, :year => post.published_at.year, :month => post.published_at.month, :day => post.published_at.day, :slug => post.slug), :isPermaLink => false
        xml.description do
          xml.cdata! post.to_html
        end
      end
    end
  end
end