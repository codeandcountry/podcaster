xml.instruct!

xml.rss "xmlns:atom"=>"http://www.w3.org/2005/Atom", "xmlns:itunes"=>"http://www.itunes.com/dtds/podcast-1.0.dtd", :version=>"2.0" do
  xml.channel do
    xml.atom :link, :href=>@feed.atom_link, :rel=>"self", :type=>"application/rss+xml"
    xml.title @feed.title
    xml.link @feed.link
    xml.description @feed.description
    xml.itunes :subtitle, @feed.subtitle
    xml.itunes :summary, @feed.summary

    xml.language @feed.language
    xml.copyright @feed.copyright
    xml.itunes :owner do
      xml.itunes :name, @feed.owner_name
      xml.itunes :email, @feed.owner_email
    end

    xml.lastBuildDate @feed.last_build_date
    xml.pubDate @feed.published_date
    xml.ttl @feed.ttl
    xml.skipDays do
      xml.day "Sunday" #todo
    end

    xml.generator @feed.generator
    xml.docs @feed.docs
    xml.itunes :author, @feed.author
    xml.itunes :image, :href=>@feed.image_url

    xml.image do
      xml.url @feed.image_url
      xml.title @feed.image_title
      xml.width @feed.image_width
      xml.height @feed.image_height
      xml.link @feed.image_link
    end

    xml.itunes :explicit, @feed.is_explicit

    #todo
    xml.itunes :category, :text=>"Business"
    xml.itunes :category, :text=>"Investing"
    xml.itunes :category, :text=>"Kids & Family"
    xml.itunes :category, :text=>"Health"
    xml.itunes :category, :text=>"Self-Help"

    #items!
    @episodes.each do |episode|
      xml.item do
        xml.title episode.title
        xml.itunes :subtitle, episode.subtitle
        xml.itunes :summary, episode.summary
        xml.enclosure :length=>episode.length, :type=>"audio/mpeg", :url=>episode.url

        xml.itunes :author, episode.author
        xml.link episode.link
        xml.guid episode.guid, :isPermaLink=>"false"

        #todo
        xml.category "Educational"
        xml.category "Dave Ramsey"
        xml.category "Money"
        xml.category "Financial"
        xml.category "Life"

        xml.pubDate episode.published

        #todo
        xml.itunes :keywords, "Dave, Ramsey, Financial, Peace, radio, debt, bankruptcy, budget, counseling, money, retirement, saving"
      end
    end

  end
end



#xml.episodes do
#      @episodes.each do |episode|
#        xml.episode do
#          xml.title episode.title
#          xml.subtitle episode.subtitle
#          xml.url episode.url
#        end
#      end
#    end

