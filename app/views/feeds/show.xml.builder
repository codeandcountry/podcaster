xml.instruct!

xml.rss "xmlns:atom"=>"http://www.w3.org/2005/Atom", "xmlns:itunes"=>"http://www.itunes.com/dtds/podcast-1.0.dtd", :version=>"2.0" do
  xml.channel do
    xml.atom :link, :href=>@feed.atom_link, :rel=>"self", :type=>"application/rss+xml"
    xml.title @feed.title
    xml.itunes :subtitle, @feed.subtitle
    xml.link @feed.link

    xml.description do
      xml.cdata! @feed.description
    end
    xml.itunes :summary do 
      xml.cdata! @feed.summary
    end

    xml.language @feed.language
    xml.copyright @feed.copyright

    xml.managingEditor @feed.managing_editor
    xml.webMaster @feed.web_master

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
    @feed.categories.split(/, ?/).each do |category|
      xml.itunes :category, :text=>category
    end

    #items!
    @episodes.each do |episode|
      xml.item do
        xml.title episode.title
        xml.itunes :subtitle, episode.subtitle
        xml.itunes :summary do
          xml.cdata! episode.summary
        end
        xml.enclosure :length=>episode.length, :type=>"audio/mpeg", :url=>episode.url

        xml.itunes :image, episode.image
        xml.itunes :order, episode.order
        xml.comments episode.comments_url
        xml.source feed_url(:slug => @feed.slug, :format => 'xml')

        xml.itunes :author, episode.author
        xml.link episode.link
        xml.guid episode.guid, :isPermaLink=>"false"

        episode.categories.split(/, ?/).each do |category|
          xml.category category
        end

        xml.pubDate episode.published

        xml.itunes :keywords, episode.keywords
      end
    end

  end
end
