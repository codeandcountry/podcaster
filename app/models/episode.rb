require "mp3info"

class Episode < ActiveRecord::Base
  belongs_to :feed

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

  validates_attachment :mp3, content_type: { content_type: ["audio/mpeg3", "audio/x-mpeg-3", 'audio/mp3', 'application/x-mp3', "image/png"] } 
  after_post_process :read_id3

  def url
    if feed.uses_podtrac
      "http://www.podtrac.com/pts/redirect.mp3/"+file_url
    else
      file_url
    end
  end

  def file_url
    if mp3
      "#{feed.ftp_folder_url}#{mp3.path}"
    else
      read_attribute(url)
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
    else
      ENV['FTP_DEFAULT_URL']+"/:filename"
    end
  end

  protected
    def read_id3
      Mp3Info.open(mp3.queued_for_write[:original].path) do |mp3info|
        if id
          puts "id exists, update details"
          Episode.update(id, :title => mp3info.tag2.TIT2, :author => mp3info.tag2.TPE1, :length => mp3info.tag2.TLEN, :summary => mp3info.tag2.COMM)
        end
        puts "update details in memory"
        self.title = mp3info.tag2.TIT2
        self.author = mp3info.tag2.TPE1
        self.length = mp3info.tag2.TLEN
        self.summary = mp3info.tag2.COMM

        #image = mp3info.tag2.APIC ftp?
        #binding.pry
      end
    end

end
