require "mp3info"

class Episode < ActiveRecord::Base
  include ActionView::Helpers::AssetTagHelper
  belongs_to :feed
  just_define_datetime_picker :published

  has_attached_file :mp3, {
    # Choose the FTP storage backend
    :storage => :ftp,

    :path => lambda { |attachment| attachment.instance.ftp_path },
    :url => lambda { |attachment| attachment.instance.ftp_url },

    # The list of FTP servers to use
    :ftp_servers => [
      {
        :host     => ENV['FTP_HOST'],
        :user     => ENV['FTP_USER'],
        :password => ENV['FTP_PASSWORD']
      }
    ]
  }

  validates_attachment :mp3, content_type: { content_type: ["audio/mpeg3", "audio/x-mpeg-3", 'audio/mp3', 'application/x-mp3'] } 
  after_post_process :read_id3

  def url
<<<<<<< HEAD
    if feed
      if feed.uses_podtrac
        "http://www.podtrac.com/pts/redirect.mp3/"+file_url
      else
        furl = file_url
        if furl[/\Ahttp:\/\//] || furl[/\Ahttps:\/\//]
          furl
        else
          "http://#{furl}"
        end
      end
    end
  end

  def ftp_path
    if feed 
      feed.ftp_folder_path+"/:filename"
    else
      ENV['FTP_DEFAULT_PATH']+"/:filename"
    end
  end

  def ftp_url
    if feed 
      feed.ftp_folder_url+"/:filename"
=======
    if feed && feed.uses_podtrac
      "http://www.podtrac.com/pts/redirect.mp3/#{read_attribute(:url)}"
>>>>>>> master
    else
      ENV['FTP_DEFAULT_URL']+"/:filename"
    end
  end

  def audio_player
    if mp3_file_name
      audio_tag(url, autoplay: false, controls: true)
    end
  end



  protected
    def read_id3
      Mp3Info.open(mp3.queued_for_write[:original].path) do |mp3info|

        self.title = self.title || mp3info.tag2.TIT2
        self.author = self.author || mp3info.tag2.TPE1
        self.length = self.length || mp3info.tag2.TLEN
        self.summary = self.summary || mp3info.tag2.COMM

        #TODO image = mp3info.tag2.APIC ftp?
      end
    end

    def file_url
      if mp3_file_name
        "#{feed.ftp_folder_url}#{mp3.path}"
      else
        read_attribute(url)
      end
    end

end
