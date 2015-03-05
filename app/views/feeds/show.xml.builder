xml.instruct!

xml.rss "xmlns:atom"=>"http://www.w3.org/2005/Atom", "xmlns:itunes"=>"http://www.itunes.com/dtds/podcast-1.0.dtd", :version=>"2.0" do
  xml.channel do
    xml.atom :link, :href=>"http://www.daveramsey.com/media/audio/podcast/podcast.xml", :rel=>"self", :type=>"application/rss+xml"
    xml.title "The Dave Ramsey Show"
    xml.link "http://www.daveramsey.com?ectid=itunes"
    xml.description "The Dave Ramsey Show is about real life and how it revolves around money. Dave Ramsey teaches you to manage and budget your money, get out of debt, build wealth, and live in financial peace. Managing your money properly will reduce stress, improve your marriage, and provide security for you and your family. Updated: Wed, 04 Mar 2015"
    xml.itunes :subtitle, "The Dave Ramsey Show is about real life and how it revolves around money. Dave Ramsey teaches you to manage and budget your money, get out of debt, build wealth, and live in financial peace. Updated: Wed, 04 Mar 2015"
    xml.itunes :summary, "The Dave Ramsey Show is about real life and how it revolves around money. Dave Ramsey teaches you to manage and budget your money, get out of debt, build wealth, and live in financial peace. Managing your money properly will reduce stress, improve your marriage, and provide security for you and your family. Updated: Wed, 04 Mar 2015"

    xml.language "en-us"
    xml.copyright "Copyright 2015"
    xml.itunes :owner do
      xml.itunes :name, "Lampo Licensing, LLC."
      xml.itunes :email, "webmaster@daveramsey.com"
    end

    xml.lastBuildDate "Wed, 04 Mar 2015 16:00:00 -0500"
    xml.pubDate "Wed, 04 Mar 2015 16:00:00 -0500"
    xml.ttl "720"
    xml.skipDays do
      xml.day "Sunday"
    end

    xml.generator "http://www.daveramsey.com?ectid=itunes"
    xml.docs "http://www.daveramsey.com/media/audio/podcast"
    xml.itunes :author, "Dave Ramsey"
    xml.itunes :image, :href=>"http://a248.e.akamai.net/f/1611/23575/9h/dramsey.download.akamai.com/23572/daveramsey.com/media/image/general/itunes_img_640px.jpg"

    xml.image do
      xml.url "http://a248.e.akamai.net/f/1611/23575/9h/dramsey.download.akamai.com/23572/daveramsey.com/media/image/general/itunes_img_640px.jpg"
      xml.title "The Dave Ramsey Show"
      xml.width "144"
      xml.height "144"
      xml.link "http://www.daveramsey.com?ectid=itunes"
    end

    xml.itunes :explicit, "No"

    xml.itunes :category, :text=>"Business"
    xml.itunes :category, :text=>"Investing"
    xml.itunes :category, :text=>"Kids & Family"
    xml.itunes :category, :text=>"Health"
    xml.itunes :category, :text=>"Self-Help"

    #items!
    xml.item do
      xml.title "Wed, 04 Mar 2015 - Hour 1"
      xml.itunes :subtitle, "The Dave Ramsey Show"
      xml.itunes :summary, "The Dave Ramsey Show is about real life and how it revolves around money. Dave Ramsey teaches you to manage and budget your money, get out of debt, build wealth, and live in financial peace. Managing your money properly will reduce stress, improve your marriage, and provide security for you and your family. Updated: Wed, 04 Mar 2015"
      xml.enclosure :length=>"16371511", :type=>"audio/mpeg", :url=>"http://a1611.g.akamai.net/f/1611/23422/9h/dramsey.download.akamai.com/23572/audio/mp3/dr_3hr_podcast/03042015_the_dave_ramsey_show_itunes_1.mp3"

      xml.itunes :author, "Lampo Licensing, LLC."
      xml.link "http://www.daveramsey.com?ectid=itunes"
      xml.guid "TDRS03042015-1", :isPermaLink=>"false"

      xml.category "Educational"
      xml.category "Dave Ramsey"
      xml.category "Money"
      xml.category "Financial"
      xml.category "Life"

      xml.pubDate "Wed, 04 Mar 2015 15:00:00 -0500"

      xml.itunes :keywords, "Dave, Ramsey, Financial, Peace, radio, debt, bankruptcy, budget, counseling, money, retirement, saving"
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

