class Episode < ActiveRecord::Base
  belongs_to :feed

  has_attached_file :mp3, {
    # Choose the FTP storage backend
    :storage => :ftp,


    #:path => ftp_path+"/:filename",
    #:url => feed.ftp_folder_url+"/:filename",
    #:path => "/:filename",
    #:url => "www.codeandcountry.com/uploadtest/:filename",


    :path => lambda { |attachment| attachment.instance.ftp_path },
    :url => lambda { |attachment| attachment.instance.ftp_url },

    # The list of FTP servers to use
    :ftp_servers => [
      {
        :host     => "ftp.codeandcountry.com",
        :user     => "test@flashharris.com",
        :password => "uploadtest"
      }
    ]
  }

  validates_attachment :mp3, content_type: { content_type: ["audio/mpeg3", "audio/x-mpeg-3", "image/png"] } 

  def url
    if feed.uses_podtrac
      "http://www.podtrac.com/pts/redirect.mp3/#{feed.ftp_folder_url}#{mp3.path}"
    else
      "#{feed.ftp_folder_url}#{mp3.path}"
    end
  end

  def ftp_path
    if feed 
      f = feed.ftp_folder_path+"/:filename"
    else
      f = "/:filename"
    end
    puts f
    f
  end

  def ftp_url
    if feed 
      f = feed.ftp_folder_url+"/:filename"
    else
      f = "www.default.com/:filename"
    end
    puts f
    f
  end

end
